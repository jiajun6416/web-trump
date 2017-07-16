package com.jiajun.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.UUID;

/**
 * @描述：工具类
 * @author jiajun
 * @date 2017年6月11日下午11:10:40
 */
public class Tools {
	
	public static final String SPLIT_PATTERN = "^(([0-9]++),)++([0-9]++)$";
	
	/**
	 * 读取properties文件
	 * @param filePath
	 * @param key
	 * @return
	 */
	public static String getProperties(String filePath, String key) {
		//使用classLoad加载一个配置文件, 更路径 / 表示classpath
		InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(filePath);
		Properties pro = new Properties();
		try {
			pro.load(is);
			return (String) pro.get(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 获得32未随机数
	 * @return
	 */
	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "");
	}
	
	/**
	 *  以 , 为分隔符校验输入
	 * @param str
	 * @return
	 */
	public static boolean regular(String str) {
		return str.matches(SPLIT_PATTERN) || str.matches("\\d++");
	}
	
	public static void main(String[] args) {
		System.out.println(Tools.regular("1222,2,3,1,22222222222"));
	}
}
