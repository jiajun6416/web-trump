package com.jiajun.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.service.SysMenuService;

@Service
@SuppressWarnings("unchecked")
public class SysMenuServiceImpl implements SysMenuService{

	private final static String NAME_SPACE = "SysMenuMapper.";
	
	@Resource
	@Qualifier("daoImpl")
	private Dao dao;
	
	
	
	@Override
	public SysMenuEntity getById(Integer id) throws Exception {
		return (SysMenuEntity) dao.selectObject(NAME_SPACE+"selectByPrimaryKey", id);
	}

	@Override
	public List<SysMenuEntity> getMenuByParentId(Integer patentId) throws Exception {
		return (List<SysMenuEntity>) dao.selectList(NAME_SPACE+"selectMenuByPid", patentId);
	}

	@Override
	public void delete(Integer id) throws Exception {
		SysMenuEntity menu = (SysMenuEntity) dao.selectObject(NAME_SPACE+"selectByPrimaryKey", id);
		dao.delete(NAME_SPACE+"deleteByPrimaryKey", id);
		Integer pId = menu.getParentId();
		int brothers = (int) dao.selectObject(NAME_SPACE+"selectChildNum", pId);
		SysMenuEntity parent = new SysMenuEntity();
		parent.setId(pId);
		parent.setIsParent(false);
		parent.setGmtModifyed(new Date());
		if(brothers == 0) {
			dao.update(NAME_SPACE+"updateByPrimaryKeySelective", parent);
		}
	}

	@Override
	public void insert(SysMenuEntity menuEntity) throws Exception {
		Date now = new Date();
		menuEntity.setGmtCreate(now);
		menuEntity.setGmtModifyed(now);
		dao.insert(NAME_SPACE+"insertSelective", menuEntity);
		Integer pid = menuEntity.getParentId();
		if(pid != 0) {
			SysMenuEntity parentMenu = new SysMenuEntity();
			parentMenu.setId(pid);
			parentMenu.setIsParent(true);
			parentMenu.setGmtModifyed(now);
			dao.update(NAME_SPACE+"updateByPrimaryKeySelective", parentMenu);
		}
	}

	@Override
	public void update(SysMenuEntity menuEntity) throws Exception {
		menuEntity.setGmtModifyed(new Date());
		dao.update(NAME_SPACE+"updateByPrimaryKeySelective", menuEntity);
	}

	@Override
	public List<SysMenuEntity> getAllMenu() throws Exception {
		return null;
	}

	@Override
	public List<ZtreeNode> selectAllMenuZtreeNode() throws Exception {
		//return (List<ZtreeNode>) dao.selectAllMenuZtreeNode();
		return (List<ZtreeNode>) dao.selectList(NAME_SPACE+"selectMenuZtreeNodeList", null);
	}



}
