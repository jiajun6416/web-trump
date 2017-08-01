package com.jiajun.shiro.cache;

import java.util.Collection;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * 使用Redis存储认证信息, key使用Object, spting-data-redis会使用序列化成string
 * 
 *
 * @author JIAJUN
 * @Date 2017/08/01 16:32:48
 * @version 1.0.0
 */
public class RedisCache implements Cache<Object, Object> {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		
	private RedisCacheHandler redisHandler;

	/**
	 * redis中key的前缀
	 */
	private String keyPrefix;
	
	private int timeToIdleSeconds;

	public RedisCache() {
		super();
	}

	public RedisCache(String keyPrefix,int timeToIdleSeconds, RedisCacheHandler redisHandler) {
		super();
		this.keyPrefix = keyPrefix;
		this.timeToIdleSeconds=timeToIdleSeconds;
		this.redisHandler = redisHandler;
	}

	private Object getKey(Object key) {
		return keyPrefix+key;
	}
	
	@Override
	public Object get(Object key) throws CacheException {
		try {
			logger.debug("get value from redis by key: {}",this.getKey(key));
			return redisHandler.get(this.getKey(key));
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}


	@Override
	public Object put(Object key, Object value) throws CacheException {
		try {
			logger.debug("put key:{} value:{} to redis",this.getKey(key), value);
			redisHandler.put(this.getKey(key), value, timeToIdleSeconds);
			return value;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}


	@Override
	public Object remove(Object key) throws CacheException {
	try {
			logger.debug("remove key{} from redis", this.getKey(key));
			redisHandler.remove(this.getKey(key));
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public void clear() throws CacheException {
		try {
			redisHandler.clear(this.keyPrefix);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}


	@Override
	public int size() {
		Set<Object> keys;
		try {
			keys = redisHandler.getKeys(this.keyPrefix);
			if(keys != null) {
				return keys.size();
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return 0;
	}


	@Override
	public Set<Object> keys() {
		try {
			logger.debug("get all cache keys");
			Set<Object> keySet = redisHandler.getKeys(this.keyPrefix+"*");
			return  keySet;
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}

	@Override
	public Collection<Object> values() {
		try {
			logger.debug("get all shiro cache values from redis!");
			return redisHandler.values(this.keyPrefix);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
}
