<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<html>
<head>
<title>失物招领管理系统</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${path }/loginstyle/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${path }/loginstyle/images/login.js"></script>
<link href="${path }/loginstyle/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>失物招领管理系统后台登录</h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
				<form id="form1" name="form1" action="login.htm" method="post" class="loginForm" >
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                    
                    <input type="text" id="u" name="userName" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="p" name="password" class="inputstyle"/>
                </div>
                </div>
               
                <div style="padding-left:50px;margin-top:20px;"><input onclick="javascript:document.getElementById('form1').submit()"  value="登 录" style="width:150px;" class="button_blue"/></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login"><form name="form2" id="form2" accept-charset="utf-8"  action="" method="post">
        <ul class="reg_form" id="reg-ul">
                <li>
                	
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="un" name="userName"  placeholder="请输入学号" class="inputstyle2"    />
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="p1"  name="password"  class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="qq" class="input-tips2">姓名：</label>
                    <div class="inputOuter2">
                      	<input type="hidden" value="5" name="roleId" />
                        <input type="text" id="realName" name="realName"  class="inputstyle2"/>
                    </div>
                </li>
                
                 <li>
                <label for="qq" class="input-tips2">班级：</label>
                    <div class="inputOuter2">
                       <select id="nianji" style="width:70px" onchange="loadBanji(this.value)"></select>
                       <select id="banji"   name="dept.id"></select>
                    </div>
                </li>
                
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg" onclick="zhuce()" style="width:100%;" class="button_blue" value="注册"/> 
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
           
    
    </div>
   
   
   <script type="text/javascript">
   
   function zhuce(){
	   $.ajax({
  			url:'${path}/user/reserveUser.htm',
  			dataType:'json',
  			type:'post',
  			data: $('#form2').serialize(),
  			async:false,
  			success:function(result){
				if(result.errorMsg){
					alert(result.errorMsg);
				}else{
					alert('注册成功请登陆');
  					location.reload();
				}
  			}
  		});
   }
   
   	$(function(){
   		$.ajax({
   			url:'${path}/dept/loadChildDept.htm',
   			dataType:'json',
   			type:'post',
   			data:{id:1},
   			async:false,
   			success:function(data){
				 var str = "";
				 for(var i=0;i<data.length;i++){
					 var d = data[i];
					 str += "<option value='"+d.id+"'> "+d.name+"</option>";
				 }
				 $("#nianji").html(str);
				 loadBanji(data[0].id);
   			}
   		});
   	});
   
   	function loadBanji(id){
   		$.ajax({
   			url:'${path}/dept/loadChildDept.htm',
   			dataType:'json',
   			type:'post',
   			data:{id:id},
   			async:false,
   			success:function(data){
				 var str = "";
				 for(var i=0;i<data.length;i++){
					 var d = data[i];
					 str += "<option value='"+d.id+"'> "+d.name+"</option>";
				 }
				 $("#banji").html(str);
   			}
   		});
   	}
   
   </script>
    
    </div>
    <!--注册end-->
</div>
</body></html>