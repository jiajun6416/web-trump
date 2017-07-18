package com.jiajun.pojo.system;

import java.io.Serializable;

import com.jiajun.util.JsonUtils;

public class SysMenuPremission implements Serializable{

	private static final long serialVersionUID = -3998237534443416651L;

	private Integer id;

    private Integer menuId;

    private Short premissionType; //1 query 2 insert 3 update 4 delete 5 other

    private String premissionCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Short getPremissionType() {
        return premissionType;
    }

    public void setPremissionType(Short premissionType) {
        this.premissionType = premissionType;
    }

    public String getPremissionCode() {
        return premissionCode;
    }

    public void setPremissionCode(String premissionCode) {
        this.premissionCode = premissionCode;
    }
	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
    
}