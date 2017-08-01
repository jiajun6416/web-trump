package com.jiajun.shiro.cache;

import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

/**
 * @desc redis DAO 
 * @author JIAJUN
 * @date 2017年8月1日下午9:49:19
 */
@Component
public class RedisCacheHandler{
	
	@Autowired
	private RedisTemplate<Object,Object> redisTemplate;
	
	/**
	 * 通过key获得
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public Object get(Object key) throws Exception {
		ValueOperations<Object, Object> opear = redisTemplate.opsForValue();
		return opear.get(key);
	}
	
	/**
	 * 大于0 有超时时间,小于0 永不超时
	 * @param key
	 * @param value
	 * @param expire
	 * @throws Exception
	 */
	public void put(Object key, Object value, int timeToIdleSeconds) throws Exception{
		ValueOperations<Object, Object> opear = redisTemplate.opsForValue();
		if(timeToIdleSeconds >= 0) {
			opear.set(key, value, timeToIdleSeconds, TimeUnit.SECONDS);
		} else {
			opear.set(key, value);
		}
	}
	
	/**
	 * 删除指定key
	 * @param key
	 * @throws Exception
	 */
	public void remove(Object key) throws Exception{
		redisTemplate.delete(key);
	}
	
	/**
	 * 清空指定模板
	 * @param pattern
	 * @throws Exception
	 */
	public void clear(String pattern) throws Exception{
		Set<Object> keySet = redisTemplate.keys(pattern);
		if(keySet!=null && !keySet.isEmpty()) {
			redisTemplate.delete(keySet);
		}
	}

	/**
	 * 获得指定模板所有key
	 * @param string
	 * @return
	 */
	public Set<Object> getKeys(String pattern) throws Exception{
		return redisTemplate.keys(pattern);
	}

	/**
	 * 获得指定模板所有值
	 * @param pattern
	 * @return
	 * @throws Exception
	 */
	public Collection<Object> values(String pattern) throws Exception{
		Set<Object> keySet = redisTemplate.keys(pattern);
		if(keySet!=null && keySet.size()>0) {
			ValueOperations<Object, Object> opear = redisTemplate.opsForValue();
			List<Object> values = opear.multiGet(keySet);
			return values;
		}
		return null;
	}
}
