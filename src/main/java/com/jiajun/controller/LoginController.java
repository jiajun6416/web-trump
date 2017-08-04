package com.jiajun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.pojo.system.SysUserPhotoEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysMenuService;
import com.jiajun.service.SysRoleService;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;

/**
 * @描述：登录控制
 * @author jiajun
 * @date 2017年6月11日下午9:02:31
 */
@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysLogService sysLogService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysMenuService sysMenuService;
	
	//跳转登录
	@RequestMapping("/toLogin") 
	public String toLoginPage(Model model, HttpSession session, HttpServletRequest request) {
		//设置登陆页面的信息
		model.addAttribute("music",Constant.getConfig("music"));
		return "system/index/login";
	}
	
	
	@RequestMapping("/login")
	@ResponseBody
	public ResultModel login(@RequestParam(required=true)String username, @RequestParam(required=true)String password,
			@RequestParam(required=true)boolean rememberMe,@RequestParam(required=true)String code,
			HttpServletRequest request, HttpSession session) {
		String randCode = (String) session.getAttribute(Constant.SESSION_LOGION_CHECK_CODE);
		if(StringUtils.isEmpty(code) || !code.equalsIgnoreCase(randCode)) {
			return ResultModel.build(403, "验证码错误");
		}
		//认证
		Subject subject = SecurityUtils.getSubject();  
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);  
		token.setRememberMe(rememberMe);
		try {
			subject.login(token);
			//认证成功后的一些操作
			//SysUserEntity sysUser  = (SysUserEntity) subject.getPrincipal();
			//**************
			SysUserEntity sysUser = sysUserService.getUserByUsername(username);
			sysUserService.updateLoginInfo(sysUser.getId(), this.getIP(request));
			session.removeAttribute(Constant.SESSION_LOGION_CHECK_CODE);
			sysLogService.save(username, this.getIP(request), "登录成功");
			SysRoleEntity role = sysRoleService.getRoleById(sysUser.getRoleId());
			List<SysMenuEntity> menuList = sysMenuService.getMenuListByRoleId(role.getId());
			SysUserPhotoEntity photo = sysUserService.getUserPhoto(sysUser.getId());
			session.setAttribute(Constant.SESSION_USER_PHOTO, photo);
			session.setAttribute("menuList", menuList);

		} catch (Exception e) {
			if(e instanceof UnknownAccountException) {
				logger.info("用户名不存在");
				return ResultModel.build(500, "用户名不存在");
			} else if (e instanceof IncorrectCredentialsException) {
				logger.info("用户名或者密码错误");
				return  ResultModel.build(500, "用户名或者密码错误");
			} else {
				logger.error(e.getMessage(),e);
				return ResultModel.build(500, "系统异常");
			}
		}
		return ResultModel.build(200, "success");
	}
	
	//登录, 使用shiro的表单filter进行认证
/*	@RequestMapping("/login")
	@ResponseBody
	public ResultModel login(String loginInfo, String timestamp, Model model, HttpServletRequest request, HttpSession session) {
		
		String code = (String) session.getAttribute(Constant.SESSION_SECURITY_CODE);
		String inputCode = loginInfo.substring(loginInfo.length()-4);
		
		if(StringUtils.isNotEmpty(code) && StringUtils.isNotEmpty(inputCode) && code.equalsIgnoreCase(inputCode)) {
			//判断用户名和密码是否错误
			String token = (String) session.getAttribute(Constant.SESSION_TOKEN_CODE);
			String[] nameAndPwd = loginInfo.substring(0, loginInfo.length()-4).split(token);
			String username = nameAndPwd[0];
			String password = nameAndPwd[1];
			
			ParameMap params = new ParameMap();
			params.put("username", username);
			params.put("password", password);
			
			try {
				SysUserEntity sysUser = sysUserService.getSysUserByNameAndPwd(params);
				if(sysUser != null) {
					//修改用户的登陆状态
					sysUserService.updateLoginInfo(sysUser.getId(), this.getIP(request));
					sysUser.setPassword(null);
					session.setAttribute(Constant.SESSION_USER, sysUser);
					//清除验证码
					session.removeAttribute(Constant.SESSION_SECURITY_CODE);
					sysLogService.save(username, this.getIP(request), "登录成功");
					//将用户菜单加入到session中
					SysRoleEntity role = sysRoleService.getRoleById(sysUser.getRoleId());
					List<SysMenuEntity> menuList = sysMenuService.getMenuListByRoleId(role.getId());
					//System.out.println(menuList);
					session.setAttribute("menuList", menuList);
					return ResultModel.build(200, "success");
				} else {
					sysLogService.save(this.getLoginUser(session), this.getIP(request), "登录用户名或者密码错误");
					return ResultModel.build(500, "用户名或者密码错误");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return ResultModel.build(500, "系统错误, 请稍候");
			}
		} else {
			//验证码错误
			return ResultModel.build(400, "codeError");
		}
	}*/
	
	@RequestMapping("/refuse")
	public String refuse(Model model) {
		return "refuse";
	}
	
	/**
	 * 主菜单切换
	 * @param menu
	 * @return
	 */
	@RequestMapping("/main/{menu}")
	public String changeMainMenu(@PathVariable("menu")String menu) {
		return "system/index/main";
	}
	
	/**
	 *tab标签页, 作用是创建一个个从而达到多tab效果
	 * @return
	 */
	@RequestMapping("/tab")
	public String tab(){
		return "system/index/tab";
	}
	
	/**
	 * tab默认加载主页
	 */
	@RequestMapping("/login_default")
	public String defaulePage(){
		//TODO 有一些表格需要显示
		return "system/index/default";
	}
	
}
