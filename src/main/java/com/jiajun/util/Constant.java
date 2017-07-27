package com.jiajun.util;

/**
 * @描述：包含项目中的常量
 * @author jiajun
 * @date 2017年6月11日下午9:23:03
 */
public class Constant {
	/*验证码*/
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	/*32位置随机token*/
	public static final String SESSION_TOKEN_CODE = "sessionTokenCode";
	/*session中的当前用户*/
	public static  final String SESSION_USER = "sessionUser";
	public static final String SESSION_USER_PHOTO = "userPhoto";
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
	public  static final int VIP_ROLE = 2;
	/*组织角色*/
	public static final int ORGANIZE_ROLE = 3;
	
	public static final Short USER_LOGIN = 1;
	
	
	/*系统用户注册接口_请求协议参数)*/
	public static String[] SYSUSER_REGISTERED_PARAM_ARRAY = new String[]{"USERNAME","PASSWORD","NAME","EMAIL","rcode"};
	public static String[] SYSUSER_REGISTERED_VALUE_ARRAY = new String[]{"用户名","密码","姓名","邮箱","验证码"};
	
	/*app根据用户名获取会员信息接口_请求协议中的参数*/
	public static String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};
}
