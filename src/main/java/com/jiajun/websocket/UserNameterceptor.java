package com.jiajun.websocket;

import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

/**
 * 在握手前后加入一些自定义属性, 比如username
 * Created by jiajun on 2017/08/07 00:17
 */
@Component
public class UserNameterceptor extends HttpSessionHandshakeInterceptor {
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		//将用户名放入到session的, 虽然直接可以使用SecurityUtils.getSubject()获得
		String username = (String) SecurityUtils.getSubject().getPrincipal();
		attributes.put("username", username);
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
}
