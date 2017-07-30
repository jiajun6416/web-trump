package com.jiajun.websocket.online;

import java.util.Map;

import javax.websocket.Session;

import org.ehcache.impl.internal.concurrent.ConcurrentHashMap;

/**
 * @desc  在线管理websocket容器
 * @author JIAJUN
 * @date 2017年7月30日下午4:32:30
 */
public class OnlinePoolHandler {
	
	/**
	 * onlinePool, 当前在线
	 */
	private Map<String, Session> onlinePool = new ConcurrentHashMap<>();
}
