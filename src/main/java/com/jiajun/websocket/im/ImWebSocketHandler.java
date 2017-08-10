package com.jiajun.websocket.im;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
 * 
 * 集群环境下的 im websocket
 * 
 * im:即时通信, 消息不做持久化处理
 * 
 * 
 * @Date 2017/08/10 10时
 */
@Component
public class ImWebSocketHandler extends TextWebSocketHandler{
	
	/**
	 * @key username
	 * @value session
	 */
	private final Map<String, WebSocketSession> imSocketMap = new ConcurrentHashMap<>();
	
	private static Logger logger = LoggerFactory.getLogger(ImWebSocketHandler.class);
	
	
	@Value("${redis.channel.im}")
	private String channel;
	
	@Value("${redis.im.key}")
	private String redisKey;
	
	@Autowired
	private RedisDao redisDao;
	
	/**
	 * connection chart room
	 * 1.add to collection
	 * 2.send to other user_join
	 * 3.send to this session all user
	 * 
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String username = (String) session.getAttributes().get("username");
		logger.info("user {} join chart room", username);
		//add to collection
		imSocketMap.put(username, session);
		redisDao.sAdd(redisKey, username);
		//send to other user_join
		redisDao.publish(channel, new EventMessage(Constant.IM_TYPE_USER_JOIN, username));
		// send all user to this session
		session.sendMessage(new TextMessage(new EventMessage(Constant.IM_TYPE_USER_LIST, this.getAllUsers()).toString()));
	}
	
	/**
	 * send to all user
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String msg = (String) message.getPayload();
		EventMessage eventMsg = new EventMessage(Constant.IM_TYPE_USER_TALK,(String)session.getAttributes().get("username"), msg);
		redisDao.publish(channel, eventMsg);
	}
	
	/**
	 * 1.remove from collection
	 * 2.send to others
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String username = (String) session.getAttributes().get("username");
		logger.info("user {} leave im room", username);
		imSocketMap.remove(username);
		redisDao.sRemove(redisKey, username);
		redisDao.publish(channel, new EventMessage(Constant.IM_TYPE_USER_LEAVE, username));
	}
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}
	
	/**
	 * send to all users
	 * @param message
	 */
	public void sendToAll(EventMessage message) {
		Iterator<Entry<String, WebSocketSession>> iterator = imSocketMap.entrySet().iterator();
		WebSocketSession session = null;
		String username = null;
		while(iterator.hasNext()) {
			Entry<String, WebSocketSession> entry = iterator.next();
			username = entry.getKey();
			try {
				session = entry.getValue();
				if(session != null && session.isOpen()) {
					session.sendMessage(new TextMessage(message.toString()));
					logger.debug("send message {} to {}", message, username);
				}
			} catch (IOException e) {
				logger.error("send message fail");
			}
		}
	}
	
	/**
	 * send to other users
	 * 
	 * @param message
	 * @param exclusiveName
	 */
	public void sendToOthers(EventMessage message, String exclusiveName) {
		Iterator<Entry<String, WebSocketSession>> iterator = imSocketMap.entrySet().iterator();
		WebSocketSession session = null;
		String username = null;
		while(iterator.hasNext()) {
			Entry<String, WebSocketSession> entry = iterator.next();
			username = entry.getKey();
			try {
				session = entry.getValue();
				if(session != null && session.isOpen() && !username.equals(exclusiveName)) {
					session.sendMessage(new TextMessage(message.toString()));
					logger.debug("send message {} to {}", message, username);
				}
			} catch (IOException e) {
				logger.error("send message fail");
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public Set<String> getAllUsers() {
		try {
			return (Set<String>) redisDao.sMembers(redisKey);
		} catch (Exception e) {
			logger.error("get all in rooms user from redis error!");
		}
		return null;
	}
	
	public Map<String, WebSocketSession> getImSocketMap() {
		return imSocketMap;
	}
}
