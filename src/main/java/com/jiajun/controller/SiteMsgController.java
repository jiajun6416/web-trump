package com.jiajun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiajun.controller.base.BaseController;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.ResultModel;
import com.jiajun.pojo.system.SiteMsgEntity;
import com.jiajun.service.SiteMsgService;
import com.jiajun.service.SysLogService;

/**
 * 站内信息
 * Created by jiajun on 2017/08/12 12:08
 */
@Controller
@RequestMapping("siteMsg")
public class SiteMsgController extends BaseController{
	
	@Autowired
	private SiteMsgService siteMsgService;
	@Autowired
	private SysLogService logService;
	
	@RequestMapping("toSend")
	@RequiresPermissions("opera:sendSiteMsg")
	public String toSendMsg(Model model, @RequestParam(required=true) String usernames) throws Exception{
		model.addAttribute("usernames", usernames);
		return "system/msg/edit";
	}
	
	@RequestMapping("send")
	@ResponseBody
	@RequiresPermissions("opera:sendSiteMsg")
	public ResultModel sendMsg(@RequestParam(required=true)String usernames, @RequestParam(required=true)String content,
			HttpServletRequest request, HttpSession session) {
		String[] receives = usernames.split(";");
		if(receives != null && receives.length > 0 && StringUtils.isNotEmpty(content)) {
			try {
				String loginUser = this.getLoginUser(session);
				siteMsgService.save(loginUser, content, receives);
				
				logService.save(loginUser, this.getIP(request), "发送站内信");
				return ResultModel.build(200, "success");
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				return ResultModel.build(500, "error");
			}
		} else {
			return ResultModel.build(403, "invalid arguments");
		}
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("list")
	public String msgPage(HttpServletRequest request, Model model) throws Exception {
		ParameMap params = this.getParaMap();
		//默认是查询收信箱
		if(StringUtils.isEmpty((String)params.get("role"))) {
			params.put("role", "receive");
		}
		params.put("username", this.getLoginUser());
		Page<SiteMsgEntity> page = siteMsgService.getMsgPage(params);
	
		model.addAttribute("params", params);
		model.addAttribute("page", page);

		return "system/msg/list";
	}
	
	
	@RequestMapping("detail")
	public String readMsgDetail(int msgId, Model model) throws Exception{
		String username = this.getLoginUser();
		SiteMsgEntity msgEntity = siteMsgService.getMsgDetail(msgId, username);
		model.addAttribute("msg", msgEntity);
		return "system/msg/view";
	}
}
