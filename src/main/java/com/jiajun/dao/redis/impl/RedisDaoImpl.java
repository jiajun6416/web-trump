package com.jiajun.dao.redis.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Repository;

import com.jiajun.dao.redis.RedisDao;

/**
 * @desc redis dao
 * @author JIAJUN
 * @date 2017年7月31日下午11:39:02
 */
@Repository
public class RedisDaoImpl implements RedisDao{
	
	@Autowired
	private RedisTemplate<String,Object> redisTemplate;

	@Override
	public void save(String key, Object value) throws Exception{
		//string数据类型
		ValueOperations<String, Object> valueOpear = redisTemplate.opsForValue();
		valueOpear.set(key, value);
	}

	@Override
	public Object get(String key) throws Exception{
		ValueOperations<String, Object> valueOpear = redisTemplate.opsForValue();
		return valueOpear.get(key);
	} 
	
	@Override
	public void delete(String key) throws Exception{
		ValueOperations<String, Object> valueOpear = redisTemplate.opsForValue();
		RedisOperations<String, Object> operations = valueOpear.getOperations();
		operations.delete(key);
	}

	
}
