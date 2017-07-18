package com.jiajun.pojo.system;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jiajun.util.JsonUtils;
import com.jiajun.util.Tools;

public class SysRoleEntity implements Serializable{

	private static final long serialVersionUID = -8337217684212227184L;

	private Integer id;

    private String roleName;

    private Integer parentId;

    private Integer sort;

    private Integer roleType;

    private String menuIds;

    private String operationIds;
    
    private List<Integer> operaIds;
    
    public List<Integer> getOperaIds() {
		return operaIds;
	}

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

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public String getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(String menuIds) {
        this.menuIds = menuIds;
    }

    public String getOperationIds() {
        return operationIds;
    }

    public void setOperationIds(String operationIds) {
        this.operationIds = operationIds;
        if(StringUtils.isNotEmpty(operationIds) && Tools.regular(operationIds)) {
        	String[] idsStr = operationIds.split(",");
        	operaIds = new ArrayList<>(idsStr.length);
        	for (String id : idsStr) {
        		operaIds.add(Integer.valueOf(id));
			}
        }
    }
    
	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
    
}