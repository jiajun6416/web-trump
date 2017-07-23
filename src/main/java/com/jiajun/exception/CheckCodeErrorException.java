package com.jiajun.exception;

/**
 * @desc 验证码错误异常 
 * @author JIAJUN
 * @date 2017年7月23日下午1:37:52
 */
public class CheckCodeErrorException extends Exception{
	
	private static final long serialVersionUID = -7445340872160651101L;

	private String message;

	public CheckCodeErrorException(String message) {
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
