package com.jiajun.shiro.filter;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.util.Constant;
import com.jiajun.util.HttpUtils;
import com.jiajun.util.JsonUtils;

/**
 * @desc 自定义的基于权限的过滤器, 实现 1. 如果admin用户则直接放行. 2. 权限不足时候, 如果是http请求则跳转定义的好的页面,
 *       如果是ajax请求,则返回json字符串
 * 
 * 	
 * @author JIAJUN
 * @date 2017年7月23日下午6:20:02
 */
public class MyPermissionsAuthorizationFilter extends PermissionsAuthorizationFilter {

	@Override
	/*
	 * 是否具有权限
	 */
	public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws IOException {
		Subject subject = this.getSubject(request, response);
		if (subject.isAuthenticated()) {
			SysUserEntity user = (SysUserEntity) subject.getPrincipal();
			// 如若是admin, 则直接放行
			if (user != null && user.getRoleId().equals(Constant.ADMIN_ROLE_ID)) {
				return true;
			}
		}
		return super.isAccessAllowed(request, response, mappedValue);
	}

	@Override
	/*
	 * 没有权限时候如何操作
	 */
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
		HttpServletResponse res = (HttpServletResponse)response;
        Subject subject = getSubject(request, response);
        boolean isAjax = HttpUtils.isAjaxRequest((HttpServletRequest)request);
        //没有登陆
        if (subject.getPrincipal() == null) {
        	if(isAjax) {
        		//自定义输出
        		String result = JsonUtils.encode(ResultModel.build(500, "您尚未登录或登录时间过长,请重新登录!"));
        		res.getWriter().print(result);
        	} else {
        		saveRequestAndRedirectToLogin(request, response);
        	}
        // 权限不足
        } else {
        	if(isAjax) {
        		String result = JsonUtils.encode(ResultModel.build(500, "权限不足!"));
        		res.getWriter().print(result);
        	} else {
        		String unauthorizedUrl = getUnauthorizedUrl();
        		if (StringUtils.hasText(unauthorizedUrl)) {
        			WebUtils.issueRedirect(request, response, unauthorizedUrl);
        		} else {
        			WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
        		}
        	}
        }
        return false;
	}
}
