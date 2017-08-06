package com.jiajun.websocket.online;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig.Configurator;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiajun.util.SpringContextAware;


/**
 * @desc 在线管理websocket 
 * @author JIAJUN
 * @date 2017年7月30日下午3:25:06
 */
//@ServerEndpoint(value="/ws/online", configurator=Configurator.class)
public class OnLineWebsocket extends SpringContextAware{
	
	private static Logger logger = LoggerFactory.getLogger(OnLineWebsocket.class);
	
	private OnlineHandler onlineHandler; 
	
	private String username;
	
	/**
	 * 登陆成功,链接上websocket,此时先查询是否已经登陆过, 登陆过把前面的T掉
	 * @param config
	 * @param session
	 */
	@OnOpen
	public void onopen(EndpointConfig  config, Session session) {
		onlineHandler = (OnlineHandler) getBean("onlineHandler");
		//获得登陆用户
		username = (String) SecurityUtils.getSubject().getPrincipal();
		logger.info("user {} online", username);
		onlineHandler.userJoin(username, session);
	}
	
	@OnError
	public void onerro(Throwable error){
		logger.error("online websocket error", error);
	}
	
	/**
	 * 前台不会给后台发消息的
	 * @param session
	 * @param message
	 */
	@OnMessage
	public void onmessage(Session session, String message) {
		logger.info("online websocket accept message: {}", message);
	}
	
	/**
	 * 发送给redis, 
	 */
	@OnClose
	public void onclose(Session session) {
		onlineHandler.userLeave(username, session);
	}
	
}
