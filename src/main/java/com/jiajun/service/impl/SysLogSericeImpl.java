package com.jiajun.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysLogEntity;
import com.jiajun.service.SysLogService;

@Service
public class SysLogSericeImpl implements SysLogService {

	private final static String NAME_SPACE = "SysLogMapper.";
	
	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	
	@Override
	public void save(String username, String ip, String event){
		SysLogEntity logEntity = new SysLogEntity();
		logEntity.setOpearUser(username);
		logEntity.setOpearTime(new Date());
		logEntity.setIp(ip);
		logEntity.setEvent(event);
		try {
			dao.insert(NAME_SPACE+"insert", logEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Page<SysLogEntity> listLog(ParameMap params) throws Exception{
		Integer currentPage = (Integer) params.get("currentPage");
		Integer rows = (Integer) params.get("rows");
		if(currentPage != null && currentPage > 0 
				&& rows != null && rows > 0) {
			return dao.getPage(NAME_SPACE+"getList", NAME_SPACE+"getCount", params);
		} else {
			return null;
		}
	}

	@Override
	public void delete(Integer id) throws Exception{
		dao.delete(NAME_SPACE+"deleteByPrimaryKey", id);
	}

	@Override
	public void batchDelete(List<Integer> ids) throws Exception{
		dao.batchDelete(NAME_SPACE+"deleteByPrimaryKey", ids);
		int i= 10/0;
	}


}
