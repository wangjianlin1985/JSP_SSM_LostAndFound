package com.as.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.as.entity.Lq;
import com.as.entity.User;
import com.as.entity.Swzl;
import com.as.service.LqService;
import com.as.service.SwzlService;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;


@Controller
@RequestMapping("swzl")
public class SwzlController {
	@Autowired
	private SwzlService<Swzl> swzlService;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static SimpleDateFormat sdfAll = new SimpleDateFormat("yyyyMMddHHmmss");
	@Autowired
	private LqService<Lq> lqService;
	
	// 个人和管理员看到的。
	@RequestMapping("myIndex")
	public String myIndex(HttpServletRequest request){
		return "swzlMyIndex";
	}
	
	// 大众看到的
	@RequestMapping("index")
	public String index(){
		return "swzlIndex";
	}
	
	
	
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Swzl swzl = new Swzl();
			swzl.setTitle(request.getParameter("title"));
			swzl.setStatus(request.getParameter("status"));
			String type = request.getParameter("type"); // type=1 说明是从失物招领信息界面进来的，因此不做用户过滤
			if(!"1".equals(type)){
				User user = (User) request.getSession().getAttribute("currentUser");
				if(user.getUserId() != 1){ // 超级管理员排除掉，他能看到全部的
					swzl.setUser(user);
				}
			}
			swzl.setPage((page-1)*rows);
			swzl.setRows(rows);
			List<Swzl> list = swzlService.findList(swzl);
			int total = swzlService.count(swzl);
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
		return "swzlAdd";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			Swzl swzl = new Swzl();
			swzl.setId(Integer.parseInt(id));
			swzl = swzlService.findOne(swzl);
			request.setAttribute("swzl", swzl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "swzlUpdate";
	}
	
	
	
	
	@RequestMapping("reserveSwzl")
	public void reserveSwzl(HttpServletRequest request,HttpServletResponse response,Swzl swzl){
		String id = request.getParameter("id");
		swzl.setTime(sdf.format(new Date()));
		JSONObject o = new JSONObject();
		try {
			if(StringUtil.isEmpty(id)){
				User user = (User) request.getSession().getAttribute("currentUser");
				swzl.setUser(user);
				swzl.setStatus("发布中");
				swzl.setCode(sdfAll.format(new Date()));
				swzlService.add(swzl);
			} else {
				swzl.setId(Integer.parseInt(id));
				swzlService.update(swzl);
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
	public void updateStatus(HttpServletRequest request,HttpServletResponse response,Lq lq){
		String id = request.getParameter("id");
		JSONObject o = new JSONObject();
		try {
			Swzl swzl = new Swzl();
			swzl.setId(Integer.parseInt(id));
			swzl.setStatus("已领取");
			swzlService.updateStatus(swzl);
			
			User user = (User) request.getSession().getAttribute("currentUser");
			lq.setSwzl(swzl);
			lq.setUser(user);
			lq.setTime(sdf.format(new Date()));
			lqService.add(lq);
			
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
			Swzl swzl = new Swzl();
			swzl.setId(Integer.parseInt(id));
			swzl = swzlService.findOne(swzl);
			request.setAttribute("swzl", swzl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "swzlView";
	}
	
	
	@RequestMapping("findLqBySwzl")
	public void findLqBySwzl(HttpServletRequest request,HttpServletResponse response){
		try {
			String swzlid = request.getParameter("swzlid");
			Swzl swzl = new Swzl();swzl.setId(Integer.parseInt(swzlid));
			Lq lq = new Lq();lq.setSwzl(swzl);
			lq = lqService.findBySwzl(lq);
			JSONObject o = new JSONObject();
			o.put("lq", lq);
			WriterUtil.write(response, o.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping("deleteSwzl")
	public void deleteSwzl(HttpServletRequest request,HttpServletResponse response){
		JSONObject o = new JSONObject();
		try {
			String ids[] = request.getParameter("ids").split(",");
			for(String id : ids){
				Swzl swzl = new Swzl();
				swzl.setId(Integer.parseInt(id));
				swzlService.datele(swzl);
			}
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("errorMsg", "删除失败");
		}
		WriterUtil.write(response, o.toString());
	}
	
	
}
