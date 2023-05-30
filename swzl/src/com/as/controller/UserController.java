package com.as.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.as.entity.Dept;
import com.as.entity.User;
import com.as.service.UserService;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;

import net.sf.json.JSONObject;



@Controller
@RequestMapping("user")
public class UserController {

	private int page;
	private int rows;
	private User user;
	@Autowired
	private UserService<User> userService;
	static Logger logger = Logger.getLogger(UserController.class);
	
	
	
	
	@RequestMapping("userIndex")
	public String index(){
		return "user";
	}
	
	
	@RequestMapping("userList")
	public void userList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			user = new User();
			user.setPage((page-1)*rows);
			user.setRows(rows);
			user.setUserName(request.getParameter("userName"));
			String roleId = request.getParameter("roleId");
			if (StringUtil.isNotEmpty(roleId)) {
				user.setRoleId(Integer.parseInt(roleId));
			} else {
				user.setRoleId(null);
			}
			String deptid = request.getParameter("deptid");
			if(StringUtil.isNotEmpty(deptid)){
				Dept d = new Dept();
				d.setId(Integer.parseInt(deptid));
				user.setDept(d);
			}
			List<User> list= userService.findUser(user);
			int total = userService.countUser(user);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total",total );
			jsonObj.put("rows", list);
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("用户展示错误",e);
		}
	}
	
	
	// 新增或修改
	@RequestMapping("reserveUser")
	public void reserveUser(HttpServletRequest request,User user,HttpServletResponse response){
		String userId = request.getParameter("userId");
		JSONObject result=new JSONObject();
		try {
			if (StringUtil.isNotEmpty(userId)) {   // userId不为空 说明是修改
				user.setUserId(Integer.parseInt(userId));
				userService.updateUser(user);
				result.put("success", true);
			}else {   // 添加
				if(userService.existUserWithUserName(user.getUserName())==null){  // 没有重复可以添加
					userService.addUser(user);
					result.put("success", true);
				} else {
					result.put("success", true);
					result.put("errorMsg", "该用户名被使用");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("保存用户信息错误",e);
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	@RequestMapping("deleteUser")
	public void delUser(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				userService.deleteUser(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除用户信息错误",e);
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
}
