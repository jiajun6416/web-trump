package com.jiajun.shiro.realm;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;

public class CustomRealm extends AuthorizingRealm{

	private static Logger log = LoggerFactory.getLogger(CustomRealm.class);
	
	@Autowired
	private SysUserService userService;
	
	@Value("${salt}")
	private String salt;
	
	@Override
	/**
	 * 认证, 认证成功返回principals信息
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//取出用户名
		String username = (String) token.getPrincipal();
		
		SysUserEntity user;
		try {
			user = userService.getUserByUsername(username);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			//没有找到账号
			throw new UnknownAccountException();
		}
		if(user == null) {
			throw new UnknownAccountException();
		}
		//将activeUser设置simpleAuthenticationInfo
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, //user是主体
				user.getPassword(),
				ByteSource.Util.bytes(salt.getBytes()),
				this.getName()
				);
		return simpleAuthenticationInfo;
	}
	
	@Override
	/**
	 * 授权
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//之前放入的主体是user, 则取出的也是user
		SysUserEntity user = (SysUserEntity) principals.getPrimaryPrincipal();
		try {
			List<String> premissionList;
			if(user.getRoleId().equals(Constant.SYSTEM_ROLE)) {
				//admin查询所有的资源
				premissionList = userService.getAdminPermissionList();
			} else {
				 premissionList = userService.getPermissionListById(user.getId());
			}
			SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
			simpleAuthorizationInfo.addStringPermissions(premissionList);
			//如果是admin,则添加, 后面有只有admin才能用的权限
			if(user.getRoleId().equals(Constant.SYSTEM_ROLE)) {
				simpleAuthorizationInfo.addRole("admin");
			}
			return simpleAuthorizationInfo;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(),e);
		}
		return null;
	}
}
