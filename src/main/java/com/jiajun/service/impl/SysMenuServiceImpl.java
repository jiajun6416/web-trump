package com.jiajun.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jiajun.dao.base.Dao;
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.pojo.system.SysMenuPremission;
import com.jiajun.service.SysMenuService;

@Service
@SuppressWarnings("unchecked")
public class SysMenuServiceImpl implements SysMenuService{

	private final static String NAME_SPACE = "SysMenuMapper.";
	
	private final static String SYS_PREMISSION_NAME_SPACE = "sysMenuPremissionMapper.";
	
	@Resource
	@Qualifier("daoImpl")
	private Dao dao;
	
	
	
	@Override
	public SysMenuEntity getById(Integer id) throws Exception {
		return (SysMenuEntity) dao.selectObject(NAME_SPACE+"selectMenuWithPremissonByPrimartyKey", id);
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
		if(menuEntity.getPremissionList().size() != 5) {
			throw new SysCustomException("参数错误!");
		}
		Date now = new Date();
		menuEntity.setGmtCreate(now);
		menuEntity.setGmtModifyed(now);
		dao.insert(NAME_SPACE+"insert", menuEntity);
		Integer pid = menuEntity.getParentId();
		List<SysMenuPremission> premissionList = menuEntity.getPremissionList();
		//插入sys_menu_premission表
		for(int i= 5; i>=1; i--) {
			SysMenuPremission premission = premissionList.get(i-1);
			if(!StringUtils.isEmpty(premission.getPremissionCode())) {
				premission.setPremissionType((short) i);
				premission.setMenuId(menuEntity.getId());
			} else {
				premissionList.remove(i-1);
			}
		}
		dao.batchInsert(SYS_PREMISSION_NAME_SPACE+"insert", premissionList);
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
		List<SysMenuPremission> premissionList = (List<SysMenuPremission>) dao.selectList(SYS_PREMISSION_NAME_SPACE+"selectByMenuId",menuEntity.getId());
		List<SysMenuPremission> premissions = menuEntity.getPremissionList();
		//已经存在修改, 不存在的添加
		List<SysMenuPremission> exist = new ArrayList<>();
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
