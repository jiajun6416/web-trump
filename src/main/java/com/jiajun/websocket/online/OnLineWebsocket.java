package com.jiajun.websocket.online;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.jiajun.websocket.HttpConfigurator;

/**
 * @desc 在线管理websocket 
 * @author JIAJUN
 * @date 2017年7月30日下午3:25:06
 */
//@ServerEndpoint(value="/ws/online", configurator=HttpConfigurator.class)
public class OnLineWebsocket {
	
	
	@OnOpen
	public void onopen(EndpointConfig  config, Session session) {
		
	}
	
	@OnError
	public void onerro(Session session, Throwable error){
		
	}
	
	@OnMessage
	public void onmessage(Session session, String content) {
		
	}
	
	@OnClose
	public void onclose() {
		
	}
	
}
