package com.as.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.as.dao.DeptDao;
import com.as.service.DeptService;

@Service("deptService")
public class DeptServiceImpl<T> implements DeptService<T> {

	@Autowired
	private DeptDao<T> dao;
	
	@Override
	public List<T> findAllDept() throws Exception {
		return dao.findAllDept();
	}

	@Override
	public List<T> findDeptByPid(T t) throws Exception {
		return dao.findDeptByPid(t);
	}

	@Override
	public int countDeptByPid(T t) throws Exception {
		return dao.countDeptByPid(t);
	}

	@Override
	public T findOneDeptById(int id) throws Exception {
		return dao.findOneDeptById(id);
	}

	@Override
	public void updateDept(T t) throws Exception {
		dao.updateDept(t);
	}

	@Override
	public void addDept(T t) throws Exception {
		dao.addDept(t);
	}

	@Override
	public void deleteDept(T t) throws Exception {
		dao.deleteDept(t);
	}

	
	
}
