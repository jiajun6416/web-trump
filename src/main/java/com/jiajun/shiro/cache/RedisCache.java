package com.jiajun.shiro.cache;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.jiajun.dao.redis.RedisDao;

/**
 * 
 * 使用Redis存储认证信息, key使用Object, spting-data-redis会使用序列化成string
 * 
 *
 * @author JIAJUN
 * @Date 2017/08/01 16:32:48
 * @version 1.0.0
 */
@Component
@Scope("prototype")
public class RedisCache implements Cache<Serializable, Serializable>{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private RedisDao redisDao;
	
	/**
	 * redis中key的前缀
	 */
	@Value("${redisCache.keyPrefix}")
	private String keyPrefix;
	
	@Value("${redisCache.timeOut}")
	private int timeToIdleSeconds;
	
	public RedisCache() {
	}

	
	/**
	 * 前缀+principal
	 * @param key
	 * @return
	 */
	private String getKey(Serializable key) {
		return keyPrefix+key;
	}
	
	@Override
	public Serializable get(Serializable key) throws CacheException {
		try {
			logger.debug("get value from redis by key: {}",this.getKey(key));
		//	return redisDao.get(this.getKey(key)); //只查找, 不影响失效时间
			//查找后重置失效时间
			return redisDao.getAndReSetExpireTime(this.getKey(key), timeToIdleSeconds);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}


	@Override
	public Serializable put(Serializable key, Serializable value) throws CacheException {
		try {
			logger.debug("put key:{} value:{} to redis",this.getKey(key), value);
			redisDao.put(this.getKey(key), value, timeToIdleSeconds);
			return value;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}


	@Override
	public Serializable remove(Serializable key) throws CacheException {
	try {
			logger.debug("remove key{} from redis", this.getKey(key));
			redisDao.remove(this.getKey(key));
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public void clear() throws CacheException {
		try {
			redisDao.clear(this.keyPrefix+"*");
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}


	@Override
	public int size() {
		Set<Serializable> keys;
		try {
			keys = redisDao.getKeys(this.keyPrefix+"*");
			if(keys != null) {
				return keys.size();
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return 0;
	}


	@Override
	public Set<Serializable> keys() {
		try {
			logger.debug("get all cache keys");
			Set<Serializable> keySet = redisDao.getKeys(this.keyPrefix+"*");
			return  keySet;
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}

	@Override
	public Collection<Serializable> values() {
		try {
			logger.debug("get all shiro cache values from redis!");
			return redisDao.values(this.keyPrefix+"*");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

}
