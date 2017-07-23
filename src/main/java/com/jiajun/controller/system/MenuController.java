package com.jiajun.controller.system;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.ZtreeNode;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.pojo.system.SysMenuPremission;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysMenuService;
import com.jiajun.util.JsonUtils;

@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController{
	
	@Autowired
	private SysLogService sysLogService;
	@Autowired
	private SysMenuService sysMenuService;
	
	@RequestMapping("/listAllMenu")
	@RequiresPermissions("menu:query")
	public String zTreeList(Model model) throws Exception {
		ParameMap params = getParaMap();
		List<ZtreeNode> ztreeList = sysMenuService.selectAllMenuZtreeNode();
		int pId = 0;
		if(params != null ) {
			String pidStr = (String) params.get("pId");
			if(StringUtils.isNoneEmpty(pidStr)) {
				pId = Integer.parseInt(pidStr);
			}
		} 
		model.addAttribute("pId", pId);
		String zTreeNodes = JsonUtils.encode(ztreeList);
		model.addAttribute("zTreeNodes", zTreeNodes);
		return "system/menu/menu_ztree";
	}
	
	@RequestMapping("/{pId}")
	@RequiresPermissions("menu:query")
	public String menuByPid(@PathVariable("pId") int pId, Model model) throws Exception {
		List<SysMenuEntity> menuList = sysMenuService.getMenuByParentId(pId);
		model.addAttribute("menuList", menuList);
		model.addAttribute("pId", pId);
		if(pId != 0) {
			SysMenuEntity pMenu = sysMenuService.getById(pId);
			model.addAttribute("ppId", pMenu.getParentId());
		}
		return "system/menu/menu_list";
	}
	
	@RequestMapping("/toEdit")
	@RequiresPermissions("menu:update")
	public String toEditMenu(int menuId, Model model) throws Exception {
		SysMenuEntity menu = sysMenuService.getById(menuId);
		model.addAttribute("menu", menu);
		//设置premission按照type 1. 2. 3. 4. 5排序
		List<SysMenuPremission> premissionList = menu.getPremissionList();
		List<SysMenuPremission> premissions = new ArrayList<>(5);
		for(int i=1; i<=5; i++) {
			SysMenuPremission premission = new SysMenuPremission();
			premission.setPremissionType((short)i);
			premissions.add(premission);
		}
		if(premissionList != null && premissionList.size()>0) {
			for (SysMenuPremission premission : premissionList) {
				Short type = premission.getPremissionType();
				premissions.get(type-1).setPremissionCode(premission.getPremissionCode());
			}
		}
		model.addAttribute("premissions", premissions);
		if(menu != null && menu.getParentId() != 0) {
			Integer pId = menu.getParentId();
			SysMenuEntity pMenu = sysMenuService.getById(pId);
			model.addAttribute("pId", pId);
			model.addAttribute("pName", pMenu.getMenuName());
		} else {
			model.addAttribute("pId", 0);
		}
		model.addAttribute("action", "update");
		return "system/menu/menu_input";
	}
	
	@RequestMapping("toAdd")
	@RequiresPermissions("menu:insert")
	public String toAdd(int pId, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		if(pId != 0) {
			SysMenuEntity pMenu = sysMenuService.getById(pId);
			model.addAttribute("pName", pMenu.getMenuName());
		}
		model.addAttribute("pId", pId);
		model.addAttribute("action", "save");
		return "system/menu/menu_input";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@RequiresPermissions("menu:insert")
	@ResponseBody
	public ResultModel insert(SysMenuEntity menu, HttpSession session, HttpServletRequest request)  {
		String status = request.getParameter("status");
		if(StringUtils.isEmpty(menu.getAccessUrl())) {
			menu.setAccessUrl("#");
		}
		if(status != null && status .equals("1")) {
			menu.setIsShow(true);
		} else {
			menu.setIsShow(false);
		}
		menu.setIsParent(false);
		try {
			sysMenuService.insert(menu);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "添加菜单:"+menu.getMenuName());
		} catch (Exception e) {
			e.printStackTrace();
			return ResultModel.build(500, e.getMessage());
		}
		return ResultModel.build(200, "success");
	}
	
	
	
	@RequestMapping("/update")
	@ResponseBody
	@RequiresPermissions("menu:update")
	public ResultModel update(SysMenuEntity menu,HttpSession session, HttpServletRequest request) {
		String status = request.getParameter("status");
		if(StringUtils.isEmpty(menu.getAccessUrl())) {
			menu.setAccessUrl("#");
		}
		if(status != null) {
			if(status .equals("1")) {
				menu.setIsShow(true);
			} else {
				menu.setIsShow(false);
			}
		}
		try {
			sysMenuService.update(menu);
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改菜单信息");
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultModel.build(500, e.getMessage());
		}
	}
	@RequestMapping("/toEditIcon")
	@RequiresPermissions("menu:update")
	public String toEditIcon(int menuId, Model model) {
		model.addAttribute("menuId", menuId);
		return "system/menu/menu_icon";
	}
	
	@RequestMapping("/editIcon")
	@RequiresPermissions("menu:update")
	public String editIcon(int menuId, String menuIcon, Model model, String iconColor, HttpServletRequest request ,
			HttpSession session) throws Exception {
		if(StringUtils.isNotEmpty(menuIcon) && StringUtils.isNotEmpty(iconColor)) {
			sysMenuService.updateIcon(menuId, menuIcon+" "+iconColor);
			model.addAttribute("msg", "success");
			sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改菜单图标");
		} else {
			model.addAttribute("msg", "参数错误!");
		}
		return "save_result";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	@RequiresPermissions("menu:delete")
	public ResultModel Delete(@RequestParam(required=true) String menuId, HttpSession session, HttpServletRequest request) {
		try {
			Integer id = Integer.valueOf(menuId);
			SysMenuEntity menu = sysMenuService.getById(id);
			if(! menu.getIsParent()) {
				sysMenuService.delete(id);
				sysLogService.save(this.getLoginUser(session), this.getIP(request), "删除菜单");
				return  ResultModel.build(200, "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return  ResultModel.build(500, e.getMessage());
		}
		return  ResultModel.build(500, "请先删除子菜单!");
	}
	
}
























