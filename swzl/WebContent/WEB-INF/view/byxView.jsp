<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>表扬信</title>
   </head>
 
 
<body  style="margin:5px">

	<div style="height:50px;line-height:50px;text-align:center;align:center">
	<span style="font-size:24px">${byx.title }</span>
	<br/>${byx.time }&nbsp;&nbsp;&nbsp;表扬人:${byx.name }
	</div>
	<div style="height:70%;margin-top:50px;width:80%;margin-left:10%;border-top:1px solid black"> 
		${byx.content }
	</div>
		

</body>
</html>
