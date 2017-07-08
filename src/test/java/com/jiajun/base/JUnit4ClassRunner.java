package com.jiajun.base;

import java.io.FileNotFoundException;

import org.junit.runners.model.InitializationError;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Log4jConfigurer;

/**
 * @描述：单元测试时候可以自定义log4j位置
 * @author jiajun
 * @date 2017年6月4日下午8:20:02
 */
public class JUnit4ClassRunner extends SpringJUnit4ClassRunner{

	static {
		try {
			Log4jConfigurer.initLogging("classpath:config/log4j.properties");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public JUnit4ClassRunner(Class<?> clazz) throws InitializationError {
		super(clazz);
	}

}
