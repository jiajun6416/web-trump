package com.jiajun.service;

import java.util.List;

import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysRoleEntity;

/**
 * @描述：角色接口
 * @author jiajun
 * @date 2017年6月17日下午4:38:41
 */
public interface SysRoleService {

	/**
	 * 通过类别查询
	 * @param roleType
	 * @return
	 * @throws Exception
	 */
	SysRoleEntity getRoleByRoleType(int roleType) throws Exception ;
	/**
	 * 通过id查找
	 * @param roleId
	 * @return
	 */
	SysRoleEntity getRoleById(int roleId) throws Exception;
	/**
	 * 删除
	 * @param roleId
	 * @throws Exception
	 */
	void delete(int roleId) throws Exception;
	
	/**
	 * 删除角色组
	 * @param roleType
	 * @throws Exception
	 */
	void deleteType(int roleType) throws Exception;
	/**
	 * 改
	 * @param roleEntity
	 * @throws Exception
	 */
	void update(SysRoleEntity roleEntity) throws Exception;
	
	/**
	 * 添加
	 * @param roleName
	 * @param roleType
	 */
	void saveRole(SysRoleEntity roleEntity) throws Exception;
	
	/**
	 * 添加角色类型
	 * @param roleTypeName
	 * @throws Exception
	 */
	void saveRoleType(SysRoleEntity roleEntity) throws Exception;
	
	/**
	 * 查询当前类别的所有角色
	 * @param type
	 * @return
	 * @throws Exception
	 */
	List<SysRoleEntity> getListByType(int type) throws Exception;
	
	/**
	 * 获得所有的角色组
	 * @return
	 * @throws Exception
	 */
	List<SysRoleEntity> getAllTypeRole() throws Exception;
	

	/**
	 * 返回ztree格式的节点集合, 被选中的checked属性为true
	 * @return
	 */
	List<ZtreeNode> getCheckTreeNodeByType(int roleTypeId) throws Exception;

	/**
	 * 对应的roleType保存菜单列表
	 * @param roleType
	 * @param menuIds
	 * @throws Exception
	 */
	void saveRoleTypeMneu(int roleType, String menuIds) throws Exception;
	
	/**
	 * 获得选中角色的菜单项, 角色的菜单项, 是角色组菜单项的子集
	 * @param roleId
	 * @return
	 */
	List<ZtreeNode> getMenuNodesById(int roleId) throws Exception ;

	/**
	 * 保存角色对应的菜单
	 * @param roleId
	 * @param menuIds 
	 * @throws Exception
	 */
	void saveRoleMenus(int roleId, String menuIds) throws Exception;
	
}
