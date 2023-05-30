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
import com.as.entity.Byx;
import com.as.service.ByxService;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;


@RequestMapping("byx")
@Controller
public class ByxController {

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@Autowired
	private ByxService<Byx> byxService;
	
	@RequestMapping("index")
	public String index(){
		return "byxIndex";
	}
	
	
	@RequestMapping("myIndex")
	public String myIndex(){
		return "byxMyIndex";
	}
	
	
	
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Byx byx = new Byx();
			byx.setTitle(request.getParameter("title"));
			byx.setPage((page-1)*rows);
			byx.setRows(rows);
			List<Byx> list = byxService.findList(byx);
			int total = byxService.count(byx);
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
		return "byxAdd";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			Byx byx = new Byx();
			byx.setId(Integer.parseInt(id));
			byx = byxService.findOne(byx);
			request.setAttribute("byx", byx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "byxUpdate";
	}
	
	
	@RequestMapping("reserveByx")
	public void reserveByx(HttpServletRequest request,HttpServletResponse response,Byx byx){
		String id = request.getParameter("id");
		byx.setTime(sdf.format(new Date()));
		JSONObject o = new JSONObject();
		try {
			if(StringUtil.isEmpty(id)){
				byxService.add(byx);
			} else {
				byx.setId(Integer.parseInt(id));
				byxService.update(byx);
			}
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
			Byx byx = new Byx();
			byx.setId(Integer.parseInt(id));
			byx = byxService.findOne(byx);
			request.setAttribute("byx", byx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "byxView";
	}
	
	
	
	
	@RequestMapping("deleteByx")
	public void deleteByx(HttpServletRequest request,HttpServletResponse response){
		JSONObject o = new JSONObject();
		try {
			String ids[] = request.getParameter("ids").split(",");
			for(String id : ids){
				Byx byx = new Byx();
				byx.setId(Integer.parseInt(id));
				byxService.detele(byx);
			}
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("errorMsg", "删除失败");
		}
		WriterUtil.write(response, o.toString());
	}
	
	
	
	
}
