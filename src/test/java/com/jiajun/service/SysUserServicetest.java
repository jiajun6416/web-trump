package com.jiajun.service;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.jiajun.base.BaseTest;

public class SysUserServicetest extends BaseTest{
	
	@Autowired
	private SysUserService userService;
	
	@Test
	public void TestGetPermissionListById() throws Exception {
		List<String> list = userService.getPermissionListById(2);
		Assert.notEmpty(list);
	}
	
	@Test
	public void testGetSysUserByNameAndPwd() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateSysUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testHasExistEmail() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPage() {
		
		fail("Not yet implemented");
	}
	
	
}
