package com.as.service;

import java.util.List;

public interface NoticeService<T> {

	public List<T> findList(T t) throws Exception;
	
	public T findOne(T t) throws Exception;
	
	public int count(T t) throws Exception;
	
	public void add(T t) throws Exception;
	
	public void update(T t) throws Exception;
	
	public void detele(T t) throws Exception;
}
