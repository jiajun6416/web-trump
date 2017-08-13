package com.jiajun.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jiajun.dao.base.Dao;
import com.jiajun.mq.producer.SiteMsgProducer;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SiteMsgEntity;
import com.jiajun.service.SiteMsgService;
import com.jiajun.util.Constant;
import com.jiajun.websocket.EventMessage;

@Service
public class SiteMsgServiceImpl implements SiteMsgService {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteMsgServiceImpl.class);
	private static final String SITE_MSG_MAME_SPACE = "SiteMsgMapper.";
	
	@Autowired
	@Qualifier("daoImpl")
	private Dao dao;
	
	@Autowired
	private SiteMsgProducer msgProducer;

	@Override
	public void save(String sender, String content, String... receives) throws Exception {
		Date now = new Date();
		for(String receive : receives) {
			SiteMsgEntity siteMsgEntity = new SiteMsgEntity();
			siteMsgEntity.setContent(content);
			siteMsgEntity.setReceive(receive);
			siteMsgEntity.setSender(sender);
			siteMsgEntity.setStatus(Constant.SITE_MSG_SENDING);
			siteMsgEntity.setCreateTime(now);
			siteMsgEntity.setUpdateTime(now);
			dao.insert(SITE_MSG_MAME_SPACE+"insert", siteMsgEntity);
			logger.info("insert into db");
			
			EventMessage eventMsg = new EventMessage();
			eventMsg.setFrom(sender);
			eventMsg.setTo(receive);
			//消息体是数据库中的id, 收到直接去数据库查询
			eventMsg.setContent(siteMsgEntity.getId());
			
			msgProducer.publicMsg(eventMsg);
		}
	}

	@Override
	public void updateTOSendSuccess(Integer mesgId) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("id", mesgId);
		params.put("status", Constant.SITE_MSG_SEND_SUCCESS);
		params.put("updateTime", new Date());
		dao.update(SITE_MSG_MAME_SPACE+"updateStatus", params);
		logger.info("update msg (id: {}) status to send success", mesgId);
	}

	@Override
	public Page<SiteMsgEntity> getMsgPage(ParameMap params) throws Exception {
		String currentPage = (String) params.get("currentPage");
		if(StringUtils.isEmpty(currentPage)) {
			params.put("currentPage", 1);
		} else {
			params.put("currentPage", Integer.valueOf(currentPage));
		}
		String pageSize = (String) params.get("pageSize");
		if(StringUtils.isEmpty(pageSize)) {
			params.put("rows", Integer.valueOf(Constant.getConfig("page.size")));
		} else {
			params.put("rows", Integer.valueOf(pageSize));
		}
		Page<SiteMsgEntity> page = dao.getPage( SITE_MSG_MAME_SPACE+"selectPageList", SITE_MSG_MAME_SPACE+"selectPageNums", params);
		return page;
	}

	@Override
	public int getUnReadMsg(String receive) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("updateTime", new Date());
		params.put("receive", receive);
		dao.update(SITE_MSG_MAME_SPACE+"updateStatusByReceive", params);
		//查询未读消息的条数
		int nums = (int) dao.selectObject(SITE_MSG_MAME_SPACE+"selectUnReadNums", receive);
		return nums;
	}
	

}
