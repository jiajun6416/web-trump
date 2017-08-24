package com.jiajun.pojo;

import java.util.List;

/**
 * @描述：菜单ztree节点
 * @author jiajun
 * @date 2017年7月2日下午9:07:37
 */
public class ZtreeNode implements java.io.Serializable{
	private static final long serialVersionUID = -7084960522357304191L;
	/*节点id*/
	private Integer id;
	/*父节点id*/
	private Integer pId;
	/*节点名称*/
	private String name;
	private String url;
	/*0表示不是,1表示是*/
	private int isParent;
	/*如果是父节点,则是open=true*/
	private boolean open = true;
	
	/*是否被选中*/
	private boolean checked = false;
	
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	private List<ZtreeNode> nodes;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getIsParent() {
		return isParent;
	}

	public void setIsParent(int isParent) {
		this.isParent = isParent;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public List<ZtreeNode> getNodes() {
		return nodes;
	}

	public void setNodes(List<ZtreeNode> nodes) {
		this.nodes = nodes;
	}
	
	
}
