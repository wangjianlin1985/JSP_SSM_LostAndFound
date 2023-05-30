package com.as.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.as.dao.XwqsDao;
import com.as.service.XwqsService;

@Service("xwsqService")
public class XwqsServiceImpl<T> implements XwqsService<T>{
	
	@Autowired
	private XwqsDao<T> dao;

	@Override
	public List<T> findList(T t) throws Exception {
		return dao.findList(t);
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
		dao.datele(t);
	}

	@Override
	public void updateStatus(T t) throws Exception {
		dao.updateStatus(t);
	}

	@Override
	public T findOne(T t) throws Exception {
		return dao.findOne(t);
	}

}
