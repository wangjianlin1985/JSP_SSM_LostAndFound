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
import com.as.entity.Swzl;
import com.as.entity.User;
import com.as.service.LqService;
import com.as.util.WriterUtil;


@Controller
@RequestMapping("lq")
public class LqController {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	@Autowired
	private LqService<Lq> lqService;
	
	@RequestMapping("index")
	public String index(){
		return "lq";
	}
	
	
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Lq lq = new Lq();
			lq.setName(request.getParameter("name"));
			lq.setPage((page-1)*rows);
			lq.setRows(rows);
			List<Lq> list =lqService.findList(lq);
			int total = lqService.count(lq);
			JSONObject o = new JSONObject();
			o.put("rows", list);
			o.put("total", total);
			WriterUtil.write(response, o.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("update")
	public void update(HttpServletRequest request,HttpServletResponse response,Lq lq){
		JSONObject o = new JSONObject();
		try {
			lq.setTime(sdf.format(new Date()));
			lqService.update(lq);
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("errorMsg", "保存错误");
		}
		WriterUtil.write(response, o.toString());
	}
	
	
	@RequestMapping("delete")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		JSONObject o = new JSONObject();
		try {
			String[] ids = request.getParameter("ids").split(",");
			for(String id : ids){
				Lq lq = new Lq();
				lq.setId(Integer.parseInt(id));
				lqService.datele(lq);
			}
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		WriterUtil.write(response, o.toString());
	}
	
	
	
	

}
