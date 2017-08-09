package com.jiajun.redis.listener;

import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;

import com.jiajun.shiro.session.ShiroCacheSessionDAO;
import com.jiajun.util.SerializeUtils;

/**
 * 
 * session在集群环境下等待session共享解决
 * 
 * 订阅 shiro session同步频道
 * @author jiajun
 * @date 2017/08/05 20时
 */
public class ShiroSessionMessageListener implements MessageListener{

	private static Logger logger = LoggerFactory.getLogger(ShiroSessionMessageListener.class);
	
	@Autowired
	private ShiroCacheSessionDAO sessionDAO;
	
	@Override
	public void onMessage(Message message, byte[] pattern) {
		byte[] body = message.getBody();
		Session session = (Session) SerializeUtils.deserialize(body);
		logger.info("messgListener accept session : the id is {}", session.getId());
		sessionDAO.doUpdateCache(session);
	}
}
