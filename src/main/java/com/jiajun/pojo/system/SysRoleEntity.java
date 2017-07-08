package com.jiajun.pojo.system;

import com.jiajun.util.JsonUtils;

public class SysRoleEntity {
    private Integer id;

    private String roleName;

    private Integer parentId;

    private Integer sort;

    private Boolean roleType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Boolean getRoleType() {
        return roleType;
    }

    public void setRoleType(Boolean roleType) {
        this.roleType = roleType;
    }

	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
    
}