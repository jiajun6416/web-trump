package com.jiajun.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * @描述：全局异常处理器
 * @author jiajun
 * @date 2017年7月7日下午11:06:48
 */
public class SyetemExceptionHandler implements HandlerExceptionResolver{

	private Logger logger = LoggerFactory.getLogger(SyetemExceptionHandler.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		logger.error("======================发生异常=============================== ", ex.getMessage());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exceptionMsg", ex.getMessage());
		modelAndView.setViewName("error");
		return modelAndView;
	}
	
}
