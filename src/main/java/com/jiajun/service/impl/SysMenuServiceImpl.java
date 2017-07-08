package com.jiajun.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
		//触发数据库触发器
		dao.insert(NAME_SPACE+"insertSelective", menuEntity);
	}

	@Override
	public void update(SysMenuEntity menuEntity) throws Exception {
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
