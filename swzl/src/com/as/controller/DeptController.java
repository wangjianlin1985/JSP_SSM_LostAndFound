package com.as.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.as.entity.Dept;
import com.as.service.DeptService;
import com.as.util.PropertiesUtil;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;

import net.sf.json.JSONObject;

@RequestMapping("dept")
@Controller
public class DeptController {

	private int page = 1;
	private int rows = 10;
	
	@Autowired
	private DeptService<Dept> deptService;
	
	
	
	@RequestMapping("loadChildDept")
	public void loadChildDept(HttpServletRequest request,HttpServletResponse response){
		try {
			String id = request.getParameter("id");
			Dept d = new Dept();
			d.setPid(Integer.parseInt(id));
			List<Dept> list = deptService.findDeptByPid(d);
			String str = JSON.toJSONString(list);
			WriterUtil.write(response, str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	// 加载所有的部门
	@RequestMapping("loadAllDept")
	public void loadAllDept(HttpServletRequest request,HttpServletResponse response){
		try {
			List<Dept> list = deptService.findAllDept();
			String str = JSON.toJSONString(list);
			WriterUtil.write(response, str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	@RequestMapping("index")
	public String index(){
		return "dept";
	}
	
	
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			int pid = 0;
			if(StringUtil.isNotEmpty(request.getParameter("pid"))){
				pid = Integer.parseInt(request.getParameter("pid"));
			}
			Dept dept = new Dept();
			dept.setPid(pid);
			dept.setPage((page-1)*rows);
			dept.setRows(rows);
			List<Dept> list = deptService.findDeptByPid(dept);
			int total = deptService.countDeptByPid(dept);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total",total );
			jsonObj.put("rows", list);
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("reserve")
	public void reserve(HttpServletRequest request,HttpServletResponse response,Dept dept){
		String id = request.getParameter("id");
		com.alibaba.fastjson.JSONObject result = new com.alibaba.fastjson.JSONObject();
		try {
			if(StringUtil.isEmpty(id)){
				deptService.addDept(dept);
				result.put("success", true);
			} else {
				dept.setId(Integer.parseInt(id));
				deptService.updateDept(dept);
				result.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "保存失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	@RequestMapping("delete")
	public void delete(HttpServletResponse response,HttpServletRequest request){
		JSONObject result = new JSONObject();
		try {
			String id = request.getParameter("id");
			Dept d = new Dept();
			d.setId(Integer.parseInt(id));
			d.setPid(Integer.parseInt(id));
			// 1先判断是否有子部门；
			int childDeptCount = deptService.countDeptByPid(d);
			if(childDeptCount > 0){
				result.put("errorMsg", "该部门下面还有子部门，不能删除");
				WriterUtil.write(response, result.toString());return;
			} 
			// 2判断该部门下是否有数据
			deptService.deleteDept(d);
			result.put("success", true);
			WriterUtil.write(response, result.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
