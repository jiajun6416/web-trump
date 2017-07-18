package com.jiajun.dao.menu;

import java.util.List;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysMenuEntity;

public interface MenuDao extends Dao{
	/**
	 * 递归返回所有菜单的ztree节点
	 * @return
	 */
	List<ZtreeNode> selectAllMenuZtreeNode()throws Exception;
	
}
