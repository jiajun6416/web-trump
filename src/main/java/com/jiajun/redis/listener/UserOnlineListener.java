package com.jiajun.redis.listener;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.jiajun.util.Constant;
import com.jiajun.util.SerializeUtils;
import com.jiajun.websocket.online.OnlineWebSocketHandler;

/**
 * 订阅用户上线或者下线频道
 * 
 * @author jiajun
 * @date 2017/08/06 13时
 */
public class UserOnlineListener implements MessageListener{
	
	@Autowired
	private OnlineWebSocketHandler onLineHandler;
	
	private static Logger logger = LoggerFactory.getLogger(UserOnlineListener.class);
	
	
	@Override
	public void onMessage(Message message, byte[] pattern) {
		String mesg = (String) SerializeUtils.deserialize(message.getBody());
		logger.info("accept message {}", message);

		int index = mesg.lastIndexOf("_");
		String username = mesg.substring(0, index);
		String sessionId = mesg.substring(index);
		
		WebSocketSession session = onLineHandler.getOnlinePool().get(username);
		if(session != null && !session.getId().equals(sessionId)) {
			//发送下线消息
			TextMessage msg = new TextMessage(Constant.USER_BE_REPLACED);
			logger.info("send replaced info to {}", username);
			try {
				session.sendMessage(msg);
			} catch (IOException e) {
				logger.error("send message error", e);
			}
		}
	}

}
