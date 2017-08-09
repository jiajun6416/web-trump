package com.jiajun.redis.listener;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.web.socket.WebSocketSession;

import com.jiajun.util.Constant;
import com.jiajun.util.SerializeUtils;
import com.jiajun.websocket.EventMessage;
import com.jiajun.websocket.online.OnlineWebSocketHandler;

/**
 * websocket 在集群环境下的容器共享
 * 
 *  订阅用户上线或者下线频道
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
		EventMessage eventMsg = (EventMessage) SerializeUtils.deserialize(message.getBody());
		if(eventMsg == null) {
			return;
		}
		logger.info("accept message {}", message);
		if(Constant.MESSAGE_TYPE_USER_BE_REPLACED.equals(eventMsg.getType())) {
			//用户被挤掉
			String mesg = (String) eventMsg.getContent();
			int index = mesg.lastIndexOf("_");
			String username = mesg.substring(0, index);
			String sessionId = mesg.substring(index);
			//使用username+sessionId来删除的不是当前的
			WebSocketSession session = onLineHandler.getOnlinePool().get(username);
			if(session != null && !session.getId().equals(sessionId)) {
				onLineHandler.sendReplaceMessage(session);
			}
		} else if(Constant.MESSAGE_TYPE_USER_ONLINE.equals(eventMsg.getType()) || Constant.MESSAGE_TYPE_USER_LOGOUT.equals(eventMsg.getType())) {
			//用户上线,或者下线
			onLineHandler.sendOnlineUsers();
		} else if(Constant.MESSAGE_TYPE_USER_GO_OUT.equals(eventMsg.getType())) {
			//用户被T出
			WebSocketSession session = onLineHandler.getOnlinePool().get(eventMsg.getContent());
			if(session != null ) {
				onLineHandler.sendGoOutMessage(session);
			}
		}
	}
}
