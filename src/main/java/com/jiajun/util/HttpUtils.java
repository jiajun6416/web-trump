package com.jiajun.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

/**
 * @desc http 工具类 
 * @author JIAJUN
 * @date 2017年7月23日下午9:56:09
 */
public class HttpUtils {
	
	/**
	 * 判断是否是ajax请求
	 * @param request
	 * @return
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {
		boolean mine = request.getHeader("accept").contains("application/json");
		String header = request.getHeader("X-Requested-With");
		if(mine || StringUtils.isNoneEmpty(header) && header.contains("XMLHttpRequest")) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 返回json对象
	 * @param reponse
	 * @param object
	 */
	public static void WriteJson(HttpServletResponse response, Object object) {
		response.setContentType("application/json; charset=utf-8");
		 PrintWriter write = null;
			try {
				write = response.getWriter();
				write.write(JsonUtils.encode(object));
				write.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if(write != null) {
					write.close();
				}
				write = null;
			}
	}
	
	/**
	 * 返回返回json格式的字符串
	 * @param reponse
	 * @param object
	 */
	public static void WriteJson(HttpServletResponse response, String msg) {
		response.setContentType("application/json; charset=utf-8");
		 PrintWriter write = null;
			try {
				write = response.getWriter();
				write.write(msg);
				write.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if(write != null) {
					write.close();
				}
				write = null;
			}
	}
}
