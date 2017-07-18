package com.jiajun.service;

import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysUserEntity;

/**
 * @描述：
 * @author jiajun
 * @date 2017年6月12日下午8:57:09
 */
public interface SysUserService {
	
	/**
	 * 根据用户名和密码查询用户信息
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception 
	 */
	SysUserEntity getSysUserByNameAndPwd(ParameMap params) throws Exception ;
	
	/**
	 * 修改用户
	 * @param sysUser
	 * @throws Exception
	 */
	void updateSysUser(SysUserEntity sysUser) throws Exception;
	
	/**
	 * 判断邮箱是否存在
	 * @param id 
	 * @param email
	 * @return
	 */
	boolean hasExistEmail(ParameMap params)throws Exception;
	
	/**
	 * 根据条件获得用户的分页查询对象
	 * @param queryModel
	 * @return
	 */
	Page<SysUserEntity> getPage(ParameMap params)throws Exception;
	
}