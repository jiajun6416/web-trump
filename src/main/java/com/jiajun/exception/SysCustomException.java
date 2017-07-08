package com.jiajun.exception;

/**
 * @描述：系统自定义异常, 可以用作一些业务处理使用
 * @author jiajun
 * @date 2017年7月7日下午11:26:47
 */
public class SysCustomException  extends Exception{

	private String message;

	public SysCustomException(String message) {
		this.message = message;
	}
		
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String getMessage() {
		return message;
	}
}
