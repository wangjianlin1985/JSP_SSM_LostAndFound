package com.as.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hamcrest.core.Is;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.as.entity.User;
import com.as.entity.Xwqs;
import com.as.service.XwqsService;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;


@Controller
@RequestMapping("xwqs")
public class XwqsController {
	
	@Autowired
	private XwqsService<Xwqs> xwqsService;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static SimpleDateFormat sdfAll = new SimpleDateFormat("yyyyMMddHHmmss");
	
	@RequestMapping("myIndex")
	public String myIndex(HttpServletRequest request){
		return "xwqsMyIndex";
	}
	
	@RequestMapping("index")
	public String index(){
		return "xwqsIndex";
	}
	
	
	
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Xwqs xwqs = new Xwqs();
			xwqs.setTitle(request.getParameter("title"));
			xwqs.setStatus(request.getParameter("status"));
			String type = request.getParameter("type"); // type=1 说明是从寻物信息界面进来的，因此不做用户过滤
			if(!"1".equals(type)){
				User user = (User) request.getSession().getAttribute("currentUser");
				if(user.getUserId() != 1){ // 超级管理员排除掉，他能看到全部的
					xwqs.setUser(user);
				}
			}
			xwqs.setPage((page-1)*rows);
			xwqs.setRows(rows);
			List<Xwqs> list = xwqsService.findList(xwqs);
			int total = xwqsService.count(xwqs);
			JSONObject o = new JSONObject();
			o.put("rows", list);
			o.put("total", total);
			WriterUtil.write(response, o.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("toAdd")
	public String toAdd(){
		return "xwqsAdd";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			Xwqs xwqs = new Xwqs();
			xwqs.setId(Integer.parseInt(id));
			xwqs = xwqsService.findOne(xwqs);
			request.setAttribute("xwqs", xwqs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "xwqsUpdate";
	}
	
	
	
	
	@RequestMapping("reserveXwqs")
	public void reserveXwqs(HttpServletRequest request,HttpServletResponse response,Xwqs xwqs){
		String id = request.getParameter("id");
		xwqs.setTime(sdf.format(new Date()));
		JSONObject o = new JSONObject();
		try {
			if(StringUtil.isEmpty(id)){
				User user = (User) request.getSession().getAttribute("currentUser");
				xwqs.setUser(user);
				xwqs.setStatus("发布中");
				xwqs.setCode(sdfAll.format(new Date()));
				xwqsService.add(xwqs);
			} else {
				xwqs.setId(Integer.parseInt(id));
				xwqsService.update(xwqs);
			}
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("success", true);
			o.put("errorMsg","保存失败");
		}
		WriterUtil.write(response, o.toString());
	}
	
	
	@RequestMapping("updateStatus")
	public void updateStatus(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		JSONObject o = new JSONObject();
		try {
			Xwqs xwqs = new Xwqs();
			xwqs.setId(Integer.parseInt(id));
			xwqs.setStatus("已完成");
			xwqsService.updateStatus(xwqs);
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("success", true);
			o.put("errorMsg","保存失败");
		}
		WriterUtil.write(response, o.toString());
	}
	
	@RequestMapping("findOne")
	public String findOne(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			Xwqs xwqs = new Xwqs();
			xwqs.setId(Integer.parseInt(id));
			xwqs = xwqsService.findOne(xwqs);
			request.setAttribute("xwqs", xwqs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "xwqsView";
	}
	
	
	@RequestMapping("deleteXwqs")
	public void deleteXwqs(HttpServletRequest request,HttpServletResponse response){
		JSONObject o = new JSONObject();
		try {
			String ids[] = request.getParameter("ids").split(",");
			for(String id : ids){
				Xwqs xwqs = new Xwqs();
				xwqs.setId(Integer.parseInt(id));
				xwqsService.datele(xwqs);
			}
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("errorMsg", "删除失败");
		}
		WriterUtil.write(response, o.toString());
	}
	
	
	

}
