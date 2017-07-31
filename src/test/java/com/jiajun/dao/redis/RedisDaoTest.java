package com.jiajun.dao.redis;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import com.jiajun.base.BaseTest;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysUserService;

@ContextConfiguration("classpath:spring/ApplicationContext-redis.xml")
public class RedisDaoTest extends BaseTest{
	
	@Autowired
	private RedisDao redisDao;
	@Autowired
	private SysUserService userService;
	
	@Test
	public void testSave() throws Exception {
		SysUserEntity user = userService.getUserById(1);
		redisDao.save("user1", user);
	}

	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

}
