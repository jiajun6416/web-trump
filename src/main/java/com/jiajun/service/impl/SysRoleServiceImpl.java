package com.jiajun.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.service.SysRoleService;
import com.jiajun.util.Tools;

@Service
@SuppressWarnings("unchecked")
public class SysRoleServiceImpl implements SysRoleService {
	
	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	Logger logger = LoggerFactory.getLogger(SysRoleServiceImpl.class);
	
	private static final String ROLE_NAME_SPACE = "SysRoleMapper.";
	
	private static final String MENU_NAME_SPACE = "SysMenuMapper.";
	
	
	@Override
	public List<SysRoleEntity> getListByType(int type) throws Exception {
		return (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE+"getByType", type);
	}

	@Override
	public List<SysRoleEntity> getAllTypeRole() throws Exception {
		return (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE+"getAllTypeRole", null);
	}

	@Override
	public void delete(int roleId) throws Exception {
		dao.delete(ROLE_NAME_SPACE+"deleteByPrimaryKey", roleId);
	}

	@Override
	public void update(SysRoleEntity roleEntity) throws Exception {
		dao.update(ROLE_NAME_SPACE+"updateByPrimaryKeySelective", roleEntity);
	}

	@Override
	public void saveRole(SysRoleEntity roleEntity) throws Exception {
		dao.insert(ROLE_NAME_SPACE, roleEntity);
	}
	
	@Override
	public List<ZtreeNode> getCheckTreeNodeByType(int roleType) throws Exception {
		String menuIds = (String) dao.selectObject(ROLE_NAME_SPACE+"selectMenuByType", roleType);
		Map<String, List> params = new HashMap<>();
		params.put("menuIds", null);
		//使用mybatis的 sql拼接功能, 例如 id in {1 ,2 ,3} 如果符合的话, selected属性=true
		if(!StringUtils.isEmpty(menuIds)) {
			String[] split = menuIds.split(",");
			if(split != null && split.length>0) {
				params.put("menuIds",Arrays.asList(split));
			}
		} 
		return (List<ZtreeNode>) dao.selectList(MENU_NAME_SPACE+"selectMenuIdByRoleType", params);
	}

	@Override
	public void saveRoleTypeMneu(int roleType, String menuIds) throws Exception {
		if(roleType != 0) {
			if(StringUtils.isNotEmpty(menuIds)) {
				if(!Tools.regular(menuIds)) {
					logger.error("角色类型授予菜单, 传入参数类型错误: {}", menuIds);
					throw new SysCustomException("参数类型错误");
				}
				Map<String, Object> params = new HashMap<>();
				params.put("roleType", roleType);
				params.put("menuIds", menuIds);
				dao.update(ROLE_NAME_SPACE+"updateByRoleType", params);
				//角色组已有的菜单都同步更新,不在角色组最大菜单权限内的全部移除
				List<SysRoleEntity> subRoleList = (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE+"getByType", roleType);
				String roleMenus = null;
				String[] typeMenus = menuIds.split(",");
				int length  = typeMenus.length;
				int index;
				String newMenus = ""; //子角色同步后的菜单 
				for (SysRoleEntity role : subRoleList) {
					index = 0;
					roleMenus = role.getMenuIds();
					if(!StringUtils.isEmpty(roleMenus)) {
						String[] roleMenuIds = roleMenus.split(",");
						for (String id : roleMenuIds) {
							if(Integer.valueOf(id) == Integer.valueOf(typeMenus[index])) {
								newMenus+=id+",";
								index++;
								if(index == length) break;
							}
						}
						newMenus = newMenus.substring(0, newMenus.lastIndexOf(","));
						role.setMenuIds(newMenus);
					}
				}
				//批量更新子节点权限
				dao.batchUpdate(ROLE_NAME_SPACE+"updateMenuIds", subRoleList);
			} else {
				//当前类型角色最大菜单为空, 子角色所有的菜单都移除
				Map<String, Object> params = new HashMap<>();
				params.put("roleType", roleType);
				params.put("menuIds", menuIds);
				dao.update(ROLE_NAME_SPACE+"updateByRoleType", params);
				List<SysRoleEntity> subRoleList = (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE+"getByType", roleType);
				for (SysRoleEntity sysRoleEntity : subRoleList) {
					sysRoleEntity.setMenuIds("");
				}
				dao.batchUpdate(ROLE_NAME_SPACE+"updateMenuIds", subRoleList);
			}
		} else {
			logger.error("角色类型授予菜单, 传入参数类型错误: {}", roleType);
			throw new SysCustomException("参数类型错误");
		}
	}
	
	@Override
	public List<ZtreeNode> getMenuNodesById(int roleId) throws Exception {
		//获得自己的menuIds
		SysRoleEntity role = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE+"selectByPrimaryKey", roleId);
		String menuIdsStr = role.getMenuIds();
		//获得角色组的menuIds
		Integer roleType = role.getRoleType();
		String typeMenuIdsStr = (String) dao.selectObject(ROLE_NAME_SPACE+"selectMenuByType", roleType);
		//必须在角色组下, 返回ztree节点
		Map<String, List> params = new HashMap<>();
		params.put("menuIds", null);
		params.put("typeMenuIds", null);
		if(StringUtils.isNotEmpty(typeMenuIdsStr) && typeMenuIdsStr.split(",").length > 0) {
			String[] typeMenuIds = typeMenuIdsStr.split(",");
			params.put("typeMenuIds", Arrays.asList(typeMenuIds));
		} else {
			//角色组所拥有的菜单为空
			return null;
		}
		if(StringUtils.isNotEmpty(menuIdsStr)) {
			String[] menuIds = menuIdsStr.split(",");
			if(menuIds.length > 0) {
				params.put("menuIds", Arrays.asList(menuIds));
			}
		}
		List<ZtreeNode> nodes = (List<ZtreeNode>) dao.selectList(MENU_NAME_SPACE+"selecRoleMenuNodes", params);
		return nodes;
	}

	@Override
	public void saveRoleMenus(int roleId, String menuIds) throws Exception {
		SysRoleEntity role = new SysRoleEntity();
		role.setId(roleId);
		if(StringUtils.isEmpty(menuIds)) {
			role.setMenuIds("");
		} else {
			if(!Tools.regular(menuIds)) {
				throw new SysCustomException("参数格式不正确!");
			}
			//获得角色组的menuIds
			role = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE+"selectByPrimaryKey", roleId);
			Integer roleType = role.getRoleType();
			String typeMenuIdsStr = (String) dao.selectObject(ROLE_NAME_SPACE+"selectMenuByType", roleType);
			String[] typeMenuIds = typeMenuIdsStr.split(",");
			String[] ids = menuIds.split(",");
			//菜单有相同的顺序, 只需要遍历一遍typeMenuIds就ok了
			int index = 0;
			int length = ids.length;
			for(int i=0; i<typeMenuIds.length; i++) {
				if(Integer.valueOf(typeMenuIds[i]) == Integer.valueOf(ids[index])){
					index++;
					if(index == length) break; 
				}
			}
			if(index < ids.length) {
				//说明ids并不全是子集
				throw new SysCustomException("非法参数!当前角色的菜单权限越界!");
			}
			role.setMenuIds(menuIds);
		}
		dao.update(ROLE_NAME_SPACE+"updateByPrimaryKeySelective", role);
	}

	
}
