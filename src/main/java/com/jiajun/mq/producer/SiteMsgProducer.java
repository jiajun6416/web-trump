package com.jiajun.mq.producer;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Component;

import com.jiajun.websocket.EventMessage;

/**
 * 发布站内信的生产者
 * Created by jiajun on 2017/08/13 00:35
 */
@Component
public class SiteMsgProducer {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteMsgProducer.class);
	
	@Autowired
	@Qualifier("jmsTopicTemplate")
	private JmsTemplate jmsTemplate;
	
	@Autowired
	@Qualifier("siteMsgTopic")
	private Destination destination;
	
	public void publicMsg(EventMessage message) throws Exception{
		jmsTemplate.send(destination, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				return session.createObjectMessage(message);
			}
		});
		logger.info("mq: public message {} to topic {}", message, destination);
	}	
}
