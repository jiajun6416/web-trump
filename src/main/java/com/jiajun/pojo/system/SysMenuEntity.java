package com.jiajun.pojo.system;

import java.util.Date;
import java.util.List;

public class SysMenuEntity {
    private Integer id;

    private String menuName;

    private Integer parentId;

    private Boolean isParent;

    private String accessUrl;

    private String privilegeCode;

    private Integer sort;

    private String icon;

    private Boolean isShow;

    private Date gmtCreate;

    private Date gmtModifyed;
    /*childre menuList*/
    private List<SysMenuEntity> menuList;
    
    public List<SysMenuEntity> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenuEntity> menuList) {
		this.menuList = menuList;
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

    public String getPrivilegeCode() {
        return privilegeCode;
    }

    public void setPrivilegeCode(String privilegeCode) {
        this.privilegeCode = privilegeCode;
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
}