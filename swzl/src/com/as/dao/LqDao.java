package com.as.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("lqDao")
public interface LqDao<T> {

	public List<T> findList(T t) throws Exception;
	
	public T findOne(T t) throws Exception;
	
	public int count(T t) throws Exception;
	
	public void add(T t) throws Exception;
	
	public void update(T t) throws Exception;
	
	public void datelex(T t) throws Exception;
	
	public T findBySwzl(T t) throws Exception;
	
}
