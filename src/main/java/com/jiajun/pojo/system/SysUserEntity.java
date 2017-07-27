package com.jiajun.pojo.system;

import java.io.Serializable;
import java.util.Date;

import com.jiajun.util.JsonUtils;

public class SysUserEntity  implements Serializable{
	
	private static final long serialVersionUID = -7522668131578278017L;

	private Integer id;

    private String username;

    private String password;

    private String name;

    private Date loginTime;

    private String lastIp;

    private String skin;

    private Integer sort;

    private Integer roleId;

    private String phone;

    private String email;

    private Short status;

    private String remark;

    private Date gmtCreate;

    private Date gmtModified;
    
    private SysRoleEntity role;
    
    private SysUserPhotoEntity userPhoto;
    
	public SysRoleEntity getRole() {
		return role;
	}

	public SysUserPhotoEntity getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(SysUserPhotoEntity userPhoto) {
		this.userPhoto = userPhoto;
	}

	public void setRole(SysRoleEntity role) {
		this.role = role;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

	public String getSkin() {
        return skin;
    }

    public void setSkin(String skin) {
        this.skin = skin;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }
    
	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
}