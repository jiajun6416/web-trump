package com.jiajun.service;



import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiajun.base.BaseTest;
import com.jiajun.service.SysRoleService;

//@ContextConfiguration("classpath:spring/ApplicationContext-main.xml")
public class SysRoleServiceTest extends BaseTest{

	@Autowired
	private SysRoleService roleService;
	
	@Test
	public void getListByTypeTest() {
	//	List<SysRoleEntity> roleList = roleService.getListByType(1);
		//System.out.println(roleList);
	}

}
