package com.jiajun.mq.consumer;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.listener.SessionAwareMessageListener;
import org.springframework.stereotype.Component;

import com.jiajun.websocket.EventMessage;
import com.jiajun.websocket.online.OnlineWebSocketHandler;

/**
 * 接收activemq发布消息的监听器
 * topic : 站内信息 site_msg
 * 
 * @CreatedBy jiajun on 2017/08/13 00:32
 */
@Component
public class SiteMsgTopicListener implements SessionAwareMessageListener<Message>{
	
	private static final Logger logger = LoggerFactory.getLogger(SiteMsgTopicListener.class);
	@Autowired
	private OnlineWebSocketHandler onlineWebSocketHandler;
	
	@Override
	public void onMessage(Message message, Session session) throws JMSException {
		ObjectMessage objectMsg = (ObjectMessage) message;
		EventMessage eventMsg = (EventMessage) objectMsg.getObject();
		logger.info("mq customer: accetp message {}", eventMsg);
		onlineWebSocketHandler.sendSiteMsg(eventMsg.getTo(), eventMsg);
	}

}
