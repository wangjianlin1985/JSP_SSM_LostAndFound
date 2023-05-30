package com.as.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.as.dao.ByxDao;
import com.as.service.ByxService;

@Service("byxService")
public class ByxServiceImpl<T> implements ByxService<T>{
	
	@Autowired
	private ByxDao<T> dao;

	@Override
	public List<T> findList(T t) throws Exception {
		return dao.findList(t);
	}

	@Override
	public T findOne(T t) throws Exception {
		return dao.findOne(t);
	}

	@Override
	public int count(T t) throws Exception {
		return dao.count(t);
	}

	@Override
	public void add(T t) throws Exception {
		dao.add(t);
	}

	@Override
	public void update(T t) throws Exception {
		dao.update(t);
	}

	@Override
	public void detele(T t) throws Exception {
		dao.detele(t);
	}

}
