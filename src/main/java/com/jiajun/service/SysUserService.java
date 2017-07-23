package com.jiajun.service;

import java.util.List;

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
	
	SysUserEntity getUserById(int userId) throws Exception;
	
	/**
	 * 修改上次登陆的ip地址
	 * @param ip
	 * @throws Exception
	 */
	void updateLoginInfo(int userId, String ip) throws Exception;
	
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
	boolean hasExistEmail(String email)throws Exception;
	
	/**
	 * 根据条件获得用户的分页查询对象
	 * @param queryModel
	 * @return
	 */
	Page<SysUserEntity> getPage(ParameMap params)throws Exception;
	
	/**
	 * 排序重复验证
	 * @param sort
	 * @return
	 */
	boolean hasExistSort(int sort) throws Exception;

	/**
	 * 判断用户名是否存在
	 * @param username
	 * @return
	 */
	boolean hasExistUsername(String username) throws Exception;

	/**
	 * 删除用户
	 * @param userId
	 */
	void deleteUserById(int userId) throws Exception;
	
	/**
	 * 添加用户
	 * @param userEntity
	 */
	void save(SysUserEntity userEntity) throws Exception;
	
	/**
	 * 通过name查询
	 * @param username
	 * @return
	 */
	SysUserEntity getUserByUsername(String username) throws Exception;

	/**
	 * 通过角色id查询具备的资源
	 * @param id
	 * @return
	 */
	List<String> getPermissionListById(Integer id) throws Exception;

	/**
	 * 获得admin的资源, 即所有的资源
	 * @return
	 */
	List<String> getAdminPermissionList() throws Exception;
	
}