package com.jiajun.controller.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jiajun.pojo.ParameMap;
import com.jiajun.util.Constant;

public class BaseController {
	
	protected static Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	/**
	 * 获得请求参数map集合
	 * @return
	 */
	protected ParameMap getParaMap() {
		return new ParameMap(getRequest());
	}
	
	protected ParameMap getParaMap(HttpServletRequest request) {
		return new ParameMap(request);
	}
	
	/**
	 * 在其他层获得request的方法
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	
	/**
	 * 获得请求来源的ip地址
	 * @param request
	 * @return
	 */
	public String getIP(HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		if(ip != null && "0:0:0:0:0:0:0:1".equals(ip)) {
			return Constant.LOCALHOST;
		} else {
			return ip;
		}
	}
	
	/**
	 * 获得登录用户的name
	 * @param session
	 * @return
	 */
	public String getLoginUser(HttpSession session) {
		SimplePrincipalCollection peincipal = (SimplePrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
	//	SysUserEntity user = (SysUserEntity) peincipal.getPrimaryPrincipal();
	//	return user.getUsername();
		String username = (String) peincipal.getPrimaryPrincipal();
		return username;
	}

	 
	public String getLoginUser() {
		Subject subject = SecurityUtils.getSubject();
		return (String) subject.getPrincipal();
	}
}
