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
import com.jiajun.exception.SysCustomException;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysRoleService;
import com.jiajun.util.Constant;
import com.jiajun.util.JsonUtils;

/**
 * @描述：系统的角色controller
 * @author jiajun
 * @date 2017年7月7日下午10:54:06
 */
@Controller
@RequestMapping("role")
public class RoleController extends BaseController{

	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysLogService sysLogService;
	

	@RequestMapping("/list")
	public String roRole(Model model, HttpServletRequest request) throws Exception {
		int roleType = 0;
		String roleTypeStr = request.getParameter("roleType");
		if(StringUtils.isNotEmpty(roleTypeStr)) {
			roleType = Integer.parseInt(roleTypeStr);
		} else {
			roleType = Constant.SYSTEM_ROLE;
		}
		model.addAttribute("roleType", roleType);
		List<SysRoleEntity> roleTypes = sysRoleService.getAllTypeRole();
		model.addAttribute("roleTypes", roleTypes);
		List<SysRoleEntity> roleList = sysRoleService.getListByType(roleType);
		model.addAttribute("roleList", roleList);
		return "system/role/role_list";
	}
	
	/**
	 * 跳转修改角色组的ztree
	 * @param roleType
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/maxMenuList") 
	public String maxMenuOftype(int roleType, Model model) throws Exception {
		List<ZtreeNode> treeNodes = sysRoleService.getCheckTreeNodeByType(roleType);
		model.addAttribute("treeNodes", JsonUtils.encode(treeNodes));
		model.addAttribute("roleType", roleType);
		model.addAttribute("action", "maxMenu");
		return "system/role/menu";
	}
	
	/**
	 * 保存修改角色组的菜单
	 * @param roleType
	 * @param menuIds
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveMaxTypeMenu")
	@ResponseBody
	public ResultModel saveMaxTypeMenu(int roleType, String menuIds, HttpServletRequest request, HttpSession session) throws Exception{
		try {
			sysRoleService.saveRoleTypeMneu(roleType, menuIds);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改角色类型最大菜单权限");
		} catch (SysCustomException e) {
			return ResultModel.build(500, "参数错误");
		}
		return ResultModel.build(200, "success");
	}
	
	/**
	 * 跳转角色菜单ztree
	 * @param roleId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/menuList")
	public String menuList(int roleId, Model model) throws Exception {
		List<ZtreeNode> treeNodes = sysRoleService.getMenuNodesById(roleId);
		model.addAttribute("roleId", roleId);
		model.addAttribute("treeNodes", JsonUtils.encode(treeNodes));
		model.addAttribute("action", "roleMenu");
		return "system/role/menu";
	}
	
	/**
	 * 保存角色对应的菜单
	 * @param roleId
	 * @param rquest
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/saveRoleMenus")
	@ResponseBody
	public ResultModel saveRoleMenus(int roleId, String menuIds, HttpServletRequest request, HttpSession session) throws Exception {
		try {
			sysRoleService.saveRoleMenus(roleId, menuIds);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "保存角色对应的菜单");
		} catch (SysCustomException e) {
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "保存角色对应的菜单出错:"+e.getMessage());
			return ResultModel.build(500, e.getMessage());
		}
		return ResultModel.build(200, "success");
	}
	
	
	@RequestMapping("/toAdd")
	public String toAdd(int roleType, Model model) {
		model.addAttribute("roleType", roleType);
		model.addAttribute("action", "save");
		return "systrem/role/role_edit";
	}
	
	@RequestMapping("/save")
	public String save(SysRoleEntity roleEntity, HttpSession session, HttpServletRequest request) throws Exception {
		sysRoleService.saveRole(roleEntity);
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "添加角色:" +roleEntity.getRoleName());
		return "redirect:/role/list?roleType="+roleEntity.getRoleType();
	}
}
