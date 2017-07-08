package com.jiajun.dao.menu;

import java.util.List;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.ZtreeNode;

public interface MenuDao extends Dao{
	/**
	 * 返回所有的ztree格式的节点集合
	 * @return
	 */
	List<ZtreeNode> selectAllMenuZtreeNode()throws Exception;
}
