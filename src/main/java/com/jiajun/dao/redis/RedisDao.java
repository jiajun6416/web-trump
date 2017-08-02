package com.jiajun.dao.redis;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

public interface RedisDao {
	
	/**
	 * get 
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	Serializable get(Serializable key) throws Exception;
	
	/**
	 * get and 重置失效时间
	 * @param key
	 * @param expire
	 * @return
	 * @throws Exception
	 */
	Serializable getAndReSetExpireTime(Serializable key, int expire) throws Exception;
	
	/**
	 * put
	 * 
	 * 过期时间<=0的话,则永久不过期
	 * 	
	 * @param key
	 * @param value
	 * @param expire 过期时间
	 * @throws Exception
	 */
	void put(Serializable key, Serializable value, int expire) throws Exception;
	
	/**
	 * delete
	 * @param key
	 * @throws Exception
	 */
	void remove(Serializable key) throws Exception;
	
	/**
	 * clear by telplate 
	 * 	example: del a*
	 * @param pattern
	 * @throws Exception
	 */
	void clear(Serializable pattern) throws Exception;
	
	/**
	 * key a*
	 * @param pattern
	 * @return
	 * @throws Exception
	 */
	Set<Serializable> getKeys(Serializable pattern) throws Exception;
	
	/**
	 * a* value
	 * @param pattern
	 * @return
	 * @throws Exception
	 */
	Collection<Serializable> values(Serializable pattern) throws Exception;
}
