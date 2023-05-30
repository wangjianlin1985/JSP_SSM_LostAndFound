package com.as.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.as.dao.LqDao;
import com.as.service.LqService;

@Service("lqService")
public class LqServiceImpl<T> implements LqService<T> {
	
	@Autowired
	private LqDao<T> dao;

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
	public void datele(T t) throws Exception {
		dao.datelex(t);
	}

	@Override
	public T findBySwzl(T t) throws Exception {
		return dao.findBySwzl(t);
	}

}
