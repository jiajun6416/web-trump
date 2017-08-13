package com.jiajun.shiro.realm;

import java.util.List;

import org.apache.shiro.SecurityUtils;
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

	private static Logger logger = LoggerFactory.getLogger(CustomRealm.class);
	
	@Autowired
	private SysUserService userService;
	
	@Value("${salt}")
	private String salt;
	
	/**
	 * 认证, 认证成功返回principals信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//取出用户名
		String username = (String) token.getPrincipal();
		
		SysUserEntity user;
		try {
			user = userService.getUserByUsername(username);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			//没有找到账号
			throw new UnknownAccountException();
		}
		if(user == null) {
			throw new UnknownAccountException();
		}
		//将activeUser设置simpleAuthenticationInfo
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), //username
				user.getPassword(),
				ByteSource.Util.bytes(salt.getBytes()),
				this.getName()
				);
		return simpleAuthenticationInfo;
	}
	
	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//之前放入的主体是user, 则取出的也是user
		//SysUserEntity user = (SysUserEntity) principals.getPrimaryPrincipal();
		//放入的是username, 使用redis存储的key就是认证信息.也短一点
		String username = (String) principals.getPrimaryPrincipal();
		try {
			SysUserEntity user = userService.getUserByUsername(username);
			List<String> premissionList;
			logger.info("query username {}  premission from db", username);
			if(user.getRoleId().intValue()==Constant.SYSTEM_ROLE) {
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
			logger.error(e.getMessage(),e);
		}
		return null;
	}
	
	/**
	 * 每次修改权限之后都清空缓存,底层调用的还是redisCache中的clear
	 */
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}

	
}
