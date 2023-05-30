package com.as.service;

import java.util.List;

public interface SwzlService<T> {

	public List<T> findList(T t) throws Exception;
	
	public T findOne(T t) throws Exception;
	
	public int count(T t) throws Exception;
	
	public void add(T t) throws Exception;
	
	public void update(T t) throws Exception;
	
	public void datele(T t) throws Exception;
	
	public void updateStatus(T t) throws Exception;
	
	
}
