package com.jiajun.pojo.system;

public class SysOpeartionEntity {
	
    private Integer id;

    private String opeartionName;

    private String privilegesCode;

    private String operationDesc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpeartionName() {
        return opeartionName;
    }

    public void setOpeartionName(String opeartionName) {
        this.opeartionName = opeartionName;
    }

    public String getPrivilegesCode() {
        return privilegesCode;
    }

    public void setPrivilegesCode(String privilegesCode) {
        this.privilegesCode = privilegesCode;
    }

    public String getOperationDesc() {
        return operationDesc;
    }

    public void setOperationDesc(String operationDesc) {
        this.operationDesc = operationDesc;
    }
}