<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>修改</title>
    
    <script type="text/javascript">
	
    	var ue;
    	$(function(){	
    		ue = UE.getEditor('container');
    	 	ue.ready(function() {
			    ue.setContent('${byx.content}');
		 	});
    	});
    

        
        function reserveByx(){
        	 $.ajax({
       			url:'${path}/byx/reserveByx.htm',
       			dataType:'json',
       			type:'post',
       			data: $('#fm').serialize(),
       			async:false,
       			success:function(result){
     				if(result.errorMsg){
     					alert(result.errorMsg);
     				}else{
     					alert('修改成功');
     					window.opener=null;window.close();
     				}
       			}
       		});
        }
        
        

    </script>
    </head>
 
 
<body  style="margin:5px">




 <form id="fm" method="post"><br/>
 	<div >
 		<label>标题</label>
 		<input name="id" value="${byx.id }" type="hidden" />
 		<input type="text" id="title" name="title" value="${byx.title }" class="easyui-validatebox" required="true"/>
 	</div>
 	<br/>
 	<div >
 		<label>姓名</label>
 		<input type="text" id="name" name="name" value="${byx.name }" class="easyui-validatebox" required="true"/>
 	</div>
 	<br/>
 	<div >
 		<label>内容  &nbsp;&nbsp;&nbsp;&nbsp;<button style="width:100px" onclick="reserveByx()">保存</button></label>
 		<script id="container" name="content" style="height:400px;margin-top:10px" type="text/plain" />
 	</div>
  		
 </form>


</body>
</html>
