package com.jiajun.websocket.online;

import java.io.IOException;
import java.util.Map;


import org.ehcache.impl.internal.concurrent.ConcurrentHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jiajun.util.Constant;

/**
 * 使用spring4 实现websocket
 * Created by jiajun on 2017/08/07 00:07
 */
@Component
public class OnlineWebSocketHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(OnlineWebSocketHandler.class);
	
	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	
	@Value("${redis.online.key}")
	private String online_key;
	
	@Value("${redis.channel.online_user}")
	private String channel;
	
	/**
	 * onlinePool, 当前在线, 一个用户只能在一处登陆
	 * @key: username 
	 * @value: websocket session
	 */
	private Map<String, WebSocketSession> onlinePool = new ConcurrentHashMap<>();
	
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
		WebSocketSession currentSession = onlinePool.get(username);
		onlinePool.put(username, session);
		logger.info("online_user: add user , name is {}", username);

		//重复登陆, 发送下线消息
		if(currentSession != null && currentSession.isOpen()) {
			this.sendReplaceMessage(currentSession, username);
		} else {
			//添加到redis中
			SetOperations<String, String> set = redisTemplate.opsForSet();
			Long affect = set.add(online_key, username);
			
			//此用户在其他地方登陆了,发送被挤下去消息
			if(affect.intValue() == 0) {
				String message = username+"_"+session.getId();
				logger.info("onLine_user: send replace user {} , to channel {}", username+"_"+session.getId(), channel);
				redisTemplate.convertAndSend(channel, message);
			}
		}
	}
	
	
	public void sendReplaceMessage(WebSocketSession session, String username) {
		TextMessage message = new TextMessage("{\"type\":"+Constant.MESSAGE_TYPE_USER_BE_REPLACED+", \"username\":\""+username+"\"}");
		try {
			session.sendMessage(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *  onMessage
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		logger.info("online websocket accept mssage :{}", message.getPayload());
	}
	
	/**
	 * onClose
	 * 
	 *  用户离开, 只需要移除本地缓存(如果有的话)和redis中的
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//将容器中的session与close的session对比,如果不一致则说明是被挤下去的用户
		Object username = session.getAttributes().get("username");
		WebSocketSession currentSession = onlinePool.get(username);
		if(currentSession != null && currentSession.equals(session)) {
			//用户正常离开
			logger.info("user {} leave, sys redis", username);
			SetOperations<String, String> set = redisTemplate.opsForSet();
			set.remove(online_key, username);
			
			//从容器中移除
			onlinePool.remove(username);
		}
	}
	
	/**
	 * onError
	 */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// logger.error("online websocket error", exception);
	}

	public Map<String, WebSocketSession> getOnlinePool() {
		return onlinePool;
	}
}
