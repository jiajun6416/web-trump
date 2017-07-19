package com.jiajun.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysMenuService;
import com.jiajun.service.SysRoleService;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;
import com.jiajun.util.Tools;

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
		String token = Tools.getUUID();
		//加入一个token进行密码加密
		session.setAttribute(Constant.SESSION_TOKEN_CODE, token);
		model.addAttribute("token", token);
		model.addAttribute("title", Tools.getProperties("/config/config.properties", "title"));
		model.addAttribute("music", Tools.getProperties("/config/config.properties", "music"));
		return "system/index/login";
	}

	//登录
	@RequestMapping("/login")
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
					sysUser.setPassword("");
					session.setAttribute(Constant.SESSION_USER, sysUser);
					//清除验证码
					session.removeAttribute(Constant.SESSION_SECURITY_CODE);
					sysLogService.save(username, this.getIP(request), "登录成功");
					
					//将用户菜单加入到session中
					SysRoleEntity role = sysRoleService.getByUserId(sysUser.getId());
					List<SysMenuEntity> menuList = sysMenuService.getMenuListByRoleId(role.getId());
				//	System.out.println(menuList);
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
		
	}
	
	/**
	 * 主菜单切换
	 * @param menu
	 * @return
	 */
	@RequestMapping("main/{menu}")
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
