package com.jiajun.controller.system;

import java.util.ArrayList;
import java.util.List;

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
import com.jiajun.util.Tools;

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
			rows = Tools.getProperties("/config/config.properties", "page.size");
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
