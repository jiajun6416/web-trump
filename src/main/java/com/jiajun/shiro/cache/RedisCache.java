package com.jiajun.shiro.cache;

import java.util.Collection;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Desc 获得Cache的代理者
 * @Date 2017/08/01 16:32:48
 * @version 1.0.0
 */
public class RedisCache<K, V> implements Cache<K, V> {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@Autowired
	private RedisCacheHandler<Object, V> redisHander;
	
	/**
	 * redis key前缀
	 */
	private String keyPrefix = "shiro_redis_session:";
	
	private Long expire = 60*60*1000L;

	@Override
	public V get(K key) throws CacheException {
		try {
			logger.debug("get value from redis by key: {}",this.getKey(key));
			return redisHander.get(this.getKey(key));
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}


	@Override
	public V put(K key, V value) throws CacheException {
		try {
			logger.debug("put key:{} value:{} to redis",this.getKey(key), value);
			redisHander.put(this.getKey(key), value, expire);
			return value;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}


	@Override
	public V remove(K key) throws CacheException {
	try {
			logger.debug("remove key{} from redis", this.getKey(key));
			redisHander.remove(this.getKey(key));
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public void clear() throws CacheException {
		
	}


	@Override
	public int size() {
		return 0;
	}


	@Override
	public Set<K> keys() {
		return null;
	}


	@Override
	public Collection<V> values() {
		return null;
	}

	
	private Object getKey(K key) {
		return keyPrefix+""+key;
	}
}
