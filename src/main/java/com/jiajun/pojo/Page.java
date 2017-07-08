package com.jiajun.pojo;

import java.util.List;

/**
 * @描述：分页对象
 * @author jiajun
 * @date 2017年6月17日下午2:14:51
 */
public class Page<T> {
	/*当前页码*/
	private int currentPage;
	/*每页显示条数*/
	private int pageSize;
	/*总共的条数*/
	private int count;
	/*总页数*/
	private int totalPage;
	/*对象集合*/
	private List<T> list;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}
