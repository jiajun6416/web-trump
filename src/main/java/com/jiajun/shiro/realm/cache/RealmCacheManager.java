package com.jiajun.shiro.realm.cache;

import java.io.Serializable;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 注入到Realm的缓存管理器
 * @see 
 */
public class RealmCacheManager implements CacheManager{
	private static final String  default_keyPrefix = "authorizationInfo";
	private static final int default_timeOutSecond = 600;
	private static final Logger logger = LoggerFactory.getLogger(RealmCacheManager.class);
	
	@Autowired
	private RedisRealmCache realmCache;
	
	private String keyPrefix = default_keyPrefix;
	private int timeOutSecond = default_timeOutSecond;
	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix+":";
	}
	public void setTimeOutSecond(int timeOutSecond) {
		this.timeOutSecond = timeOutSecond;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Cache<Serializable, Serializable> getCache(String name) throws CacheException {
		logger.debug("create a new cache, name is {}", name);
		realmCache.setKeyPrefix(keyPrefix);
		realmCache.setTimeToIdleSeconds(timeOutSecond);
		return realmCache;
	}
}

