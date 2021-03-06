package com.jiajun.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jiajun.dao.base.Dao;
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.pojo.system.SysMenuPremission;
import com.jiajun.service.SysMenuService;
import com.jiajun.util.Constant;
import com.jiajun.util.RegularUtils;

@Service
@SuppressWarnings("unchecked")
public class SysMenuServiceImpl implements SysMenuService{

	private final static String NAME_SPACE = "SysMenuMapper.";
	
	private final static String SYS_PREMISSION_NAME_SPACE = "sysMenuPremissionMapper.";
	
	private final static String SYS_ROLE_NAME_SPACE = "SysRoleMapper.";
	
	@Resource
	@Qualifier("daoImpl")
	private Dao dao;
	
	
	
	@Override
	@Cacheable(value="menu",key="'menu:id'+#p0")
	public SysMenuEntity getById(Integer id) throws Exception {
		return (SysMenuEntity) dao.selectObject(NAME_SPACE+"selectMenuWithPremissonByPrimartyKey", id);
	}

	@Override
	@Cacheable(value="menu", key="'menu:typeId'+#p0")
	public List<SysMenuEntity> getMenuByParentId(Integer patentId) throws Exception {
		return (List<SysMenuEntity>) dao.selectList(NAME_SPACE+"selectMenuWithPremissionByPid", patentId);
	}

	@Override
	@CacheEvict(value="menu",key="'menu:id'+#p0")
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
		//删除菜单权限
		dao.delete(SYS_PREMISSION_NAME_SPACE+"deleteByMenuId", id);
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
		List<SysMenuPremission> premissionList = menuEntity.getPremissionList();
		//插入sys_menu_premission表
		for(int i= 4; i>=0; i--) {
			SysMenuPremission premission = premissionList.get(i);
			if(StringUtils.isEmpty(premission.getPremissionCode())) {
				premissionList.remove(i);
			}else{ 
				premission.setMenuId(menuEntity.getId());
			}
		}
		dao.batchInsert(SYS_PREMISSION_NAME_SPACE+"insert", premissionList);

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
	@CacheEvict(value="menu",key="'menu:id'+#p0")
	public void updateIcon(Integer menuId, String icon) throws Exception{
		SysMenuEntity menu = new SysMenuEntity();
		menu.setId(menuId);
		menu.setIcon(icon);
		dao.update(NAME_SPACE+"updateByPrimaryKeySelective", menu);
	}
	
	@Override
	@CacheEvict(value="menu", key="'menu:id'+#p0.id")
	public void update(SysMenuEntity menuEntity) throws Exception {
		List<SysMenuPremission> premissions = menuEntity.getPremissionList();
		menuEntity.setGmtModifyed(new Date());
		dao.update(NAME_SPACE+"updateByPrimaryKeySelective", menuEntity);
		if (menuEntity.getIsParent() != null && !menuEntity.getIsParent()) {
			// 父菜单直接返回
			if (premissions.size() != 5) {
				throw new SysCustomException("参数有误!!!");
			}
			// 子菜单带有权限表示, 修改权限标识
			List<SysMenuPremission> premissionList = (List<SysMenuPremission>) dao
					.selectList(SYS_PREMISSION_NAME_SPACE + "selectByMenuId", menuEntity.getId());
			// 已经存在修改, 不存在的添加, 或者删除已存在的
			List<SysMenuPremission> updateList = new ArrayList<>(5);
			List<SysMenuPremission> insertList = new ArrayList<>(5);
			List<Integer> removeList = new ArrayList<>(5);

			int length = premissionList.size();
			int index = 0;
			for (int i = 0; i < 5; i++) {
				SysMenuPremission premission = premissions.get(i);
				// 原本存在
				if (index < length && premission.getPremissionType() == premissionList.get(index).getPremissionType()) {
					Integer id = premissionList.get(index).getId();
					if (StringUtils.isEmpty(premission.getPremissionCode())) {
						removeList.add(id);
					} else {
						premission.setId(id);
						premission.setMenuId(menuEntity.getId());
						updateList.add(premission);
					}
					index++;
				} else {
					if (!StringUtils.isEmpty(premission.getPremissionCode())) {
						premission.setMenuId(menuEntity.getId());
						insertList.add(premission);
					}
				}
			}
			if (insertList.size() > 0) {
				dao.batchInsert(SYS_PREMISSION_NAME_SPACE + "insert", insertList);
			}
			if (updateList.size() > 0) {
				dao.batchUpdate(SYS_PREMISSION_NAME_SPACE + "updateByPrimaryKey", updateList);
			}
			if (removeList.size() > 0) {
				dao.batchDelete(SYS_PREMISSION_NAME_SPACE + "deleteByPrimaryKey", removeList);
			}
		}
	}
	
	

	@Override
	public List<ZtreeNode> selectAllMenuZtreeNode() throws Exception {
		//return (List<ZtreeNode>) dao.selectAllMenuZtreeNode();
		return (List<ZtreeNode>) dao.selectList(NAME_SPACE+"selectMenuZtreeNodeList", null);
	}

	@Override
	public List<SysMenuEntity> getMenuListByRoleId(int roleId) throws Exception {
		
		List<SysMenuEntity> menuEntitys = null; 
		
		if(roleId == Constant.SYSTEM_ROLE) {
			menuEntitys = (List<SysMenuEntity>) dao.selectList(NAME_SPACE+"selectAllMenu", null);
		} else {
			String hasMenuId = (String) dao.selectObject(SYS_ROLE_NAME_SPACE+"selectMenuIdsById", roleId);
			if(!StringUtils.isEmpty(hasMenuId) && RegularUtils.regular(hasMenuId)) {
				String[] hasMenuIds = hasMenuId.split(",");
				List<Integer> menuIds = new ArrayList<>();
				for (String menuId : hasMenuIds) {
					menuIds.add(Integer.valueOf(menuId));
				}
				menuEntitys = (List<SysMenuEntity>) dao.selectList(NAME_SPACE+"selectByMenuIds", menuIds);
			}
		}
		
		if(CollectionUtils.isEmpty(menuEntitys)) { 
			return null;
		}
		//进行递归,将子菜单和父亲菜单进行关联起来
		List<SysMenuEntity> result = new ArrayList<>();
		for (SysMenuEntity menu : menuEntitys) {
			Integer menuId = menu.getParentId();
			if(menuId == 0) {
				result.add(menu);
			} else {
				for (SysMenuEntity menu2 : menuEntitys) {
					if(menu2.getId().equals(menuId)) {
						menu2.getMenuList().add(menu);
					}
				}
			}
		}
		return result;
	}

}
