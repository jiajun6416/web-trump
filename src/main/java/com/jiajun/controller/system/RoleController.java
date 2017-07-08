package com.jiajun.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jiajun.pojo.system.SysRoleEntity;
import com.jiajun.service.SysRoleService;
import com.jiajun.util.Constant;

/**
 * @描述：系统的角色controller
 * @author jiajun
 * @date 2017年7月7日下午10:54:06
 */
@Controller
public class RoleController {

	@Autowired
	private SysRoleService sysRoleService;
	
	@RequestMapping("/toRole")
	public String roRole(Model model, @RequestParam(required=true, defaultValue=Constant.SYSTEM_ROLE+"") int roleType) throws Exception {
		List<SysRoleEntity> roleTypes = sysRoleService.getAllRoleType();
		model.addAttribute("roleTypes", roleTypes);
		List<SysRoleEntity> roleList = sysRoleService.getListByType(roleType);
		model.addAttribute("roleList", roleList);
		return "system/role/role_list";
	}
	
}
