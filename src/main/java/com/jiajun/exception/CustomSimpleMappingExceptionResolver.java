package com.jiajun.exception;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.jiajun.pojo.ResultModel;
import com.jiajun.util.HttpUtils;

/**
 * @desc 自定义异常处理器, 处理ajax和http异常, 使用HandlerExceptionResolver不能完成 
 * @author JIAJUN
 * @date 2017年7月23日下午9:29:52
 */
public class CustomSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver {
	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
        String viewName = determineViewName(ex, request);  
        if (viewName != null) {
            if (! HttpUtils.isAjaxRequest(request)) {  
            	//返回错误页面
                Integer statusCode = determineStatusCode(request, viewName);  
                if (statusCode != null) {  
                    applyStatusCodeIfPossible(request, response, statusCode);  
                } 
                //可以在域中存入一些提示消息 ...requet.setAttribute
                return getModelAndView(viewName, ex, request);  
            } else {
            	//返回json
            	if(ex instanceof UnauthenticatedException) {
            		HttpUtils.WriteJson(response, ResultModel.build(500, "您尚未登录或登录时间过长,请重新登录!"));
            	} else if(ex instanceof UnauthorizedException) {
            		//权限不足异常
            		HttpUtils.WriteJson(response, ResultModel.build(500, "权限不足!"));
            	}
                return null;  
            }  
        } else {  
            return null;  
        }  
	}
	
}
