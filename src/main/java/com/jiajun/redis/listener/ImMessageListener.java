package com.jiajun.redis.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;

import com.jiajun.util.Constant;
import com.jiajun.util.SerializeUtils;
import com.jiajun.websocket.EventMessage;
import com.jiajun.websocket.im.ImWebSocketHandler;

/**
 * 使用redis channel实现集群环境下的消息共享
 * 
 * @Date 2017/08/10 14时
 */
public class ImMessageListener implements MessageListener{

	private static Logger logger = LoggerFactory.getLogger(ImMessageListener.class);
	
	@Autowired
	private ImWebSocketHandler imWebSokcerHander;
	
	@Override
	public void onMessage(Message message, byte[] pattern) {
		EventMessage eventMsg = (EventMessage) SerializeUtils.deserialize(message.getBody());
		if(eventMsg == null) {
			return;
		}
		logger.info("channel: im listener accept msg: {}", eventMsg.toString());
		String msgType = eventMsg.getType();
		String username = (String) eventMsg.getContent();
		if(Constant.IM_TYPE_USER_JOIN.equals(msgType)) {
			imWebSokcerHander.sendToOthers(eventMsg, username);
		} else if (Constant.IM_TYPE_USER_TALK.equals(msgType)) {
			imWebSokcerHander.sendToAll(eventMsg);
		} else if(Constant.IM_TYPE_USER_LEAVE.equals(msgType)) {
			imWebSokcerHander.sendToAll(eventMsg);
		}
	}
	
}
