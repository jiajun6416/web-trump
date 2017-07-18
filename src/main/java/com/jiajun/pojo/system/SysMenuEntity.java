package com.jiajun.pojo.system;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.xmlbeans.impl.store.PathDelegate.SelectPathInterface;

import com.jiajun.util.JsonUtils;

public class SysMenuEntity implements Serializable{

	private static final long serialVersionUID = 9120906392629723215L;

	private Integer id;

    private String menuName;

    private Integer parentId;

    private Boolean isParent;

    private String accessUrl;

    private Integer sort;

    private String icon;

    private Boolean isShow;

    private Date gmtCreate;

    private Date gmtModifyed;

    private List<SysMenuEntity> menuList = new ArrayList<>();
    
    private List<SysMenuPremission> premissionList;
    
    public List<SysMenuEntity> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenuEntity> menuList) {
		this.menuList = menuList;
	}

	public List<SysMenuPremission> getPremissionList() {
		return premissionList;
	}

	public void setPremissionList(List<SysMenuPremission> premissionList) {
		this.premissionList = premissionList;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(Boolean isParent) {
        this.isParent = isParent;
    }

    public String getAccessUrl() {
        return accessUrl;
    }

    public void setAccessUrl(String accessUrl) {
        this.accessUrl = accessUrl;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean isShow) {
        this.isShow = isShow;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModifyed() {
        return gmtModifyed;
    }

    public void setGmtModifyed(Date gmtModifyed) {
        this.gmtModifyed = gmtModifyed;
    }
    
	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
}