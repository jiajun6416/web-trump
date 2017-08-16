package com.jiajun.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.information.PictureEntity;
import com.jiajun.service.PictureService;

/**
 *  
 * @Date 2017/08/16 15时
 */
@RequestMapping("picture")
@Controller
public class PictureController extends BaseController{
	
	@Autowired
	private PictureService prictureService;
	
	@RequestMapping("list")
	@RequiresPermissions("picture:query")
	public String list(HttpServletRequest request, Model model) throws Exception {
		ParameMap params = this.getParaMap(request);
		Page<PictureEntity> page = prictureService.getPage(params );
		model.addAttribute("page", page);
		model.addAttribute("params", params);
		return "information/pictures/list";
	}
	
	@RequestMapping("toAdd")
	@RequiresPermissions("picture:insert")
	public String toAddPicture() {
		return "information/pictures/add";
	}
}
