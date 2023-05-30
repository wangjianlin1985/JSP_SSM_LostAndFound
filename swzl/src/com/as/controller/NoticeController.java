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
import com.as.entity.Notice;
import com.as.entity.Swzl;
import com.as.entity.User;
import com.as.service.NoticeService;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;


@RequestMapping("notice")
@Controller
public class NoticeController {

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@Autowired
	private NoticeService<Notice> noticeService;
	
	@RequestMapping("index")
	public String index(){
		return "noticeIndex";
	}
	
	
	@RequestMapping("myIndex")
	public String myIndex(){
		return "noticeMyIndex";
	}
	
	
	
	@RequestMapping("list")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Notice notice = new Notice();
			notice.setTitle(request.getParameter("title"));
			notice.setPage((page-1)*rows);
			notice.setRows(rows);
			List<Notice> list = noticeService.findList(notice);
			int total = noticeService.count(notice);
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
		return "noticeAdd";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			Notice notice = new Notice();
			notice.setId(Integer.parseInt(id));
			notice = noticeService.findOne(notice);
			request.setAttribute("notice", notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "noticeUpdate";
	}
	
	
	@RequestMapping("reserveNotice")
	public void reserveNotice(HttpServletRequest request,HttpServletResponse response,Notice notice){
		String id = request.getParameter("id");
		notice.setTime(sdf.format(new Date()));
		JSONObject o = new JSONObject();
		try {
			if(StringUtil.isEmpty(id)){
				noticeService.add(notice);
			} else {
				notice.setId(Integer.parseInt(id));
				noticeService.update(notice);
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
			Notice notice = new Notice();
			notice.setId(Integer.parseInt(id));
			notice = noticeService.findOne(notice);
			request.setAttribute("notice", notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "noticeView";
	}
	
	
	
	
	@RequestMapping("deleteNotice")
	public void deleteNotice(HttpServletRequest request,HttpServletResponse response){
		JSONObject o = new JSONObject();
		try {
			String ids[] = request.getParameter("ids").split(",");
			for(String id : ids){
				Notice notice = new Notice();
				notice.setId(Integer.parseInt(id));
				noticeService.detele(notice);
			}
			o.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			o.put("errorMsg", "删除失败");
		}
		WriterUtil.write(response, o.toString());
	}
	
	
	
	
}
