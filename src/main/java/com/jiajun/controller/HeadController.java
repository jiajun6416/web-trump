package com.jiajun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.ResultModel;

/**
 * @desc header function 
 * @author JIAJUN
 * @date 2017年7月24日下午10:33:59
 */

@Controller
@RequestMapping("/head")
public class HeadController extends BaseController {

	@RequestMapping("/editPhoto")
	public String toEditPhoto() {
		return "system/userphoto/userphoto_edit";
	}
	
	@RequestMapping("/savePhoto")
	@ResponseBody
	public ResultModel savePhoto() {
		
		return ResultModel.build(200, "success");
	}
}
