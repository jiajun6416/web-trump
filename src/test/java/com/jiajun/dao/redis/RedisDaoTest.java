package com.jiajun.dao.redis;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import com.jiajun.base.BaseTest;
import com.jiajun.redis.dao.RedisDao;

@ContextConfiguration(locations= {"classpath:spring/ApplicationContext-redis.xml", "classpath:spring/ApplicationContext-shiro.xml"})
public class RedisDaoTest extends BaseTest{

	@Autowired
	private RedisDao redisDao;
	
	@Test
	public void test() throws Exception {
		redisDao.put("abc", 123, 0);
	}

}
