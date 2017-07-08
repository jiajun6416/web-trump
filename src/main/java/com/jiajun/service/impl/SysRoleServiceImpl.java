package com.jiajun.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.service.SysRoleService;

@Service
@SuppressWarnings("unchecked")
public class SysRoleServiceImpl implements SysRoleService {
	
	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	private static final String NAME_SPACE = "SysRoleMapper.";
	
	@Override
	public List<SysRoleEntity> getListByType(int type) throws Exception {
		return (List<SysRoleEntity>) dao.selectList(NAME_SPACE+"getByType", type);
	}

	@Override
	public List<SysRoleEntity> getAllRoleType() throws Exception {
		return (List<SysRoleEntity>) dao.selectList(NAME_SPACE+"BaseResultMap", null);
	}
	
}
