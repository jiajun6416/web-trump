package com.jiajun.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysRoleService;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;
import com.jiajun.util.Tools;

/**
 * @描述：用户信息
 * @author jiajun
 * @date 2017年6月14日下午2:13:24
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysLogService sysLogService;
	
	/**
	 * 前往修改自己资料页面
	 */
	@RequestMapping("toEditMyself")
	public String toEditMyselfPage(HttpSession session, Model model) {
		SysUserEntity loginUser = (SysUserEntity) session.getAttribute(Constant.SESSION_USER);
		//表示修改自己
		model.addAttribute("edit_other", false);
		model.addAttribute("editType","updateMyself");
		model.addAttribute("user", loginUser);
		return "system/user/user_editSelf";
	}

	/**
	 * 保存修改自己
	 */
	@RequestMapping("updateSelf")
	public String updateMyself(SysUserEntity sysUser, Model model, HttpSession session, HttpServletRequest request) {
		SysUserEntity loginUser = (SysUserEntity) session.getAttribute(Constant.SESSION_USER);
		String username = loginUser.getUsername();
		//用户名不允许修改
		if(StringUtils.isNotEmpty(username) ) {
			sysUser.setUsername(null);
		}
		String ip = this.getIP(request);
		try {
			sysLogService.save(username, ip, "修改个人资料");
			sysUserService.updateSysUser(sysUser);
			//清空sesion重新登录
			session.invalidate();
			sysLogService.save(username, ip, "退出登录");
			//重定向到登录界面
			return "redirect:/toLogin";
		} catch (Exception e) {
			e.printStackTrace();
			sysLogService.save(username, ip, "修改个人资料失败");
			return "forward:/toEditMyself";
		}
	}
	
	/**
	 * 邮箱是否重复, 验证
	 * @param email
	 * 
	 * @return
	 */
	@RequestMapping("/hasEmail")
	@ResponseBody
	public ResultModel isReEmail(HttpSession session) {
		SysUserEntity loginUser = (SysUserEntity) session.getAttribute(Constant.SESSION_USER);
		Integer id = loginUser.getId();
		ParameMap params = getParaMap();
		params.put("id", id);
		boolean exist;
		try {
			exist = sysUserService.hasExistEmail(params);
			if(exist) {
				return ResultModel.build(500, "邮箱已存在");
			} else {
				return ResultModel.build(200, "邮箱可用");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultModel.build(500, "服务异常");
		}

	}
	
	@RequestMapping("/listUser")
	public String listUser(Model model) {
		//查询查询所有角色, 放入缓存中, 如果修改了则刷新缓存
		List<SysRoleEntity> roleList;
		ParameMap params = getParaMap();
		if(params.get("currentPage") == null || params.get("currentPage").equals("")) {
			params.put("currentPage", 1);
		}
		try {
			roleList = sysRoleService.getListByType(Constant.SYSTEM_ROLE);
			model.addAttribute("roleList", roleList);
			//如果rows没有指定的话, 自己读取制定的文件
			if(params.get("rows") == null || params.get("rows").equals("")) {
				String rows = Tools.getProperties("/config/config.properties", "page.size");
				params.put("rows", Integer.parseInt(rows));
			} else {
				String rows =  (String) params.get("rows");
				params.put("rows", Integer.parseInt(rows));
			}
			Page<SysUserEntity> page = sysUserService.getPage(params);
			
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("params", params);
		return "system/user/user_list";
	}
}
