package com.jiajun.exception;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.jiajun.pojo.ResultModel;
import com.jiajun.util.HttpUtils;
import com.jiajun.util.JsonUtils;

/**
 * @描述：全局异常处理器
 * @author jiajun
 * @date 2017年7月7日下午11:06:48
 */
public class SyetemExceptionHandler implements HandlerExceptionResolver {

	private Logger logger = LoggerFactory.getLogger(SyetemExceptionHandler.class);

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception e) {

		logger.error("======================发生异常=============================== ");
		logger.error(e.getMessage(), e);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exceptionMsg", e.getMessage());
		boolean isAjax = HttpUtils.isAjaxRequest(request);
		// 没有登陆
		if (e instanceof UnauthenticatedException) {
			if(isAjax) {
        		String result = JsonUtils.encode(ResultModel.build(500, "您尚未登录或登录时间过长,请重新登录!"));
        		write(response, result);
        		return null;
			} else {
				modelAndView.setViewName("refuse");
			}
			//权限不足
		} else if (e instanceof UnauthorizedException) {
			if(isAjax) {
        		String result = JsonUtils.encode(ResultModel.build(500, "权限不足!"));
        		write(response, result);
        		return null;
			} else {
				modelAndView.setViewName("refuse");
			}
		} else {
			modelAndView.setViewName("error");
		}
		return modelAndView;
	}
	
	private static void write(HttpServletResponse response, String msg) {
		PrintWriter write;
		try {
			write = response.getWriter();
			write.write(msg);
			write.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
