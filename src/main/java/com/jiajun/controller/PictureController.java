package com.jiajun.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.information.PictureEntity;
import com.jiajun.service.PictureService;
import com.jiajun.util.Constant;
import com.jiajun.util.FileUtils;

/**
 *  
 * @Date 2017/08/16 15时
 */
@RequestMapping("picture")
@Controller
public class PictureController extends BaseController{
	
	private static final File File = null;
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

	/**
	 * 使用web uploader插件每次只会上传一张图片
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("upload")
	@RequiresPermissions("picture:insert")
	@ResponseBody
	public ResultModel pictureUpload(@RequestParam("file")MultipartFile file, HttpServletRequest request) {
		try {
			String basePath = request.getServletContext().getRealPath("/");
			String filePath = Constant.PICTUREFILEPATH+FileUtils.createFileName();
			File f = FileUtils.createDestFile(basePath+filePath);
			file.transferTo(f);
			prictureService.savePicture(filePath);
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			logger.error("upload picture has error", e);
			return ResultModel.build(500, e.getMessage());
		}
	}
	
			
}
