package com.jiajun.pojo.information;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jiajun.util.Constant;

public class PictureEntity {
	
	private static final Map<Short, String> TYPE_VIEW_MAP = new HashMap<>();
	static {
		TYPE_VIEW_MAP.put(Constant.PICTURE_TYPE_MANUAL, "上传");
		 TYPE_VIEW_MAP.put(Constant.PICTURE_TYPE_AUTO, "爬取");
	}
	
    private Integer id;

    private String path;

    private Short type;

    private String pictureDesc;
    
    private Date createTime;

    private Date updateTime;

    private Date deleteTime;

    private String typeView;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Short getType() {
        return type;
    }

    public void setType(Short type) {
        this.type = type;
        this.typeView = TYPE_VIEW_MAP.get(type);
    }
	public String getTypeView() {
		return typeView;
	}

	public String getPictureDesc() {
		return pictureDesc;
	}

	public void setPictureDesc(String pictureDesc) {
		this.pictureDesc = pictureDesc;
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

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }
}