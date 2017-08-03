package com.jiajun.shiro.cache;

import java.io.Serializable;

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
 * 注入到securityManager的缓存管理器, 如果实现CacheManagerAware会将这个管理器注入
 * @author JIAJUN
 * @date 2017年8月3日下午10:04:40
 */
@Component
public class RedisCacheManager implements CacheManager, ApplicationContextAware{

	private static final Logger logger = LoggerFactory.getLogger(RedisCacheManager.class);
	
	
	private ApplicationContext applicationContext;
	
	@Override
	public Cache<Serializable, Serializable> getCache(String name) throws CacheException {
		logger.debug("create a new cache, name is {}", name);
		return applicationContext.getBean("redisCache", RedisCache.class);
	}


	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	
}

