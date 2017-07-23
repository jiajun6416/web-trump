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
	    JspWriter out = getJspContext().getOut();  
		StringBuilder sb = new StringBuilder();
		if(menuList!=null && menuList.size()>0) {
			String output = getText(sb, menuList); 
			out.print(output);
		}
	}
	
	private String getText(StringBuilder builder, List<SysMenuEntity> menuList) {
		for (SysMenuEntity menu : menuList) {
			List<SysMenuEntity> subList = menu.getMenuList();
			builder.append("<li class=\"\"  id=\"m");
			builder.append(menu.getId());
			builder.append("\">");
			if(subList!=null && subList.size()>0) {
				builder.append("<a style=\"cursor:pointer;\" class=\"dropdown-toggle\">");
			} else {
				builder.append("<a style=\"cursor:pointer;\" target=\"mainFrame\" onclick=\"siMenu('m"+menu.getId()+"','m"+menu.getParentId()+"','"+menu.getMenuName()+"','"+menu.getAccessUrl()+"')\">");
			}
			builder.append("<i class=\"");
			builder.append(menu.getIcon());
			builder.append("\"></i>");
			if(menu.getParentId() == 0) {
				builder.append("<span class=\"menu-text\">");
				builder.append(menu.getMenuName());
				builder.append("</span>");
			} else {
				builder.append(menu.getMenuName());
			}
			if(subList!=null && subList.size()>0) {
				builder.append("<b class=\"arrow fa fa-angle-down\"></b>");
			}
			builder.append("</a>");
			builder.append("<b class=\"arrow\"></b>");
			if(subList!=null && subList.size()>0) {
				builder.append("<ul class=\"submenu\">");
				getText(builder, subList);
				builder.append("</ul>");
			}
			builder.append("</li>");
		}
		return builder.toString();
	}

	public List<SysMenuEntity> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenuEntity> menuList) {
		this.menuList = menuList;
	}
	
}
