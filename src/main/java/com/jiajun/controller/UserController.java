package com.jiajun.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysRoleService;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;
import com.jiajun.util.JsonUtils;
import com.jiajun.util.PropertiesLoader;
import com.jiajun.websocket.online.OnlineWebSocketHandler;

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
	@Autowired
	private SessionDAO sessioDAO;
	
	/**
	 * 修改自己
	 * @throws Exception 
	 */
	@RequestMapping("toEditMyself")
	public String toEditMyselfPage(HttpSession session, Model model) throws Exception {
		String username = getLoginUser();
		SysUserEntity loginUser = sysUserService.getUserByUsername(username);
		SysRoleEntity role = sysRoleService.getRoleById(loginUser.getRoleId());
		loginUser.setRole(role);
		model.addAttribute("edit_other", false);
		model.addAttribute("editType","updateMyself");
		model.addAttribute("user", loginUser);
		model.addAttribute("msg", "editSelef");
		model.addAttribute("action", "updateSelf");
		return "system/user/user_input";
	}
	/**
	 * 保存修改自己
	 */
	@RequestMapping("/updateSelf")
	public String updateMyself(SysUserEntity sysUser, Model model, HttpSession session, HttpServletRequest request) {
		String username = this.getLoginUser();
		String ip = this.getIP(request);
		try {
			sysUserService.updateSysUser(sysUser);
			sysUser.setRole(null);
			sysLogService.save(username, ip, "修改个人资料");
			sysLogService.save(username, ip, "退出登录");
			//清空sesion重新登录
		//	session.invalidate();
			//会清空认证信息, 会清除session
			SecurityUtils.getSubject().logout();
			//重定向到登录界面
			return "redirect:/toLogin";
		} catch (Exception e) {
			e.printStackTrace();
			sysLogService.save(username, ip, "修改个人资料失败");
			return "forward:/toEditMyself";
		} 
	}
	/*
	 * 修改其他系统用户
	 */
	@RequestMapping("/toEditSysUser")
	@RequiresPermissions("sysUser:update")
	public String toEditSysUser(int userId, Model model) throws Exception {
		SysUserEntity user = sysUserService.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("action", "updateSysUser");
		//查询所有系统角色
		List<SysRoleEntity> roleList = sysRoleService.getListByType(Constant.SYSTEM_ROLE);
		model.addAttribute("roleList", roleList);
		return "system/user/user_input";
	}
	
	@RequestMapping("/updateSysUser")
	@RequiresPermissions("sysUser:update")
	public String updateSysUse(SysUserEntity userEntity, HttpServletRequest request,HttpSession session, Model model) throws Exception {
		sysUserService.updateSysUser(userEntity);
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改"+userEntity.getUsername()+"用户信息");
		return "save_result";
	}
	
	
	@RequestMapping("toAddSysUser")
	@RequiresPermissions("sysUser:insert")
	public String toAddSysUser(Model model) throws Exception{
		List<SysRoleEntity> roleList = sysRoleService.getListByType(Constant.SYSTEM_ROLE);
		model.addAttribute("roleList", roleList);
		model.addAttribute("action", "addSysUser");
		return "system/user/user_input";
	}
	
	@RequestMapping("/addSysUser")
	@RequiresPermissions("sysUser:insert")
	public String addSysUser(SysUserEntity userEntity, HttpServletRequest request,HttpSession session, Model model) throws Exception {
		sysUserService.save(userEntity);
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "添加系统用户");
		return "save_result";
	}
	
	/**
	 * username校验
	 * @param username
	 * @return
	 */
	@RequestMapping("/hasUsername")
	@ResponseBody
	public ResultModel hasUsername(String username) {
		boolean exist;
		try {
			exist = sysUserService.hasExistUsername(username);
			if(exist) {
				return ResultModel.build(500, "姓名已经存在");
			} else {
				return ResultModel.build(200, "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultModel.build(500, "服务异常");
		}
	}
	
	/**
	 * 邮箱重名验证
	 * @param email
	 * @return
	 */
	@RequestMapping("/hasEmail")
	@ResponseBody
	public ResultModel hasReEmail(String email) {
		boolean exist;
		try {
			exist = sysUserService.hasExistEmail(email);
			if(exist) {
				return ResultModel.build(500, "邮箱已存在");
			} else {
				return ResultModel.build(200, "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultModel.build(500, e.getMessage());
		}
	}
	
	/**
	 * 排序重复验证
	 * @param sort
	 * @return
	 */
	@RequestMapping("/hasSort")
	@ResponseBody
	public ResultModel hasSort(int sort) {
		boolean exist;
		try {
			exist = sysUserService.hasExistSort(sort);
			if(exist) {
				return ResultModel.build(500, "序号已经存在");
			} else {
				return ResultModel.build(200, "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultModel.build(500, "服务异常");
		}
	}
	
	@RequestMapping("/listUser")
	@RequiresPermissions("sysUser:query")
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
				String rows = Constant.getConfig("page.size");
				params.put("rows", Integer.parseInt(rows));
			} else {
				String rows =  (String) params.get("rows");
				params.put("rows", Integer.parseInt(rows));
			}
			Page<SysUserEntity> page = sysUserService.getSysUserPage(params);
			
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("params", params);
		return "system/user/user_list";
	}
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	@RequiresPermissions("sysUser:delete")
	public ResultModel deleteUser(int userId, HttpServletRequest request, HttpSession session) {
		try {
			sysUserService.deleteUserById(userId);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "删除系统用户");
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return ResultModel.build(500, e.getMessage());
		}
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public ResultModel regist(SysUserEntity userEntity, HttpServletRequest request, HttpSession session) {
		String inputCode = request.getParameter("checkCode");
		String checkCode = (String) session.getAttribute(Constant.SESSION_REGIST_CHECK_CODE);
		if(StringUtils.isEmpty(inputCode) || !inputCode.equalsIgnoreCase(checkCode)) {
			return ResultModel.build(400, "验证码错误");
		}
		try {
			sysUserService.saveRegistUser(userEntity);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return ResultModel.build(500, e.getMessage());
		}
		return ResultModel.build(200, "success");
	}

	@RequestMapping("/listVip")
	@RequiresPermissions("user:vipQuery")
	public String vipList(HttpServletRequest request, Model model) throws Exception{
		//获得所有的会员角色
		List<SysRoleEntity> roleList = sysRoleService.getAllVipRole();
		model.addAttribute("roleList", roleList);
		ParameMap params = getParaMap();
		if(params.get("currentPage") == null || params.get("currentPage").equals("")) {
			params.put("currentPage", 1);
		}
		//如果rows没有指定的话, 自己读取制定的文件
		if(params.get("rows") == null || params.get("rows").equals("")) {
			String rows = Constant.getConfig("page.size");
			params.put("rows", Integer.parseInt(rows));
		} else {
			String rows =  (String) params.get("rows");
			params.put("rows", Integer.parseInt(rows));
		}
		Page<SysUserEntity> page = sysUserService.getVipUserPage(params);
		model.addAttribute("page", page);
		return "system/appuser/list";
	}
	
	
	@RequestMapping("/toEditVipUser")
	@RequiresPermissions("user:vipUpdate")
	public String toEditVipUser(int userId, Model model) throws Exception{
		SysUserEntity user = sysUserService.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("action", "updateSysUser");
		//所有会员角色
		List<SysRoleEntity> roleList = sysRoleService.getListByType(Constant.VIP_ROLE);
		model.addAttribute("roleList", roleList);
		return "system/appuser/input";
	}
	
	@RequestMapping("/onlineUser")
	@ResponseBody
	public ResultModel onLineUser() {
		Collection<Session> activeSessions = sessioDAO.getActiveSessions();
		if(activeSessions != null && ! activeSessions.isEmpty()) {
			List<SysUserEntity> users = new ArrayList<>();
			for (Session session : activeSessions) {
			//	SysUserEntity user = (SysUserEntity) session.getAttribute(Constant.SESSION_USER);
				SimplePrincipalCollection peincipal = (SimplePrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
				SysUserEntity user = (SysUserEntity) peincipal.getPrimaryPrincipal();
				users.add(user);
			}
			return ResultModel.build(200, "success", JsonUtils.encode(users));
		}
		return ResultModel.build(200, "success");
	}
	
	
	@RequestMapping("/online")
	@RequiresPermissions("online:query")
	public String getLoginUser(Model model) {
		return "system/online/list";
	}
}
