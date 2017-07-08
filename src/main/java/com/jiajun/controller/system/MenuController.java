package com.jiajun.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String toEditMenu(int menuId, Model model) throws Exception {
		SysMenuEntity menu = sysMenuService.getById(menuId);
		model.addAttribute("menu", menu);
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
	@ResponseBody
	public ResultModel save(SysMenuEntity menu, HttpSession session, HttpServletRequest request)  {
		String status = request.getParameter("status");
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
	public String update(SysMenuEntity menu,HttpSession session, HttpServletRequest request) throws Exception{
		String status = request.getParameter("status");
		if(status != null) {
			if(status .equals("1")) {
				menu.setIsShow(true);
			} else {
				menu.setIsShow(false);
			}
		}
		sysMenuService.update(menu);
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改菜单信息");
		return "redirect:/menu/"+menu.getParentId();
	}
	
	@RequestMapping("/toEditIcon")
	public String toEditIcon(int menuId, Model model) {
		model.addAttribute("menuId", menuId);
		return "system/menu/menu_icon";
	}
	
	@RequestMapping("/editIcon")
	public String editIcon(int menuId, String menuIcon, Model model, String iconColor, HttpServletRequest request ,
			HttpSession session) throws Exception {
		SysMenuEntity menu = new SysMenuEntity();
		menu.setId(menuId);
		if(StringUtils.isNotEmpty(menuIcon) && StringUtils.isNotEmpty(iconColor)) {
			menu.setIcon(menuIcon+" "+iconColor);
		}
		sysMenuService.update(menu);
		model.addAttribute("msg", "success");
		sysLogService.save(this.getLoginUser(session), this.getIP(request), "修改菜单图标");
		return "save_result";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
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
			return  ResultModel.build(200, e.getMessage());
		}
		return  ResultModel.build(500, "error");
	}
	
}
























