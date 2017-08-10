package com.jiajun.shiro.session;

import java.io.Serializable;
import java.util.Collection;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.jiajun.redis.dao.RedisDao;


/**
 * 针对自定义的ShiroSession的Redis CRUD操作，通过isChanged标识符，确定是否需要调用Update方法
 * 通过配置securityManager在属性cacheManager查找从缓存中查找Session是否存在，如果找不到才调用下面方法
 * 
 * @author jiajun
 * @date 2017/08/05 13时
 */
@SuppressWarnings("unchecked")
public class ShiroCacheSessionDAO extends CachingSessionDAO {

	private static Logger logger = LoggerFactory.getLogger(RedisSessionDAO.class);

	@Autowired
	private RedisDao redisDao;
	@Value("${redis.channel.shirosession}")
	private String channel;
	
	private String prefix;

	private int timeOutSeconds;

	public void setTimeOutSeconds(int timeOutSeconds) {
		this.timeOutSeconds = timeOutSeconds;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	private Serializable getKey(Serializable key) {
		return prefix + key;
	}

	private String getPattern() {
		return prefix + "*";
	}

	@Override
	protected Serializable doCreate(Session session) {
		// 创建sessionId,建立绑定关系
		Serializable sessionId = generateSessionId(session);
		assignSessionId(session, sessionId);
		try {
			Serializable key = getKey(sessionId);
			logger.info("create session, key id {}", key);
			redisDao.put(key, (Serializable) session, timeOutSeconds);
			return sessionId;
		} catch (Exception e) {
			logger.error("create session failure", e);
		}
		return null;
	}

	/**
	 * 重写CachingSessionDAO中readSession方法，如果Session中没有登陆信息就调用doReadSession方法从Redis中重读
	 * session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null
	 * 代表没有登录，登录后Shiro会放入该值
	 */
	@Override
	public Session readSession(Serializable sessionId) throws UnknownSessionException {
		Session session = getCachedSession(sessionId);
	//	if (session == null || session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
		if (session == null ) {	
			session = doReadSession(sessionId);
			if (session == null) {
				logger.info("can not found session by sessionId {}: mybe session is expired" , sessionId);
				return null;
			} else {
				cache(session, sessionId);
			}
		}
		return session;
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
        if (sessionId == null) {
            throw new NullPointerException("id argument cannot be null.");
        }
		Serializable key = this.getKey(sessionId);
		try {
			logger.info("get shiro session, and touch session, the key is {}", key);
			Session session = (Session) redisDao.getAndReSetExpireTime(key, timeOutSeconds);
			return session;
		} catch (Exception e) {
			logger.error("can not found session by sessionId: {} in redis", sessionId, e);
		}
		return null;
	}

	@Override
	protected void doUpdate(Session session) {
        if (session == null) {
            throw new NullPointerException("session argument cannot be null.");
        }
		//如果session实现了校验接口, 而且session是失效的
		if(session instanceof ValidatingSession && !((ValidatingSession)session).isValid()) {
			return;
		} 
		SimpleShiroSession shiroSession = (SimpleShiroSession)session;
		
		if(!shiroSession.isChanged()) {
			return;
		}
		shiroSession.setChanged(false);
		//刷新最后访问时间, 用作同步的标识
	//	shiroSession.setLastAccessTime(new Date());
		Serializable sessionId = session.getId();
		Serializable key = getKey(sessionId);
		logger.info("update shiro session, the sessionId is {}", sessionId);
		try {
			redisDao.put(key, shiroSession, timeOutSeconds);
			
			//将当前的session发布
			logger.info("publish the session to channel: {}, the  sessionId is {}", channel, sessionId);
			redisDao.publish(channel, shiroSession);
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	/**
	 * delete方法中已经调用了 uncache()方法清空了cache中的缓存, 只需要自己清除redis中缓存即可
	 */
	@Override
	protected void doDelete(Session session) {
		Serializable sessionId = session.getId();
		Serializable key = this.getKey(sessionId);
		logger.info("delete shiro session, the key is {}", key);
		try {
			redisDao.remove(key);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	/**
	 * 获得redis中的session 
	 */
	public Collection<Session> getRedisActiveSessions() {
		try {
			logger.info("get all shiro session");
			Collection<Session> values =  (Collection<Session>) redisDao.values(this.getPattern());
			return values;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 同步本地缓存的session
	 * @param session
	 */
	public void doUpdateCache(Session session) {
		Serializable sessionId = session.getId();
		Session shiroSession = this.getCachedSession(sessionId);
		if(shiroSession == null) {
			return;
		}
		/*long sys = session.getLastAccessTime().getTime();
		long local = shiroSession.getLastAccessTime().getTime();
		if( local == sys) {
			return;
		}*/
		logger.info("sync cache, session key is {}", sessionId);
		//修改本地缓存
		this.cache(session, sessionId);
	}
}
