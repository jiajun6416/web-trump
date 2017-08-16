package com.jiajun.service;

import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.information.PictureEntity;

public interface PictureService {
	
	Page<PictureEntity> getPage(ParameMap params) throws Exception;
	
}
