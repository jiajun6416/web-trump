package com.jiajun.service;



import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.jiajun.base.BaseTest;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.service.SysRoleService;

public class SysRoleServiceTest extends BaseTest{

	@Autowired
	private SysRoleService sysRoleService;

	@Test
	public void getCheckTreeNodeByTypeTest() throws Exception {
		List<ZtreeNode> nodes = sysRoleService.getCheckTreeNodeByType(1);
		Assert.notEmpty(nodes);
	}
}
