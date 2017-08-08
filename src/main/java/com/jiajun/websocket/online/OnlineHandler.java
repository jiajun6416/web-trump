package com.jiajun.websocket.online;

import java.io.IOException;
import java.util.Map;

import javax.websocket.Session;

import org.ehcache.impl.internal.concurrent.ConcurrentHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.stereotype.Component;

import com.jiajun.util.Constant;

/**
 * @desc  在线管理websocket容器
 * @author JIAJUN
 * @date 2017年7月30日下午4:32:30
 */
@Deprecated
public class OnlineHandler {
	
	private static Logger logger = LoggerFactory.getLogger(OnlineHandler.class);
	
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
	private Map<String, Session> onlinePool = new ConcurrentHashMap<>();
	
	/**
	 * 登陆成功时候.存储在redis中
	 * 
	 * 如果此用户已经登陆过, 则向channe发布消息, 在所有的节点中找到这个session,发送被顶掉消息
	 * 
	 */
	public void userJoin(String username, Session session) {
		Session currentSession = onlinePool.get(username);
		onlinePool.put(username, session);
		logger.info("online_user: add user , name is {}", username);

		//重复登陆, 发送下线消息
		if(currentSession != null) {
			sendReplaceMsg(currentSession);
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
	
	/**
	 * 用户离开, 只需要移除本地缓存(如果有的话)和redis中的
	 */
	public void userLeave(String username, Session session) {
		//将容器中的session与close的session对比,如果不一致则说明是被挤下去的用户
		Session currentSession = onlinePool.get(username);
		if(currentSession != null && currentSession.equals(session)) {
			logger.info("user {} leave, sys redis", username);
			SetOperations<String, String> set = redisTemplate.opsForSet();
			set.remove(online_key, username);
		}
	}
	
	public void sendReplaceMsg(Session session) {
	}
	
	public Map<String, Session> getOnlinePool() {
		return onlinePool;
	}
}
