package com.jiajun.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.service.SysRoleService;
import com.jiajun.shiro.realm.CustomRealm;
import com.jiajun.util.Constant;
import com.jiajun.util.RegularUtils;

@Service
@SuppressWarnings("unchecked")
public class SysRoleServiceImpl implements SysRoleService {

	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;

	/**
	 * 注入realm清除缓存
	 */
	@Autowired
	private CustomRealm realm;

	private static Logger logger = LoggerFactory.getLogger(SysRoleServiceImpl.class);

	private static final String ROLE_NAME_SPACE = "SysRoleMapper.";

	private static final String MENU_NAME_SPACE = "SysMenuMapper.";

	private static final String USER_NAME_SPACE = "SysUserMapper.";

	private static final String MENU_PREMISSION_NAME_SPACE = "sysMenuPremissionMapper.";

	@Override
	public SysRoleEntity getRoleByRoleType(int roleType) throws Exception {
		return (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "selectRoleByType", roleType);
	}

	@Override
	@Cacheable(value = "role", key = "'role:id'+#p0")
	public SysRoleEntity getRoleById(int roleId) throws Exception {
		return (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "selectByPrimaryKey", roleId);
	}

	@Override
	@Cacheable(value = "role", key = "'role:typeId'+#p0")
	public List<SysRoleEntity> getListByType(int type) throws Exception {
		return (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE + "getByType", type);
	}

	@Override
	@Cacheable(value = "role", key = "'role:all'")
	public List<SysRoleEntity> getAllTypeRole() throws Exception {
		return (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE + "getAllTypeRole", null);
	}

	@Override
	@CacheEvict(value = "role", key = "'role:id'+#p0")
	public void delete(int roleId) throws Exception {
		// 查询此角色是否有用户
		int count = (int) dao.selectObject(USER_NAME_SPACE + "getUserNumByRole", roleId);
		if (count > 0) {
			throw new SysCustomException("当前角色已有用户");
		}
		// 删除角色对应的菜单权限信息
		dao.delete(MENU_PREMISSION_NAME_SPACE + "deleteBYRoleId", roleId);
		// TODO 删除对应按钮权限信息

		dao.delete(ROLE_NAME_SPACE + "deleteByPrimaryKey", roleId);
	}

	@Override
	@CacheEvict(value = "role", key = "'role:typeId'+#p0")
	public void deleteType(int roleType) throws Exception {
		// 查询当前角色组下是否有角色
		int count = (int) dao.selectObject(ROLE_NAME_SPACE + "getRoleNumByType", roleType);
		if (count > 0) {
			throw new SysCustomException("当前角色组下有角色存在!");
		}
		dao.delete(ROLE_NAME_SPACE + "deleteByRoleType", roleType);
	}

	@Override
	@CacheEvict(value = "role", key = "'role:id'+#p0")
	public void update(SysRoleEntity roleEntity) throws Exception {
		dao.update(ROLE_NAME_SPACE + "updateByPrimaryKeySelective", roleEntity);
	}

	@Override
	public void saveRole(SysRoleEntity roleEntity) throws Exception {
		SysRoleEntity typeMenu = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "getParentByType",
				roleEntity.getRoleType());
		roleEntity.setParentId(typeMenu.getId());
		dao.insert(ROLE_NAME_SPACE + "insert", roleEntity);
	}

	@Override
	public void saveRoleType(SysRoleEntity roleEntity) throws Exception {
		int currentMaxRoleType = (int) dao.selectObject(ROLE_NAME_SPACE + "getMaxRoletype", null);
		roleEntity.setRoleType(currentMaxRoleType + 1);
		roleEntity.setParentId(0);
		dao.insert(ROLE_NAME_SPACE + "insert", roleEntity);
	}

	@Override
	public List<ZtreeNode> getCheckTreeNodeByType(int roleType) throws Exception {
		String menuIds = (String) dao.selectObject(ROLE_NAME_SPACE + "selectMenuByType", roleType);
		Map<String, List> params = new HashMap<>();
		params.put("menuIds", null);
		// 使用mybatis的 sql拼接功能, 例如 id in {1 ,2 ,3} 如果符合的话, selected属性=true
		if (!StringUtils.isEmpty(menuIds)) {
			String[] split = menuIds.split(",");
			if (split != null && split.length > 0) {
				params.put("menuIds", Arrays.asList(split));
			}
		}
		return (List<ZtreeNode>) dao.selectList(MENU_NAME_SPACE + "selectMenuIdByRoleType", params);
	}

	@Override
	public void saveRoleTypeMneu(int roleType, String menuIdsStr) throws Exception {
		if (roleType != 0) {
			if (StringUtils.isNotEmpty(menuIdsStr)) {
				if (!RegularUtils.regular(menuIdsStr)) {
					logger.error("角色类型授予菜单, 传入参数类型错误: {}", menuIdsStr);
					throw new SysCustomException("参数类型错误");
				}
				Map<String, Object> params = new HashMap<>();
				params.put("roleType", roleType);
				params.put("menuIds", menuIdsStr);
				dao.update(ROLE_NAME_SPACE + "updateByRoleType", params);
				// 角色组已有的菜单都同步更新,不在角色组最大菜单权限内的全部移除
				List<SysRoleEntity> subRoleList = (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE + "getByType",
						roleType);
				String roleMenus = null;
				String[] typeMenus = menuIdsStr.split(",");
				int length = typeMenus.length;
				int index;
				String newMenus = ""; // 子角色同步后的菜单
				for (SysRoleEntity role : subRoleList) {
					index = 0;
					roleMenus = role.getMenuIds();
					if (!StringUtils.isEmpty(roleMenus)) {
						String[] roleMenuIds = roleMenus.split(",");
						// 筛选在父菜单内的菜单项
						for (String id : roleMenuIds) {
							if (Integer.valueOf(id) == Integer.valueOf(typeMenus[index])) {
								newMenus += id + ",";
								index++;
								if (index == length)
									break;
							}
						}
						if (!"".equals(newMenus) && newMenus.lastIndexOf(",") != -1) {
							newMenus = newMenus.substring(0, newMenus.lastIndexOf(","));
						}
						role.setMenuIds(newMenus);
					}
				}
				// 批量更新子节点权限
				dao.batchUpdate(ROLE_NAME_SPACE + "updateMenuIds", subRoleList);
				// 清除该角色类型下所有角色对应的菜单权限
				dao.delete(MENU_PREMISSION_NAME_SPACE + "deleteByRoleTypeHasMenus", params);
			} else {
				// 当前类型角色最大菜单为空, 子角色所有的菜单都移除
				Map<String, Object> params = new HashMap<>();
				params.put("roleType", roleType);
				params.put("menuIds", "");
				dao.update(ROLE_NAME_SPACE + "updateByRoleType", params);
				List<SysRoleEntity> subRoleList = (List<SysRoleEntity>) dao.selectList(ROLE_NAME_SPACE + "getByType",
						roleType);
				for (SysRoleEntity sysRoleEntity : subRoleList) {
					sysRoleEntity.setMenuIds("");
				}
				dao.batchUpdate(ROLE_NAME_SPACE + "updateMenuIds", subRoleList);
				// 删除该角色类型下所有角色对应的菜单权限
				dao.delete(MENU_PREMISSION_NAME_SPACE + "deleteAllByRoleType", roleType);
			}
			// 清除缓存
			realm.clearCached();
		} else {
			logger.error("角色类型授予菜单, 传入参数类型错误: {}", roleType);
			throw new SysCustomException("参数类型错误");
		}
	}

	@Override
	public List<ZtreeNode> getMenuNodesById(int roleId) throws Exception {
		// 获得自己的menuIds
		SysRoleEntity role = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "selectByPrimaryKey", roleId);
		String menuIdsStr = role.getMenuIds();
		// 获得角色组的menuIds
		Integer roleType = role.getRoleType();
		String typeMenuIdsStr = (String) dao.selectObject(ROLE_NAME_SPACE + "selectMenuByType", roleType);
		// 必须在角色组下, 返回ztree节点
		Map<String, List> params = new HashMap<>();
		params.put("menuIds", null);
		params.put("typeMenuIds", null);
		if (StringUtils.isNotEmpty(typeMenuIdsStr) && typeMenuIdsStr.split(",").length > 0) {
			String[] typeMenuIds = typeMenuIdsStr.split(",");
			params.put("typeMenuIds", Arrays.asList(typeMenuIds));
		} else {
			// 角色组所拥有的菜单为空
			return null;
		}
		if (StringUtils.isNotEmpty(menuIdsStr)) {
			String[] menuIds = menuIdsStr.split(",");
			if (menuIds.length > 0) {
				params.put("menuIds", Arrays.asList(menuIds));
			}
		}
		List<ZtreeNode> nodes = (List<ZtreeNode>) dao.selectList(MENU_NAME_SPACE + "selecRoleMenuNodes", params);
		return nodes;
	}

	@Override
	public void saveRoleMenus(int roleId, String menuIds) throws Exception {
		SysRoleEntity role = new SysRoleEntity();
		role.setId(roleId);
		List<Integer> idsList = new ArrayList<>();
		if (StringUtils.isEmpty(menuIds)) {
			role.setMenuIds("");
		} else {
			if (!RegularUtils.regular(menuIds)) {
				throw new SysCustomException("参数格式不正确!");
			}
			// 获得角色组的menuIds
			role = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "selectByPrimaryKey", roleId);
			Integer roleType = role.getRoleType();
			String typeMenuIdsStr = (String) dao.selectObject(ROLE_NAME_SPACE + "selectMenuByType", roleType);
			String[] typeMenuIds = typeMenuIdsStr.split(",");
			String[] ids = menuIds.split(",");
			// 菜单有相同的顺序, 只需要遍历一遍typeMenuIds就ok了
			int index = 0;
			int length = ids.length;
			for (int i = 0; i < typeMenuIds.length; i++) {
				if (Integer.valueOf(typeMenuIds[i]) == Integer.valueOf(ids[index])) {
					index++;
					if (index == length)
						break;
				}
			}
			if (index < ids.length) {
				// 说明ids并不全是子集
				throw new SysCustomException("非法参数!当前角色的菜单权限越界!");
			}
			role.setMenuIds(menuIds);
			for (String id : ids) {
				idsList.add(Integer.valueOf(id));
			}
		}
		dao.update(ROLE_NAME_SPACE + "updateByPrimaryKeySelective", role);
		// 清理角色对应的菜单权限的数据
		Map<String, Object> params = new HashMap<>();
		params.put("roleId", roleId);
		params.put("idsList", idsList);
		dao.delete(MENU_NAME_SPACE + "deleteRoleListByListIds", params);
		// 清除缓存
		realm.clearCached();
	}

	@Override
	public List<ZtreeNode> getPremissionNodes(int roleId, int type) throws Exception {
		SysRoleEntity role = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "selectByPrimaryKey", roleId);
		String menuIdstr = role.getMenuIds();
		List<Integer> mIds = new ArrayList<>();
		if (StringUtils.isNotEmpty(menuIdstr)) {
			String[] menuIds = menuIdstr.split(",");
			if (menuIds.length > 0) {
				for (String idStr : menuIds) {
					mIds.add(Integer.valueOf(idStr));
				}
			}
		} else {
			return null;
		}
		Map<String, Object> params = new HashMap<>();
		params.put("type", type);
		params.put("roleId", roleId);
		params.put("menuIds", mIds);

		// 查询当前具备的权限
		List<Integer> hasPrem = (List<Integer>) dao.selectList(MENU_PREMISSION_NAME_SPACE + "getMenuIdByRoleId",
				params);
		params.put("hasPrem", hasPrem);
		return (List<ZtreeNode>) dao.selectList(MENU_NAME_SPACE + "selecRoleMenuPremissionNodes", params);
	}

	@Override
	public void saveRoleMenuPremission(int roleId, String menuIds, int type) throws Exception {
		// 删除之前的
		Map<String, Object> params = new HashMap<>();
		params.put("roleId", roleId);
		params.put("type", type);
		dao.delete(MENU_PREMISSION_NAME_SPACE + "deleteAllByRoleIdAndType", params);

		if (type != 1 && type != 2 && type != 3 && type != 4 && type != 5) {
			throw new SysCustomException("类型不符");
		}

		if (StringUtils.isNotEmpty(menuIds)) {
			if (!RegularUtils.regular(menuIds)) {
				throw new SysCustomException("权限数格式不匹配");
			}
			String[] idsStr = menuIds.split(",");
			// 插入新的
			if (idsStr != null && idsStr.length > 0) {
				List<Integer> ids = new ArrayList<>(idsStr.length);
				for (String id : idsStr) {
					ids.add(Integer.valueOf(id));
				}
				params.put("ids", ids);
				// 查询出这些菜单对应 的权限
				List<Integer> premIds = (List<Integer>) dao
						.selectList(MENU_PREMISSION_NAME_SPACE + "getPremissionByMenuAndType", params);
				// 插入role_prem表
				if (premIds != null && premIds.size() > 0) {
					params.put("premIds", premIds);
					dao.insert(MENU_PREMISSION_NAME_SPACE + "insertRolePremission", params);
				}
			}
		}
		// 清空权限信息
		realm.clearCached();
	}

	@Override
	@CacheEvict(value = "role", allEntries = true)
	public void updateOpera(int roleId, int operaId) throws Exception {
		SysRoleEntity role = (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "selectByPrimaryKey", roleId);
		List<Integer> ids = role.getOperaIds();
		String newOperaStr = "";
		if (CollectionUtils.isNotEmpty(ids)) {
			if (ids.contains(operaId)) {
				ids.remove((Integer) operaId);
			} else {
				ids.add(operaId);
			}
		}
		int size = ids.size();
		for (int i = 0; i < size; i++) {
			if (i < size - 1) {
				newOperaStr += ids.get(i) + ",";
			} else {
				newOperaStr += ids.get(i);
			}
		}
		role.setOperationIds(newOperaStr);
		dao.update(ROLE_NAME_SPACE + "updateByPrimaryKey", role);

		// 清空缓存信息
		realm.clearCached();
	}

	@Override
	public SysRoleEntity getByUserId(int userId) throws Exception {
		return (SysRoleEntity) dao.selectObject(ROLE_NAME_SPACE + "getByUserId", userId);
	}

	@Override
	public List<SysRoleEntity> getAllVipRole() throws Exception {
		int vipRole = Constant.VIP_ROLE;
		return dao.selectList(ROLE_NAME_SPACE + "selectRoleListByType", vipRole);
	}

}
