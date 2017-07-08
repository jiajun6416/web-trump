package com.jiajun.pojo.system;

import java.util.Date;

public class SysLogEntity {
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
}