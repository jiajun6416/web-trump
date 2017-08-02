package com.jiajun.shiro.cache;

import java.io.Serializable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @desc 注入到securityManager的缓存管理器, 如果实现CacheManagerAware会将这个管理器注入 
 * @author JIAJUN
 * @date 2017年8月1日下午9:55:08
 */
@Component
public class RedisCacheManager implements CacheManager, ApplicationContextAware{

	private static final Logger logger = LoggerFactory.getLogger(RedisCacheManager.class);
	
	/**
	 * 所有的cache
	 */
	private final ConcurrentMap<String, Cache<Serializable,Serializable>> caches = new ConcurrentHashMap<>();
	
	private ApplicationContext applicationContext;
	
	@Override
	public Cache<Serializable, Serializable> getCache(String name) throws CacheException {
		Cache<Serializable,Serializable> cache = caches.get(name);
		if(cache == null) {
			logger.debug("create a new cache, name is {}", name);
			 cache = applicationContext.getBean("redisCache", RedisCache.class);
			caches.put(name, cache);
		}
		return cache;
	}


	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	
}

