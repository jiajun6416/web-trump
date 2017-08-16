package com.jiajun.service.impl;

import java.util.Date;

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

	private static final String PICTURE_NAME_SPACE = "PictureMapper.";
	
	@Autowired
	@Qualifier("daoImpl")
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
		params.put("rows", Integer.valueOf(rows));
		Page<PictureEntity> page = dao.getPage(PICTURE_NAME_SPACE+"selectPageList", PICTURE_NAME_SPACE+"selectPageCount", params);
		return page;
	}

	@Override
	public void savePicture(String filePath) throws Exception {
		if(StringUtils.isNotEmpty(filePath)) {
			PictureEntity picture = new PictureEntity();
			Date now = new Date();
			picture.setCreateTime(now);
			picture.setUpdateTime(now);
			picture.setDesc("");
			picture.setPath(filePath);
			picture.setType(Constant.PICTURE_TYPE_MANUAL);
			dao.insert(PICTURE_NAME_SPACE+"insertSelective", picture);
		}
	}

}
