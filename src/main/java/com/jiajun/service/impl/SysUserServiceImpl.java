package com.jiajun.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysUserService;

@Service
public class SysUserServiceImpl implements SysUserService{
	
	private final static String NAME_SPACE = "SysUserMapper.";
	
	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	@Override
	public SysUserEntity getSysUserByNameAndPwd(ParameMap params) throws Exception {
		return (SysUserEntity) dao.selectObject(NAME_SPACE+"selectByNameAndPwd", params);
	}

	@Override
	public void updateSysUser(SysUserEntity sysUser) throws Exception {
		dao.update(NAME_SPACE+"updateByPrimaryKeySelective", sysUser);
	}

	@Override
	public boolean hasExistEmail(ParameMap params) throws Exception {
		int count = (int) dao.selectObject(NAME_SPACE+"getNumByEmail", params);
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
	
}
