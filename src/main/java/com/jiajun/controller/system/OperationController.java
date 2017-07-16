package com.jiajun.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SysOpeartionEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.service.SysOperationService;

@RequestMapping("/operation")
@Controller
public class OperationController extends BaseController{
	
	@Autowired
	private SysOperationService operationService;
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		List<SysOpeartionEntity> list = operationService.getAll();
		model.addAttribute("list", list);
		return "system/operation/list";
	}
	
	@RequestMapping("/toEdit")
	public String toEdit(int operaId, Model model) throws Exception {
		SysOpeartionEntity operation = operationService.getById(operaId);
		model.addAttribute("action", "update");
		model.addAttribute("operation", operation);
		return "system/operation/input";
	}
	
	@RequestMapping("/toSave")
	public String to(Model model) throws Exception {
		model.addAttribute("action", "save");
		return "system/operation/input";
	}
	
	@RequestMapping("/update")
	public String update(SysOpeartionEntity operation, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		operationService.update(operation);
		sysLogService.save(this.getLoginUser(session), this.getIP(request),  "修改按钮操作!");
		model.addAttribute("msg", "success");
		return "save_result";
	}
	
	@RequestMapping("save")
	public String save(SysOpeartionEntity operation, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		operationService.insert(operation);
		sysLogService.save(this.getLoginUser(session), this.getIP(request),  "添加按钮操作!");
		model.addAttribute("msg", "success");
		return "save_result";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public ResultModel deleteById(int operaId) {
		try {
			operationService.delete(operaId);
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return ResultModel.build(500, "error");
		}
	}
	@RequestMapping("/deleteSelect")
	@ResponseBody
	public ResultModel deleteSelect(String operaIds) {
		try {
			operationService.batchDelete(operaIds);
			return ResultModel.build(200, "success");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return ResultModel.build(500, "error");
		}
	}

} 
