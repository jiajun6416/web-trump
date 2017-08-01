package com.jiajun.shiro.cache;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

public class RedisCacheHandler<K, V>{
	
	@Autowired
	private RedisTemplate<Object,V> redisTemplate;
	
	
	public V get(Object key) throws Exception {
		ValueOperations<Object, V> opear = redisTemplate.opsForValue();
		return opear.get(key);
	}

	public void put(Object key, V value, Long expire) throws Exception{
		ValueOperations<Object, V> opear = redisTemplate.opsForValue();
		if(expire!=null) {
			opear.set(key, value, expire, TimeUnit.MILLISECONDS);
		} else {
			opear.set(key, value);
		}
	}

	public void remove(Object key) throws Exception{
		redisTemplate.delete(key);
	}
	
	public void clear(String pattern) {
	}
	
}
