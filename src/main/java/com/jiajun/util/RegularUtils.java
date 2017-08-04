package com.jiajun.util;

/**
 * 正则匹配
 * @author tvu
 * @Date 2017/08/04 15时
 */
public class RegularUtils {
	
	/*数字以,分隔开的正则*/
	public static final String SPLIT_PATTERN = "^(([0-9]++),)++([0-9]++)$";
	
	public static boolean regular(String str) {
		return str.matches(SPLIT_PATTERN) || str.matches("\\d++");
	}
	
}
