package com.as.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.entity.Operation;
import com.as.service.OperationService;
import com.as.util.StringUtil;
import com.as.util.WriterUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("operation")
public class OperationController {
	
	private Operation operation;
	@Autowired
	private OperationService<Operation> operationService;
	private int rows = 10;
	private int page = 1;
	static Logger logger = Logger.getLogger(OperationController.class);
	
	@RequestMapping("operationList")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));//==null?1:Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));//==null?10:Integer.parseInt(request.getParameter("rows"));
			operation = new Operation();
			operation.setPage((page-1)*rows);
			operation.setRows(rows);
			operation.setMenuId(Integer.parseInt(request.getParameter("menuId")));
			List<Operation> list = operationService.findOperation(operation);
			int total = operationService.countOperation(operation);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );
			jsonObj.put("rows", list);
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("按钮展示错误",e);
		}
		
	}
	
	
	
	
	@RequestMapping("reserveOperation")
	public void reserveMenu(HttpServletRequest request,HttpServletResponse response,Operation operation){
		String operationId = request.getParameter("operationId");
		JSONObject result=new JSONObject();
		try {
			if (StringUtil.isNotEmpty(operationId)) {  //更新操作
				operation.setMenuId(Integer.parseInt(operationId));
				operationService.updateOperation(operation);
			} else {
				operationService.addOperation(operation);
			}
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("按钮保存错误",e);
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败！");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	

	@RequestMapping("deleteOperation")
	public void delUser(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				operationService.deleteOperation(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除按钮错误",e);
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
}
