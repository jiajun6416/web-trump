package com.jiajun.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysUserEntity;
import com.jiajun.pojo.system.SysUserPhotoEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysUserService;
import com.jiajun.util.Constant;
import com.jiajun.util.FileUtils;

/**
 * @desc 文件上传controller
 * @author JIAJUN
 * @date 2017年7月26日下午10:46:49
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {

	@Autowired
	private SysUserService userService;
	@Autowired
	private SysLogService logService;
	
	@RequestMapping("/photoEditor/upload")
	@ResponseBody
	public ResultModel userPhotoUpload(HttpServletRequest request, HttpSession session) {
		SysUserEntity userEntity = getLoginUser();
		try {
			/* 获得项目的根路径的磁盘位置 */
			String basePath = request.getServletContext().getRealPath("/");
			
			SysUserPhotoEntity userPhoto = userService.getUserPhoto(userEntity.getId());
			List<String> prePhoto = new ArrayList<>();
			if (userPhoto == null) {
				userPhoto = new SysUserPhotoEntity();
				userPhoto.setUserId(userEntity.getId());
			} else {
				if(StringUtils.isNotEmpty(userPhoto.getPhotoSource())) {
					prePhoto.add(basePath+"/"+userPhoto.getPhotoSource());
				}
				if(StringUtils.isNotEmpty(userPhoto.getPhoto1())) {
					prePhoto.add(basePath+"/"+userPhoto.getPhoto1());
				}
				if(StringUtils.isNotEmpty(userPhoto.getPhoto2())) {
					prePhoto.add(basePath+"/"+userPhoto.getPhoto2());
				}
				if(StringUtils.isNotEmpty(userPhoto.getPhoto3())) {
					prePhoto.add(basePath+"/"+userPhoto.getPhoto3());
				}
			}
			MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
			Iterator<String> fileNames = req.getFileNames();
			String fileName = "";
			MultipartFile multipartFile = null;
			File file = null;
			String result = "";
			while (fileNames.hasNext()) {
				fileName = fileNames.next();
				switch (fileName) {
				case "__source":
					multipartFile = req.getFile(fileName);
					// String originalName = multipartFile.getOriginalFilename();
					// String extendName = originalName.substring(originalName.lastIndexOf("."));
					String newName = Constant.FILEPATHUSERPHOTO + FileUtils.getFileName() + "_source" + ".jpg";
					file = FileUtils.getDestFile(basePath +"/" + newName);
					multipartFile.transferTo(file);
					userPhoto.setPhotoSource(newName);
					break;
				case "__avatar1":
					multipartFile = req.getFile(fileName);
					// String originalName = multipartFile.getOriginalFilename();
					// String extendName = originalName.substring(originalName.lastIndexOf("."));
					newName = Constant.FILEPATHUSERPHOTO + FileUtils.getFileName() + "__avatar1" + ".jpg";
					file = FileUtils.getDestFile(basePath +"/"+ newName);
					multipartFile.transferTo(file);
					result = newName;
					userPhoto.setPhoto1(newName);
					break;
				case "__avatar2":
					multipartFile = req.getFile(fileName);
					// String originalName = multipartFile.getOriginalFilename();
					// String extendName = originalName.substring(originalName.lastIndexOf("."));
					newName = Constant.FILEPATHUSERPHOTO + FileUtils.getFileName() + "__avatar2" + ".jpg";
					file = FileUtils.getDestFile(basePath+"/" + newName);
					multipartFile.transferTo(file);
					userPhoto.setPhoto2(newName);
					break;
				case "__avatar3":
					multipartFile = req.getFile(fileName);
					// String originalName = multipartFile.getOriginalFilename();
					// String extendName = originalName.substring(originalName.lastIndexOf("."));
					newName = Constant.FILEPATHUSERPHOTO + FileUtils.getFileName() + "__avatar3" + ".jpg";
					file = FileUtils.getDestFile(basePath +"/"+ newName);
					multipartFile.transferTo(file);
					userPhoto.setPhoto3(newName);
					break;
				}
			}
			if (userPhoto.getId() == null) {
				userService.saveUserPhoto(userPhoto);
			} else {
				userService.updateUserPhoto(userPhoto, prePhoto);
			}
			session.setAttribute(Constant.SESSION_USER_PHOTO, userPhoto);
			logService.save(userEntity.getUsername(), this.getIP(request), "修改个头头像");
			return ResultModel.build(200, "success", result);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return ResultModel.build(500, "error");
		}
	}
}
