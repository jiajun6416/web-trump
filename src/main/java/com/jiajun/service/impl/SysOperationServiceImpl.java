package com.jiajun.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.system.SysOpeartionEntity;
import com.jiajun.service.SysOperationService;
import com.jiajun.util.RegularUtils;

@Service
public class SysOperationServiceImpl implements SysOperationService{

	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	private static String OPERATION_NAME_SPACE = "SysOpeartion.";
	
	@Override
	public List<SysOpeartionEntity> getAll() throws Exception {
		return (List<SysOpeartionEntity>) dao.selectList(OPERATION_NAME_SPACE+"getAll", null); 
	}

	@Override
	public void insert(SysOpeartionEntity opeartion)  throws Exception{
		dao.insert(OPERATION_NAME_SPACE+"insert", opeartion);
	}

	@Override
	public void delete(int opeartionId)  throws Exception{
		dao.delete(OPERATION_NAME_SPACE+"deleteByPrimaryKey", opeartionId);
	}

	@Override
	public void update(SysOpeartionEntity opeartion)  throws Exception{
		dao.update(OPERATION_NAME_SPACE+"updateByPrimaryKeySelective", opeartion);
	}

	@Override
	public void batchDelete(String operaids)  throws Exception{
		if(!RegularUtils.regular(operaids)) {
			throw new SysCustomException("参数错误!");
		}
		String[] oIds = operaids.split(",");
		if(oIds.length > 0) {
			List<Integer> ids = new ArrayList<>(oIds.length);
			for (String id : oIds) {
				ids.add(Integer.valueOf(id));
			}
			dao.batchDelete(OPERATION_NAME_SPACE+"deleteByPrimaryKey", ids);
		}
	}

	@Override
	public SysOpeartionEntity getById(int id) throws Exception {
		return (SysOpeartionEntity) dao.selectObject(OPERATION_NAME_SPACE+"selectByPrimaryKey", id);
	}


}
