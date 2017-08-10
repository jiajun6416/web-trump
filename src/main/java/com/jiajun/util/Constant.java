package com.jiajun.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

/**
 * @描述：包含项目中的常量
 * @author jiajun
 * @date 2017年6月11日下午9:23:03
 */
public class Constant {
	
	/**
	 * 全局属性集合
	 */
	private static final Map<String, String> global = new HashMap<>();
	/**
	 * 属性文件加载对象
	 */
	private static PropertiesLoader loader = new PropertiesLoader("config/config.properties");
	
	public static String getConfig(String key) {
		String value = global.get(key);
		if (value == null){
			value = loader.getProperty(key);
			global.put(key, value != null ? value : StringUtils.EMPTY);
		}
		return value;
	}
	
	/*session中的当前用户*/
//	public static  final String SESSION_USER = "sessionUser"; //废弃, 使用shiro中认证的用户信息
	/*session中存放的用户头像位置*/
	public static final String SESSION_USER_PHOTO = "userPhoto";
	/*验证码*/
	public static final String SESSION_LOGION_CHECK_CODE = "loginCheckCode";
	public static final String SESSION_REGIST_CHECK_CODE = "registCheckCode";
	/*32位置随机token*/
	public static final String SESSION_TOKEN_CODE = "sessionTokenCode";

	/*邮箱服务器配置路径*/
	public static  final String EMAIL = "";
	/*短信账户配置路径1*/
	public static final String SMS1 = "";
	/*文字水印配置路径*/
	public static final String FWATERM = "";
	/*微信配置路径*/
	public static final String WEIXIN	= "";
	/*webscoket配置路径*/
	public static final String WEBSOCKET = "";
	
	/*图片上传路径*/
	public static final String FILEPATHIMG = "uploadFiles/uploadImgs/";
	/*用户头像保存位置*/
	public static final String FILEPATHUSERPHOTO = "uploadFiles/uploadUserPhoto/";
	/*文件上传路径*/
	public static final String FILEPATHFILE = "uploadFiles/file/";			
	/*系统文件上传路径*/
	public static final String FILEPATHFILEOA = "uploadFiles/uploadFile/";	
	/*二维码存放路径*/
	public static final String FILEPATHTWODIMENSIONCODE = "uploadFiles/twoDimensionCode/"; 
	
	/*本机ip*/
	public static final String LOCALHOST = "127.0.0.1";
	
	//admin角色id
	public static final int ADMIN_ROLE_ID = 1;
	
	/*系统角色*/
	public static final int SYSTEM_ROLE =1;
	/*会员角色*/
	public  static final short VIP_ROLE = 2;
	public static final int LOGIN_USER_ROLE = 8;//普通会员
	/*组织角色*/
	public static final int ORGANIZE_ROLE = 3;
	public static final Short USER_LOGIN = 1;
	
	
	/*系统用户注册接口_请求协议参数)*/
	public static String[] SYSUSER_REGISTERED_PARAM_ARRAY = new String[]{"USERNAME","PASSWORD","NAME","EMAIL","rcode"};
	public static String[] SYSUSER_REGISTERED_VALUE_ARRAY = new String[]{"用户名","密码","姓名","邮箱","验证码"};
	
	/*app根据用户名获取会员信息接口_请求协议中的参数*/
	public static String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};

	/*用户在线*/
	public static final short SYS_USER_STATUS_ONLINE = 1;
	/*用户离线*/
	public static final short SYS_USER_STATUS_LEAVELINE = 0;
	/*用户可用*/
	public static final short SYS_USER_STATUS_IS_USEABLE = 1;
	/*用户被禁用*/
	public static final short SYS_USER_STATUS_NOT_USEABLE = 0;
	
	/*******************************
	  					online manager model
	 * **************************************************/
	
	/*用户被挤下线消息*/
	public static final String MESSAGE_TYPE_USER_BE_REPLACED = "user_replaced";
	/*所有用户信息*/
	public static final String MESSAGE_TYPE_USER_ONLIE_LIST = "user_online_list";
	/*用户上线消息*/
	public static final String MESSAGE_TYPE_USER_ONLINE = "user_online";
	/*用户下线消息*/
	public static final String MESSAGE_TYPE_USER_LOGOUT = "user_logout";
	/*用户被T下线*/
	public static final String MESSAGE_TYPE_USER_GO_OUT = "user_go_out";
	
	/*******************************
						im model
	 * **************************************************/	
	
	public static final String IM_TYPE_USER_LIST = "userList";
	public static final String IM_TYPE_USER_JOIN = "userJoin";
	public static final String IM_TYPE_USER_LEAVE = "userLeave";
	public static final String IM_TYPE_USER_TALK = "userTalk";
	
}


