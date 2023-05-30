<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>通知公告</title>
   </head>
 
 
<body  style="margin:5px">

	<div style="height:50px;line-height:50px;text-align:center;align:center">
	<span style="font-size:24px">${notice.title }</span>
	<br/>${notice.time }
	</div>
	
	<div style="height:70%;margin-top:50px;width:80%;margin-left:10%;border-top:1px solid black"> 
		${notice.content }
	</div>
		

</body>
</html>
