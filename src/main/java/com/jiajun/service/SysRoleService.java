package com.jiajun.service;

import java.util.List;

import com.jiajun.pojo.system.SysRoleEntity;

/**
 * @描述：角色接口
 * @author jiajun
 * @date 2017年6月17日下午4:38:41
 */
public interface SysRoleService {
	
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
	List<SysRoleEntity> getAllRoleType() throws Exception;
	
	
	
}
