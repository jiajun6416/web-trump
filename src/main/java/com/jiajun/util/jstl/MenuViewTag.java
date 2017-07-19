package com.jiajun.util.jstl;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.jiajun.pojo.system.SysMenuEntity;

/**
 * @desc 自定义jstl标签, 实现菜单的循环显示
 * @author JIAJUN
 * @date 2017年7月19日下午10:56:51
 */
public class MenuViewTag extends SimpleTagSupport {

	private static final long serialVersionUID = 4584340336116861149L;
	
	private List<SysMenuEntity> menuList;
	
	@Override
	public void doTag() throws JspException, IOException {
		JspWriter write = this.getJspContext().getOut();
		write.write("");
	}

	public List<SysMenuEntity> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenuEntity> menuList) {
		this.menuList = menuList;
	}
	
}
