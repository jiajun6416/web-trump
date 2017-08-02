package com.jiajun.shiro.session;

import java.io.Serializable;
import java.util.Collection;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;

/**
 * @Desc session DAO, 
 * 		 session是由SessionFactory根据相应subject创建的.默认是simpleSession
 * @author tvu
 * @Date 2017/08/02 11:09:18
 * @version 1.0.0
 */
public class RedisSessionDAO extends AbstractSessionDAO{
	
	@Override
	public void update(Session session) throws UnknownSessionException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Session session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Collection<Session> getActiveSessions() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Serializable doCreate(Session session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
		// TODO Auto-generated method stub
		return null;
	}

}
