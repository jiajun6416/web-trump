package com.jiajun.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;
import com.jiajun.util.ShiroMd5Utils;

@Service
public class SysUserServiceImpl implements SysUserService{
	
	private final static String NAME_SPACE = "SysUserMapper.";
	
	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	@Value("${salt}")
	private String salt;
	@Value("${hashIterations}")
	private int hashIterations;
	
	@Override
	public SysUserEntity getSysUserByNameAndPwd(ParameMap params) throws Exception {
		return (SysUserEntity) dao.selectObject(NAME_SPACE+"selectByNameAndPwd", params);
	}

	@Override
	public void updateSysUser(SysUserEntity sysUser) throws Exception {
		//不允许修改username
		sysUser.setUsername(null);
		if(StringUtils.isEmpty(sysUser.getPassword())) {
			sysUser.setPassword(null);
		} else {
			sysUser.setPassword(encrypt(sysUser.getPassword()));
		}
		dao.update(NAME_SPACE+"updateByPrimaryKeySelective", sysUser);
	}

	@Override
	public void updateLoginInfo(int userId, String ip) throws Exception {
		SysUserEntity user = new SysUserEntity();
		user.setId(userId);
		user.setLoginTime(new Date());
		user.setLastIp(ip);
		user.setStatus(Constant.USER_LOGIN);
		dao.update(NAME_SPACE+"updateByPrimaryKeySelective", user);
	}
	
	@Override
	public boolean hasExistEmail(String email) throws Exception {
		int count = (int) dao.selectObject(NAME_SPACE+"selectNumByEmail", email);
		if(count > 0 ) {
			return true;
		}
		return false;
	}


	@Override
	public Page<SysUserEntity> getPage(ParameMap params) throws Exception{
		Integer currentPage = (Integer) params.get("currentPage");
		Integer rows = (Integer) params.get("rows");
		if(currentPage != null && currentPage > 0 
				&& rows != null && rows > 0) {
			return dao.getPage(NAME_SPACE+"getList", NAME_SPACE+"getCount", params);
		} else {
			return null;
		}
	}

	public SysUserEntity getUserById(int userId) throws Exception {
		if(userId != 0 ) {
			return (SysUserEntity) dao.selectObject(NAME_SPACE+"selectByPrimaryKey", userId);
		} else {
			return null;
		}
	}

	@Override
	public boolean hasExistSort(int sort) throws Exception {
		int count = (int) dao.selectObject(NAME_SPACE+"selectCountBySort", sort);
		if(count > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean hasExistUsername(String username) throws Exception {
		int count = (int) dao.selectObject(NAME_SPACE+"selectCountByUsername", username);
		if(count > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void deleteUserById(int userId) throws Exception {
		dao.delete(NAME_SPACE+"deleteByPrimaryKey", userId);
	}

	@Override
	public void save(SysUserEntity userEntity) throws Exception {
		userEntity.setGmtCreate(new Date());
		userEntity.setStatus((short)0);
		userEntity.setPassword(encrypt(userEntity.getPassword()));
		dao.insert(NAME_SPACE+"insert", userEntity);
	}

	@Override
	public SysUserEntity getUserByUsername(String username) throws Exception{
		if(StringUtils.isNotEmpty(username)) {
			return (SysUserEntity) dao.selectObject(NAME_SPACE+"selectByUsername", username);
		}
		return null;
	}

	@Override
	public List<String> getPermissionListById(Integer id) throws Exception{
		return dao.selectList(NAME_SPACE+"selectPermissionListById", id);
	}

	@Override
	public List<String> getAdminPermissionList() throws Exception {
		return dao.selectList(NAME_SPACE+"getAdminPermissionList", null);
	}
	
	/**
	 * 密码加密
	 * @param source
	 * @return
	 */
	private String encrypt(String source) {
		//第一次加密, 不加盐, 对应页面加密
		String first = ShiroMd5Utils.getSimpleMd5(source);
		// 第二次加密加盐
		return ShiroMd5Utils.getMd5AddSalt(first, salt, hashIterations);
	}
	
}
