<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>领取信息</title>
    
    <style type="text/css">
    	.datagrid-row-selected {
    		background:white;
    	}
    </style>
    
    <script type="text/javascript">
		var url;
		function searchLq(){
    		$('#dg').datagrid('load',{
    			name:$("#s_name").val()
    		});
        }


		// 打开修改失物信息对话框
        function openLqUpdateDialog(){
    		var selectedRows=$("#dg").datagrid('getSelections');
    		if(selectedRows.length!=1){
    			$.messager.alert('系统提示','请选择一条要编辑的数据！');
    			return;
    		}
    		var row=selectedRows[0];
    		$("#dlg").dialog("open").dialog("setTitle","修改领取信息");
    		$("#fm").form("load",row);
    		url = "update.htm?id="+row.id;
    	}

		
		
		function reserveLq(){
			$("#fm").form("submit",{
    			url:url,
    			onSubmit:function(){
    				return $(this).form("validate");
    			},
    			success:function(result){
    				var result=eval('('+result+')');
    				if(result.errorMsg){
    					$.messager.alert('系统提示',"<font color=red>"+result.errorMsg+"</font>");
    					return;
    				}else{
    					$.messager.alert('系统提示','保存成功');
    					closeLqDialog();
    					$("#dg").datagrid("reload");
    				}
    			}
    		});
		}
		

		function closeLqDialog(){
			$("#fm").form('clear');
        	$("#dlg").dialog("close");
		}
		
		
		
		
		function deleteLq(){
			var selectedRows=$("#dg").datagrid('getSelections');
    		if(selectedRows.length == 0){
    			$.messager.alert('系统提示','请选择一条要编辑的数据！');
    			return;
    		}
    		var strIds=[];
    		for(var i=0;i<selectedRows.length;i++){
    			strIds.push(selectedRows[i].id);
    		}
    		var ids=strIds.join(","); 
    		$.messager.confirm("系统提示","您确认要删除这些数据吗？",function(r){
    			if(r){
    				$.post("delete.htm",{ids:ids},function(result){
    					if(result.success){
    						$.messager.alert('系统提示',"您已成功删除数据！");
    						$("#dg").datagrid("reload");
    					}else{
    						$.messager.alert('系统提示',result.errorMsg);
    					}
    				},"json");
    			}
    		});
    		
		}
		
		
	
		
		
    </script>
    </head>
 
 
<body  style="margin:1px">


<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="true" url="list.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
                	<th data-options="field:'id',width:80,hidden:'true'" align="center"></th>
                	<th field="name" width="60" align="center"  formatter="formatTitle">联系人</th>
                	<th field="phone" width="60" align="center"   >联系方式</th>
                	<th field="time" width="60" align="center">领取时间</th>
                	<th field="userId" width="60" align="center" formatter="formatUser">经办人</th>
            	</tr>
        </thead>
        <script>
        	
        function formatTitle(value,row,index){
    		return "<a javascript:void(0) onclick='openSwzl(\""+row.swzl.id+"\")'>"+value+"</a>";
    	}
    	
    	function formatUser(value,row,index){
    		return row.user.realName;
    	}
    	
    	function openSwzl(id){
    		window.open("${path}/swzl/findOne.htm?id="+id);
    	}
        	
        </script>
</table>
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="10044" clazz="easyui-linkbutton" onClick="openLqUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="10045" clazz="easyui-linkbutton" onClick="deleteLq()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		<input type="hidden" id="hdeptid"  />
		&nbsp;关键字：&nbsp;<input type="text" name="s_title" id="s_title" size="20" onkeydown="if(event.keyCode==13) searchLq()"/>
		<a href="javascript:searchLq()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>





<div id="dlg" class="easyui-dialog" style="text-align:right;width: 620px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 <form id="fm" method="post">
 	<table cellspacing="5px;">
  		<tr>
  			<td>领取人：</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr><td>&nbsp;</td></tr>
  		<tr>
  			<td>联系方式：</td>
  			<td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/></td>
  		</tr>
  	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:reserveLq()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeLqDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>



</body>
</html>
