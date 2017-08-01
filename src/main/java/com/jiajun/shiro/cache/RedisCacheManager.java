package com.jiajun.shiro.cache;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @desc 注入到securityManager的缓存管理器, 如果实现CacheManagerAware会将这个管理器注入 
 * @author JIAJUN
 * @date 2017年8月1日下午9:55:08
 */
public class RedisCacheManager implements CacheManager {

	private static final Logger logger = LoggerFactory.getLogger(RedisCacheManager.class);
	
	/**
	 * 所有的cache
	 */
	private final ConcurrentMap<String, Cache<Object,Object>> caches = new ConcurrentHashMap<>();
	
	/*redis存储的前缀*/
	private String keyPrefix;
	/*redis中的失效时间*/
	private int timeToIdleSeconds;

	/*redisDAO*/
	@Autowired
	private RedisCacheHandler redisHandler;
	
	
	@Override
	public Cache<Object, Object> getCache(String name) throws CacheException {
		Cache<Object, Object> cache = caches.get(name);
		if(cache == null) {
			logger.debug("create a new cache, name is {}", name);
			 cache = new RedisCache(keyPrefix, timeToIdleSeconds, redisHandler);
			caches.put(name, cache);
		}
		return cache;
	}

	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix;
	}

	public void setTimeToIdleSeconds(int timeToIdleSeconds) {
		this.timeToIdleSeconds = timeToIdleSeconds;
	}
	
}

