package com.jiajun.pojo.system;

import java.io.Serializable;
import java.util.Date;

import com.jiajun.util.JsonUtils;

/**
 * @desc 
 * @author JIAJUN
 * @date da2017年7月18日
 */
public class SysLogEntity implements Serializable{

	private static final long serialVersionUID = 2708839047848267671L;

	private Integer id;

    private String opearUser;

    private String ip;

    private Date opearTime;

    private String event;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpearUser() {
        return opearUser;
    }

    public void setOpearUser(String opearUser) {
        this.opearUser = opearUser;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getOpearTime() {
        return opearTime;
    }

    public void setOpearTime(Date opearTime) {
        this.opearTime = opearTime;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
    
}