package com.jiajun.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiajun.pojo.system.SysUserEntity;

/**
 * @desc shiro session管理 
 * @author JIAJUN
 * @date 2017年7月30日下午7:59:50
 */
public class ShiroSessionManager{
	
	@Autowired
	private SessionDAO sessionDao;
	
	public List<SysUserEntity> getAllLoginUser() {
		Collection<Session> activeSessions = sessionDao.getActiveSessions();
		if(CollectionUtils.isNotEmpty(activeSessions)) {
			List<SysUserEntity> loginUserList = new ArrayList<>();
			for(Session activeSession : activeSessions) {
				SysUserEntity user = (SysUserEntity) activeSession.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
				loginUserList.add(user);
			}
		}
		return null;
	}
	
}
