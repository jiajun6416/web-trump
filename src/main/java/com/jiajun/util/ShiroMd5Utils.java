package com.jiajun.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * @desc 使用shiro的md5加密 
 * @author JIAJUN
 * @date 2017年7月22日下午11:32:42
 */
public class ShiroMd5Utils {
	
	
	public static String getSimpleMd5(String source) {
		Md5Hash md5Hash = new Md5Hash(source, null, 1);
		return md5Hash.toString();
	}
	
	/**
	 * 
	 * @param source 加密的值
	 * @param salt 盐
	 * @param hashIterations 散列次数
	 * @return
	 */
	public static String getMd5AddSalt(String source, String salt, int hashIterations) {
		Md5Hash md5Hash = new Md5Hash(source, salt, hashIterations);
		//或者
	//	SimpleHash simpleHash = new SimpleHash("md5", source, salt, hashIterations);
		return md5Hash.toString();
	}
	
	public static void main(String[] args) {
		String source = "123";
		String salt = "jiajun";
		String once = ShiroMd5Utils.getSimpleMd5(source);
		String second = ShiroMd5Utils.getMd5AddSalt(once, salt, 1);
		System.out.println(second);
	}
}
