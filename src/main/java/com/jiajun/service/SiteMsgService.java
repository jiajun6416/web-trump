package com.jiajun.service;

import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SiteMsgEntity;

/**
 * 站内信
 * Created by jiajun on 2017/08/13 15:28
 */
public interface SiteMsgService {
	
	
	/**
	 * 发送消息
	 * @param sender
	 * @param content
	 * @param receives
	 * @throws Exception
	 */
	void save(String sender, String content, String... receives) throws Exception;
	
	/**
	 * 设置消息状态为发送成功
	 * @param mesgId
	 * @throws Exception
	 */
	void updateTOSendSuccess(Integer mesgId) throws Exception;
	
	/**
	 * 
	 * 分页查询站内信息
	 * @param params
	 * @return
	 * @throws Exception
	 */
	Page<SiteMsgEntity> getMsgPage(ParameMap  params) throws Exception;
	
	/**
	 * 查询未读的消息条数, 并且将发送中的消息设置成发送成功
	 * @param receive
	 * @return
	 * @throws Exception
	 */
	int getUnReadMsg(String receive) throws Exception;
	
	
}
