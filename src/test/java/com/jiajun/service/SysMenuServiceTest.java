package com.jiajun.service;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.util.Assert;

import com.jiajun.base.BaseTest;
import com.jiajun.dao.menu.MenuDao;
import com.jiajun.pojo.ZtreeNode;

public class SysMenuServiceTest  extends BaseTest{

	
	@Autowired
	private SysMenuService menuService;
	
	@Autowired		
	@Qualifier("menuDaoImpl")
	private MenuDao dao;
	
	@Test
	public void getAllMenuTest() throws Exception {
		List<ZtreeNode> nodes = menuService.selectAllMenuZtreeNode();
		Assert.notEmpty(nodes);
	}
	
	@Test
	public void getAllNodeByDigui() throws Exception {
		List<ZtreeNode> nodes = dao.selectAllMenuZtreeNode();
		Assert.notEmpty(nodes);
	}
	
	@Test
	public void getMenuListByRoleId()  {
		try {
			menuService.getMenuListByRoleId(2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
