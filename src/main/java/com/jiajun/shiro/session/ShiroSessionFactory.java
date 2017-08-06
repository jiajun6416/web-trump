package com.jiajun.shiro.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;

/**
 * 返回自定义的shiroSession工厂, 默认是返回simpleSession
 * @author jiajun
 * @date 2017/08/05 13时
 */
public class ShiroSessionFactory implements SessionFactory{

	@Override
	public Session createSession(SessionContext initData) {
        if (initData != null) {
            String host = initData.getHost();
            if (host != null) {
                return new SimpleShiroSession(host);
            }
        }
        return new SimpleShiroSession();
	}
}
