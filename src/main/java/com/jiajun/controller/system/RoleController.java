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
		return "system/role/role_edit";
	}
	
	@RequestMapping("/save")
	public String save(SysRoleEntity roleEntity, Model model, HttpSession session, HttpServletRequest request) throws Exception  {
		sysRoleService.saveRole(roleEntity);
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "添加角色:" +roleEntity.getRoleName());
		model.addAttribute("msg", "success");
		return "save_result";
	}
	
	@RequestMapping("/toEdit")
	public String toEdit(int roleId, Model model) throws Exception {
		SysRoleEntity role = sysRoleService.getRoleById(roleId);
		model.addAttribute("role", role);
		model.addAttribute("action", "update");
		return "system/role/role_edit";
	}
	
	@RequestMapping("/update")
	public String  update(SysRoleEntity roleEntity, Model model, HttpSession session, HttpServletRequest request) throws Exception {
			sysRoleService.update(roleEntity);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改角色信息:" +roleEntity.getRoleName());
			model.addAttribute("msg", "success");
			return "save_result";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public ResultModel delete(int roleId, Model model, HttpSession session, HttpServletRequest request)  {
		try {
			sysRoleService.delete(roleId);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "删除角色, id是"+roleId);
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			if(e instanceof SysCustomException) {
				return ResultModel.build(300, "当前角色有用户, 不能直接删除");
			} else {
				return ResultModel.build(500, "系统忙, 请稍后再试");
			}
		}
	}
	
	@RequestMapping("/toEditRoleType")
	public String toEditRoleType(int roleType, Model model) throws Exception {
		SysRoleEntity role = sysRoleService.getRoleByRoleType(roleType);
		model.addAttribute("role", role);
		model.addAttribute("action", "updateType");
		return "system/role/role_edit";
	}
	
	@RequestMapping("/updateType")
	public String  updateType(SysRoleEntity roleEntity, Model model, HttpSession session, HttpServletRequest request) throws Exception {
			sysRoleService.update(roleEntity);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改角色类型信息:" +roleEntity.getRoleName());
			model.addAttribute("msg", "success");
			return "save_result";
	}
	
	@RequestMapping("/toAddRoleType")
	public String toAddRoleType(Model model) throws Exception {
		model.addAttribute("action", "saveRoleType");
		return "system/role/role_edit";
	}
	
	@RequestMapping("/saveRoleType")
	public String saveRoleType(SysRoleEntity roleEntity, Model model, HttpSession session, HttpServletRequest request) throws Exception  {
		sysRoleService.saveRoleType(roleEntity);
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "添加角色类型:" + roleEntity.getRoleName());
		model.addAttribute("msg", "success");
		return "save_result";
	}
	
	@RequestMapping("/deleteType")
	@ResponseBody
	public ResultModel deleteType(int roleType, Model model, HttpSession session, HttpServletRequest request) throws Exception  {
		if(roleType == 1 || roleType == 2) {
			return ResultModel.build(500, "系统角色组, 不允许删除!");
		}
		try {
			sysRoleService.deleteType(roleType);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "删除角色组, 类型是"+roleType);
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			if(e instanceof SysCustomException) {
				return ResultModel.build(300, "当前角色组下有角色, 不能直接删除");
			} else {
				return ResultModel.build(500, "系统忙, 请稍后再试");
			}
		}
	}
	
	/*=====================================================增删查改授权============================================*/
	@RequestMapping("/permission")
	public String permission(int roleId, int type, Model model) throws Exception {
		
		model.addAttribute("action", "premission");
		List<ZtreeNode> treeNodes = sysRoleService.getPremissionNodes(roleId, type);
		model.addAttribute("treeNodes", JsonUtils.encode(treeNodes));
		return "system/role/menu";
	}
}
