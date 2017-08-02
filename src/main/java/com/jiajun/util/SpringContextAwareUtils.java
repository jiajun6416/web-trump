package com.jiajun.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * @Desc spring applicationContex utils ,只要实现ApplicationContextAware
 *      会自动注入spring容器， 前提是这个类需要被spring管理
 * 
 * @Date 2017/08/02 13:22:23
 * @version 1.0.0
 */
public class SpringContextAwareUtils implements ApplicationContextAware{
	
	
	private static ApplicationContext applicationContext; 

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	public static Object getBean(String name) throws BeansException {
		return applicationContext.getBean(name);
	}

	public static <T> T getBean(String name, Class<T> requiredType) 
			throws BeansException {
		return applicationContext.getBean(name, requiredType);
	}

	public static boolean containsBean(String name) {
		return applicationContext.containsBean(name);
	}

	public static boolean isSingleton(String name) 
			throws NoSuchBeanDefinitionException {
		return applicationContext.isSingleton(name);
	}

	public static Class<? extends Object> getType(String name) 
			throws NoSuchBeanDefinitionException {
		return applicationContext.getType(name);
	}

	public static String[] getAliases(String name)
	throws NoSuchBeanDefinitionException {
		return applicationContext.getAliases(name);
	}
}
