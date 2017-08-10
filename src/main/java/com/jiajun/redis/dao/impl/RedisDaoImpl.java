package com.jiajun.redis.dao.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Repository;

import com.jiajun.redis.dao.RedisDao;

@Repository
public class RedisDaoImpl implements RedisDao {
	
	@Autowired
	private RedisTemplate<Serializable, Serializable> redisTemplate;
	
	@Override
	public Serializable get(Serializable key) throws Exception {
		ValueOperations<Serializable, Serializable> opear = redisTemplate.opsForValue();
		return opear.get(key);
	}
	
	@Override
	public Serializable getAndReSetExpireTime(Serializable key, int expire) throws Exception {
		ValueOperations<Serializable, Serializable> opear = redisTemplate.opsForValue();
		Serializable value = opear.get(key);
		if(value != null) {
			redisTemplate.expire(key, expire, TimeUnit.SECONDS);
 		}
		return value;
	}
	
	@Override
	public void put(Serializable key, Serializable value, int expire) throws Exception {
		ValueOperations<Serializable, Serializable> opear = redisTemplate.opsForValue();
		if(expire > 0) {
			opear.set(key, value, expire, TimeUnit.SECONDS);
		} else {
			opear.set(key, value);
		}
	}

	@Override
	public void remove(Serializable key) throws Exception {
		redisTemplate.delete(key);
	}

	@Override
	public void clear(Serializable pattern) throws Exception {
		Set<Serializable> keys = redisTemplate.keys(pattern);
		redisTemplate.delete(keys);
	}

	@Override
	public Set<Serializable> getKeys(Serializable pattern) throws Exception {
		return redisTemplate.keys(pattern);
	}

	@Override
	public Collection<Serializable> values(Serializable pattern) throws Exception {
		Set<Serializable> keys = redisTemplate.keys(pattern);
		return redisTemplate.opsForValue().multiGet(keys);
	}

	@Override
	public void publish(String channel, Serializable message) {
		redisTemplate.convertAndSend(channel, message);
	}

	@Override
	public Long sAdd(Serializable key, Serializable... values) throws Exception {
		SetOperations<Serializable, Serializable> setOpear = redisTemplate.opsForSet();
		return setOpear.add(key, values);
	}

	@Override
	public Long sRemove(Serializable key, Object... values) throws Exception {
		SetOperations<Serializable, Serializable> setOpear = redisTemplate.opsForSet();
		return setOpear.remove(key, values);
	}

	@Override
	public Set<?> sMembers(Serializable key) throws Exception {
		return redisTemplate.opsForSet().members(key);
	}
}
