package com.jiajun.dao.base.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jiajun.dao.base.Dao;
import com.jiajun.pojo.Page;
import com.jiajun.pojo.ParameMap;
import com.jiajun.pojo.system.SysUserEntity;

@Repository
public class DaoImpl extends  SqlSessionDaoSupport implements Dao {
	
	/**
	 * 在mybatis-spring-1.2.0之后取消自动注入,需手动
	 */
	@Override
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public int insert(String statement, Object obj) throws Exception {
		 return this.getSqlSession().insert(statement, obj);
	}

	@Override
	public int delete(String statement, Object obj) throws Exception {
		return this.getSqlSession().delete(statement, obj);
	}
	
	@Override
	public int update(String statement, Object obj) throws Exception {
		return this.getSqlSession().update(statement, obj);
	}

	@Override
	public List selectList(String statement, Object obj) throws Exception {
		return this.getSqlSession().selectList(statement, obj);
	}

	@Override
	public Object selectObject(String statement, Object obj) throws Exception {
		return this.getSqlSession().selectOne(statement, obj);
	}

	@Override
	public void batchInsert(String statement, List list) throws Exception {
		for (Object object : list) {
			this.getSqlSession().insert(statement, object);
		}
	}

	@Override
	public void batchUpdate(String statement, List list) throws Exception {
		for (Object object : list) {
			this.getSqlSession().update(statement, object);
		}
	}

	@Override
	public void batchDelete(String statement, List list) throws Exception {
		for (Object object : list) {
			this.getSqlSession().delete(statement, object);
		}
	}

	@Override
	public Page getPage(String listMethod, String countMethod, ParameMap params) throws Exception {
		Integer currentPage = (Integer) params.get("currentPage");
		Integer rows = (Integer) params.get("rows");
		Page<SysUserEntity> page = new Page<SysUserEntity>();
		int count = (int) selectObject(countMethod, params);
		if(count > 0) {
			int begin  = (currentPage-1)*rows;
			params.put("begin", begin);
			List list = (List) selectList(listMethod, params);
			page.setList(list);
		}
		int totalPage = (count-1)/rows + 1;
		page.setCount(count);
		page.setTotalPage(totalPage);
		page.setCurrentPage(currentPage);
		page.setPageSize(rows);
		return page;
	}

	@Override
	public Page getPage(String listMethod, String countMethod, int currentPage, int rows,
			Map<String, Object> conditions) throws Exception {
		Page<SysUserEntity> page = new Page<SysUserEntity>();
		int count = (int) selectObject(countMethod, conditions);
		if(count > 0) {
			int begin  = (currentPage-1)*rows;
			conditions.put("begin", begin);
			List list = (List) selectList(listMethod, conditions);
			page.setList(list);
		}
		int totalPage = (count-1)/rows + 1;
		page.setCount(count);
		page.setTotalPage(totalPage);
		page.setCurrentPage(currentPage);
		page.setPageSize(rows);
		return page;
	}
	
}
