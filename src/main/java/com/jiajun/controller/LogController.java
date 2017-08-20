package com.jiajun.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysLogEntity;
import com.jiajun.service.SysLogService;
import com.jiajun.util.Constant;
import com.jiajun.util.PoiExcelExport;

@Controller
@RequestMapping("/log")
public class LogController  extends BaseController {
	
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/list")
	@RequiresPermissions("log:query")
	public String list(Model model) throws Exception {
		ParameMap params = getParaMap();
		String currentPage = (String) params.get("currentPage");
		if(currentPage == null ) {
			currentPage = "1";
		}
		params.put("currentPage", Integer.valueOf(currentPage));

		String rows = (String) params.get("rows");
		if(rows == null) {
			rows = Constant.getConfig("page.size");
		}
		params.put("rows", Integer.valueOf(rows));
		
		model.addAttribute("params",params);
		Page<SysLogEntity> page = sysLogService.listLog(params);
		model.addAttribute("page", page);
		return "system/log/list";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	@RequiresPermissions("log:delete")
	public String delete(int logId) {
		String result = null;
		try {
			sysLogService.delete(logId);
			result = "success";
		} catch (Exception e) {
			result = "error";
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping("excel")
	@RequiresPermissions("opera:outExcel")
	public void toExcel(HttpServletRequest requet, HttpServletResponse response) {
		ParameMap params = getParaMap();
		String currentPage = (String) params.get("currentPage");
		if(currentPage == null ) {
			currentPage = "1";
		}
		params.put("currentPage", Integer.valueOf(currentPage));
		String rows = (String) params.get("rows");
		if(rows == null) {
			rows = Constant.getConfig("page.size");
		}
		params.put("rows", Integer.valueOf(rows));
		
		try {
			Page<SysLogEntity> page = sysLogService.listLog(params);
			String[] titleCols = {"用户名","IP","事件","操作时间"};
			String[] fields = {"opearUser","ip","event","opearTime"};
			PoiExcelExport excelExport = new PoiExcelExport(titleCols, fields, page.getList())
					.withNumber("编号")
					.withSubject("系统日志记录");
			excelExport.exportExcel(response, "系统日志");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	@RequiresPermissions("log:delete")
	public String batchDelete(String logIds) {
		String result = null;
		try {
			if(logIds != null ) {
				String[] idsStr = logIds.split(",");
				List<Integer> ids = new ArrayList<>();
				for (String id : idsStr) {
					ids.add(Integer.valueOf(id));
				}
				sysLogService.batchDelete(ids);
				result = "success";
			}
		} catch (Exception e) {
			result = "error";
			e.printStackTrace();
		}
		return result;
	}
	
	
}
