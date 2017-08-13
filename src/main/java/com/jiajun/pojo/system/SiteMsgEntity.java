package com.jiajun.pojo.system;

import java.util.Date;

import com.jiajun.util.JsonUtils;

public class SiteMsgEntity implements java.io.Serializable{

	private static final long serialVersionUID = -739789166591873815L;

	private Integer id;

    private String sender;

    private String receive;

    private Short status;

    private Date createTime;

    private Date updateTime;

    private String content;
    
    @Override
	public String toString() {
    	return JsonUtils.encode(this);
    }

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceive() {
        return receive;
    }

    public void setReceive(String receive) {
        this.receive = receive;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}