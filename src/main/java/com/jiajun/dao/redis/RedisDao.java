package com.jiajun.dao.redis;

import java.util.Collection;
import java.util.Set;

public interface RedisDao<K, V> {
	
	V get(K key) throws Exception;
	
	void put(K key, Object value, Long expire) throws Exception;
	
	void remove(K key) throws Exception;
	
	void clear(String pattern) throws Exception;
	
	Set<K> getKeys(String pattern) throws Exception;
	
	Collection<V> values(String pattern) throws Exception;
}
