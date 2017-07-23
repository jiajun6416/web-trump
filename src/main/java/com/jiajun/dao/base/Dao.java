package com.jiajun.dao.base;

import java.util.List;
import java.util.Map;

import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;

/**
 * @描述： baseDao接口
 * @author jiajun
 * @date 2017年7月1日下午3:58:47
 */
public interface Dao {
	
	/**
	 * 增
	 * @param statement 对应mapper的方法
	 * @param obj
	 */
	int insert(String statement, Object obj) throws Exception;
	
	/**
	 * delete
	 * @param statement
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	int delete(String statement, Object obj) throws Exception;
	
	/**
	 * uodate
	 * @param statement
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	int update(String statement, Object obj) throws Exception;

	/**
	 * 返回一个对象
	 * @param statement
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	Object selectObject(String statement, Object obj) throws Exception;
	
	/**
	 * 返回一个集合
	 * @param statement
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	List selectList(String statement, Object obj) throws Exception;
	
	/**
	 * 获得分页对象
	 * @param listMethod
	 * @param countMethod
	 * @param params
	 * @return
	 * @throws Exception
	 */
	Page getPage(String listMethod, String countMethod, ParameMap params) throws Exception;
	
	/**
	 * 
	 * @param listMethod 
	 * @param countMethod
	 * @param currentPage
	 * @param rows
	 * @param conditions
	 * @return
	 * @throws Exception
	 */
	Page getPage(String listMethod, String countMethod, int currentPage, int rows, Map<String, Object> conditions) throws Exception;
	
	/**
	 * 批量插入
	 * @param strtrment
	 * @param list
	 * @return
	 * @throws Exception
	 */
	void batchInsert(String statement, List list) throws Exception;
	
	/**
	 * 批量修改
	 * @param statement
	 * @param list
	 * @return
	 * @throws Exception
	 */
	void batchUpdate(String statement, List list) throws Exception;
	
	/**
	 * 批量删除
	 * @param statement
	 * @param lisst
	 * @return
	 * @throws Exception
	 */
	void batchDelete(String statement, List list) throws Exception;
}
