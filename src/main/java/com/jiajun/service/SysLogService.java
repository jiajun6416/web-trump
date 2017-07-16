package com.jiajun.service;

import java.util.List;

import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysLogEntity;

/**
 * @描述：日志opear
 * @author jiajun
 * @date 2017年7月2日上午9:45:00
 */
public interface SysLogService {
	
	/**
	 * add
	 * @param username
	 * @param event
	 */
	void save(String opear, String ip, String event);
	/**
	 * page
	 * @param params
	 * @return
	 */
	Page<SysLogEntity> listLog(ParameMap params) throws Exception;
	/**
	 * page
	 * @param id
	 */
	void delete(Integer id) throws Exception;
	
	/**
	 * batchdelete
	 * @param ids
	 */
	void batchDelete(List<Integer> ids) throws Exception;
}
