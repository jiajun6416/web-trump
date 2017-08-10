package com.jiajun.websocket.online;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.ehcache.impl.internal.concurrent.ConcurrentHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jiajun.redis.dao.RedisDao;
import com.jiajun.util.Constant;
import com.jiajun.websocket.EventMessage;

/**
 * 使用spring4 实现websocket
 * Created by jiajun on 2017/08/07 00:07
 */
@Component
public class OnlineWebSocketHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(OnlineWebSocketHandler.class);
	
	@Autowired
	private RedisDao redisDao;
	
	@Value("${redis.online.key}")
	private String online_key;
	
	@Value("${redis.channel.online_user}")
	private String channel;
	
	/**
	 * onlinePool, 当前在线, 一个用户只能在一处登陆
	 * @key: username 
	 * @value: websocket session
	 */
	private Map<String, WebSocketSession> onlineMap = new ConcurrentHashMap<>();
	
	/**
	 * 正在在线管理的用户
	 */
	private Set<WebSocketSession> onlineManagerMap = Collections.synchronizedSet(new HashSet<>());
	
	/**
	 * onopen
	 * 
	 * 此时先查询是否已经登陆过, 登陆过把前面的T掉
	 * 
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String username = (String) session.getAttributes().get("username");
		logger.info("user {} online", username);
		WebSocketSession currentSession = onlineMap.get(username);
		onlineMap.put(username, session);
		logger.info("online_user: add user , name is {}", username);

		//重复登陆, 发送下线消息
		if(currentSession != null && currentSession.isOpen()) {
			this.sendReplaceMessage(username, currentSession);
		} else {
			//添加到redis中
			Long affect = redisDao.sAdd(online_key, username);
			EventMessage message = new EventMessage();
			if(affect.intValue() == 0) {
				//向订阅频道用户被挤掉消息
				String userInfo = username+"_"+session.getId();
				message.setType( Constant.MESSAGE_TYPE_USER_BE_REPLACED);
				message.setContent(userInfo);
				logger.info("user_replaced: send replace user {} , to channel {}", username, channel);
			} else {
				//向订阅频道发送用户上线的消息
				message.setType(Constant.MESSAGE_TYPE_USER_ONLINE);
				message.setContent(username);
				logger.info("user_online: send new user {}, to channel {}", username, channel);
			}
			
			redisDao.publish(channel, message);
		}
	}
	
	/**
	 *  onMessage
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String msgContent = (String) message.getPayload();
		if(StringUtils.isEmpty(msgContent)) {
			return;
		}
		logger.info("online websocket accept mssage :{}", msgContent);
		if(Constant.MESSAGE_TYPE_USER_ONLIE_LIST.equals(msgContent)) {
			//用户在线管理
			onlineManagerMap.add(session);
			Set<String> users = this.getAllOnlineUser();
			if(session!=null && session.isOpen() ) {
				session.sendMessage(new TextMessage(new EventMessage(Constant.MESSAGE_TYPE_USER_ONLIE_LIST, users).toString()));
			}
		} else if("onlineManagerLeave".equals(msgContent)) {
			// 切出用户在线管理页面
			if(onlineManagerMap.contains(session)) {
				onlineManagerMap.remove(session);
			}
		} else if(msgContent.startsWith(Constant.MESSAGE_TYPE_USER_GO_OUT)) {
			//用户被T出
			String username = msgContent.split(":")[1];
			if(StringUtils.isEmpty(username) || "admin".equals(username)) {
				return;
			} else {
				//向channel发送用户被T出信息
				redisDao.publish(channel, new EventMessage(Constant.MESSAGE_TYPE_USER_GO_OUT, username));
			}
		}
	}
	
	/**
	 * onClose
	 * 
	 *  用户离开, 需要移除本地缓存(如果有的话)和redis中的
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//将容器中的session与close的session对比,如果不一致则说明是被挤下去的用户
		String username = (String) session.getAttributes().get("username");
		WebSocketSession currentSession = onlineMap.get(username);
		if(currentSession != null && currentSession.equals(session)) {
			//用户正常离开
			logger.info("user {} leave, sys redis", username);
			redisDao.sRemove(online_key, username);
			//从容器中移除
			onlineMap.remove(username);
			if(onlineManagerMap.contains(session)) {
				onlineManagerMap.remove(session);
			}
			//向频道中发送用户下线消息
			redisDao.publish(channel, new EventMessage(Constant.MESSAGE_TYPE_USER_LOGOUT, username));
		}
	}
	
	/**
	 * onError
	 */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// logger.error("online websocket error", exception);
	}

	/**
	 * 发送用户被替代的消息
	 * @param session
	 * @param username
	 */
	public void sendReplaceMessage(String username, WebSocketSession session) {
		//移出容器中的此session, 集群环境下一定判断
		if(onlineMap.get(username) != null && onlineMap.get(username).equals(session)) {
			onlineMap.remove(username);
		}
		EventMessage message = new EventMessage();
		message.setType(Constant.MESSAGE_TYPE_USER_BE_REPLACED);
		TextMessage textMsg = new TextMessage(message.toString());
		
		try {
			if(session != null && session.isOpen()) {
				session.sendMessage(textMsg);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 发送用户被T出消息
	 * @param session
	 * @param username
	 */
	public void sendGoOutMessage(WebSocketSession session) {
		EventMessage message = new EventMessage();
		message.setType(Constant.MESSAGE_TYPE_USER_GO_OUT);
		TextMessage textMsg = new TextMessage(message.toString());
		try {
			if(session != null && session.isOpen()) {
				session.sendMessage(textMsg);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 当有用户上线或者下线的时候发送在线用户列表信息
	 * @param session
	 * @param username
	 */
	public void sendOnlineUsers() {
		if(onlineManagerMap != null && onlineManagerMap.size() > 0) {
			//转船出一个副本, 防止遍历时候其他线程修改
			WebSocketSession[] sessions = new WebSocketSession[onlineManagerMap.size()];  //注意: collection转数组必须先定义好长度,不能object[]类型不能强转
			onlineManagerMap.toArray(sessions);
			for (WebSocketSession session : sessions) {
				try {
					if(session != null && session.isOpen()) {
						session.sendMessage(new TextMessage(new EventMessage(Constant.MESSAGE_TYPE_USER_ONLIE_LIST, getAllOnlineUser()).toString()));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	/**
	 * 查询redis获得所有的在线用户
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private Set<String> getAllOnlineUser() {
		try {
			return (Set<String>) redisDao.sMembers(online_key);
		} catch (Exception e) {
			logger.error("get all online users error", e);
		}
		return null;
	}
	
	public Map<String, WebSocketSession> getOnlineMap() {
		return onlineMap;
	}
}
