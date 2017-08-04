package com.jiajun.shiro.session;

import java.io.Serializable;
import java.util.Collection;


import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jiajun.dao.redis.RedisDao;

/**
 * @Desc session DAO, 
 * 		 session是由SessionFactory根据相应subject创建的.默认是simpleSession
 * @author jiajun
 * @Date 2017/08/02 11:09:18
 * @version 1.0.0
 */
@Component
@SuppressWarnings("unchecked")
public class RedisSessionDAO extends AbstractSessionDAO{
	
	private static Logger logger = LoggerFactory.getLogger(RedisSessionDAO.class);
	
	@Autowired
	private RedisDao redisDao;
	
	private String prefix = "shiro_session_key:";
	private int timeOutSeconds = 1800;
	
	
	private Serializable getKey(Serializable key) {
		return prefix+key;
	}
	
	private String getPattern() {
		return prefix+"*";
	}
	
	@Override
	protected Serializable doCreate(Session session) {
		//创建sessionId,建立绑定关系
		Serializable sessionId = generateSessionId(session);
		assignSessionId(session, sessionId);
		try {
			Serializable key = getKey(sessionId);
			logger.debug("do create session, key id {}", key);
			redisDao.put(key, (Serializable)session, timeOutSeconds);
			return sessionId;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	@Override
	protected Session doReadSession(Serializable sessionId) {
        if (sessionId == null) {
            throw new NullPointerException("id argument cannot be null.");
        }
		Serializable key = this.getKey(sessionId);
		try {
			logger.debug("get shiro session, and touch session, the key is {}", key);
			Session session = (Session) redisDao.getAndReSetExpireTime(key, timeOutSeconds);
			return session;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public void update(Session session) throws UnknownSessionException {
        if (session == null) {
            throw new NullPointerException("session argument cannot be null.");
        }
		//如果session实现了校验接口, 而且session是失效的
		if(session instanceof ValidatingSession && !((ValidatingSession)session).isValid()) {
			return;
		} 
		Serializable sessionId = session.getId();
		Serializable key = getKey(sessionId);
		logger.debug("update shiro session, the key is {}", key);
		try {
			redisDao.put(key, (Serializable)session, timeOutSeconds);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	@Override
	public void delete(Session session) {
		Serializable sessionId = session.getId();
		Serializable key = this.getKey(sessionId);
		logger.debug("delete shiro session, the key is {}", key);
		try {
			redisDao.remove(key);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	@Override
	public Collection<Session> getActiveSessions() {
		try {
			logger.debug("get all shiro session");
			Collection<Session> values =  redisDao.values(this.getPattern());
			return values;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
