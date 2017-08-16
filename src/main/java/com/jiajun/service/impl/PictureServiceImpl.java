package com.jiajun.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.information.PictureEntity;
import com.jiajun.service.PictureService;
import com.jiajun.util.Constant;

@Service
public class PictureServiceImpl implements PictureService{

	private static final String PictureMapper = "PictureMapper.";
	
	@Autowired
	@Qualifier("baseDao")
	private Dao dao;
	
	@Override
	public Page<PictureEntity> getPage(ParameMap params) throws Exception {
		String currentPage = (String) params.get("currentPage");
		if(StringUtils.isEmpty(currentPage)) {
			currentPage = "1";
		}
		String rows = (String) params.get("pageSize");
		if(StringUtils.isEmpty(rows)) {
			rows = Constant.getConfig("page.size");
		}
		params.put("currentPage", Integer.valueOf(currentPage));
		params.put("rows", rows);
		Page<PictureEntity> page = dao.getPage(PictureMapper+"selectPageList", PictureMapper+"selectPageCount", params);
		return page;
	}

}
