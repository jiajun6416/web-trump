package com.jiajun.service;

import java.util.List;

import com.jiajun.pojo.system.SysOpeartionEntity;

/**
 * button
 * @author JIAJUN
 *
 */
public interface SysOperationService{
	
	/**
	 * 查询所有, 不需要分页..
	 * @return
	 */
	List<SysOpeartionEntity> getAll()  throws Exception;
	
	SysOpeartionEntity getById(int id) throws Exception;
	
	void insert(SysOpeartionEntity opeartion) throws Exception;
	
	void delete(int opeartionId)  throws Exception;
	
	void update(SysOpeartionEntity opeartion)  throws Exception;
	
	void batchDelete(String operaIds)  throws Exception;
	
	
}
