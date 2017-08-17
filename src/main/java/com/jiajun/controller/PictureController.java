package com.jiajun.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
	
	@Autowired
	private PictureService pictureService;
	
	@RequestMapping("list")
	@RequiresPermissions("picture:query")
	public String list(HttpServletRequest request, Model model) throws Exception {
		ParameMap params = this.getParaMap(request);
		Page<PictureEntity> page = pictureService.getPage(params );
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
			String originalName = file.getOriginalFilename();
			String suffix = originalName.substring(originalName.lastIndexOf(".")+1);
			String basePath = request.getServletContext().getRealPath("/");
			String filePath = Constant.PICTUREFILEPATH+FileUtils.createFileName()+"."+suffix;
			File f = FileUtils.createDestFile(basePath+"/"+filePath);
			file.transferTo(f);
			pictureService.savePicture(filePath);
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			logger.error("upload picture has error", e);
			return ResultModel.build(500, e.getMessage());
		}
	}
	
	@RequestMapping("delete")
	@RequiresPermissions("picture:delete")
	@ResponseBody
	public ResultModel delete(@RequestParam(required=true)int pictureId, HttpServletRequest request ){
		try {
			PictureEntity picture = pictureService.getById(pictureId);
			if(picture!=null && StringUtils.isNotEmpty(picture.getPath())) {
				pictureService.delete(pictureId);
				String filePath = request.getServletContext().getRealPath("/")+"/"+picture.getPath();
				File f = new File(filePath);
				if(f.exists()) {
					f.delete();
				}
				logger.info("delete picture {} success", filePath);
				return ResultModel.build(200, "success");
			} else {
				logger.info("the picture {} is null ", pictureId);
				return ResultModel.build(403, "error");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return ResultModel.build(403, "error");
		}
	}
	
			
}
