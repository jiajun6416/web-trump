package com.jiajun.dao.redis;

public interface RedisDao {
	
	void save(String key, Object value) throws Exception;
	
	Object get(String key) throws Exception;
	
	void delete(String key) throws Exception;
}
