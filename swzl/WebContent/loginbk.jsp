<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${path }/loginstyle/css/style.css" rel="stylesheet" type="text/css" />
<title>用户登录</title>
</head>
<body>
<div id="web" style="height:100%;">
<p style="height:180px;"></p>
<p align="center"><img src="${path }/loginstyle/images/logzi.png" /></p>
<p style="height:40px;"></p>
<div class="login">
   <div class="banner">
   
   <iframe id="frame_banner" src="${path }/loginstyle/sban/banner.html" height="218" width="100%"  allowtransparency="true" title="test"  scrolling="no" frameborder="0"></iframe>
   </div>
   <form id="form1" name="form1" action="login.htm" method="post">
   <div class="logmain">
      <h1>&nbsp;</h1>
      <div class="logdv">
         <span class="logzi">账 号：</span>
        <input type="text"   id="userName" name="userName"   class="ipt" />
      </div>
      <div class="logdv">
      <span class="logzi">密 码：</span>
        <input id="password" name="password"  type="password" class="ipt" />
      </div>
      <div class="logdv" style="height:40px;">
        <p class="logzi">&nbsp;</p>    
        <input name="提交" onclick="javascript:document.getElementById('form1').submit()" class="btnbg" value="点击登录" />
      </div>
      <div class="logdv" style="height:40px;">
        <p class="logzi">&nbsp;</p>    
        <input  onclick="window.location.href='${path}/register.jsp'" class="btnbg" value="注册" />
      </div>
   </div>
   </form>
</div>
<p style="height:100px;"></p>
</div>
</body>
</html>