package com.jiajun.shiro.cache;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.Destroyable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class RedisCacheManager implements CacheManager, Destroyable {

	private static final Logger logger = LoggerFactory.getLogger(RedisCacheManager.class);
	
	private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap<String, Cache>();

	private String keyPrefix = "shiro_redis_cache:";

	@Override
	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		
		return null;
	}

	@Override
	public void destroy() throws Exception {
		
	}
	

	

}

