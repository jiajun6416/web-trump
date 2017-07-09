package com.jiajun.service;

import java.util.List;

import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysMenuEntity;

public interface SysMenuService {
	
	/**
	 * get by id
	 * @param id
	 * @return
	 */
	SysMenuEntity getById(Integer id) throws Exception;
	
	/**
	 * assess menuList by parentId
	 * @param patentId
	 * @return
	 */
	List<SysMenuEntity> getMenuByParentId(Integer patentId)throws Exception;
	
	
	void delete(Integer id)throws Exception;
	
	void insert(SysMenuEntity menuEntity)throws Exception;
	
	void update(SysMenuEntity menuEntity)throws Exception;
	
	/**
	 * 通过递归查找所有的菜单
	 * @return
	 */
	List<SysMenuEntity> getAllMenu()throws Exception;
	
	/**
	 * 获得所有的treeNode
	 * @return
	 */
	List<ZtreeNode> selectAllMenuZtreeNode() throws Exception;


}