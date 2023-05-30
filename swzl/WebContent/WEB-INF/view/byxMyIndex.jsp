<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>表扬信</title>
    
    <style type="text/css">
    	.datagrid-row-selected {
    		background:white;
    	}
    </style>
    
    <script type="text/javascript">
		var url;
		function searchByx(){
    		$('#dg').datagrid('load',{
    			title:$("#s_title").val()
    		});
        }

		// 打开新增通知信息对话框
        function openByxAddDialog(){
			window.open("${path}/byx/toAdd.htm");
        }

		// 打开修改通知信息对话框
        function openByxUpdateDialog(){
    		var selectedRows=$("#dg").datagrid('getSelections');
    		if(selectedRows.length!=1){
    			$.messager.alert('系统提示','请选择一条要编辑的数据！');
    			return;
    		}
    		var row=selectedRows[0];
    		window.open("${path}/byx/toUpdate.htm?id="+row.id);
    	}

		
		

		
		
		function deleteByx(){
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
    				$.post("deleteByx.htm",{ids:ids},function(result){
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
                	<th data-options="field:'id',width:80,hidden:'true'" align="center">通知编号</th>
                	<th field="title" width="60" align="center"   formatter="formatTitle" >标题</th>
                	<th field="name" width="60" align="center"   >表扬人</th>
                	<th field="time" width="60" align="center">发布时间</th>
            	</tr>
        </thead>
        <script>
        	function formatTitle(value,row,index){
        		return "<a javascript:void(0) onclick='openByx(\""+row.id+"\")'>"+value+"</a>";
        	}
        	
        	
        	function openByx(id){
        		window.open("findOne.htm?id="+id);
        	}
        </script>
</table>
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="10049" clazz="easyui-linkbutton" onClick="openByxAddDialog()" name="发布"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="10050" clazz="easyui-linkbutton" onClick="openByxUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="10051" clazz="easyui-linkbutton" onClick="deleteByx()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		<input type="hidden" id="hdeptid"  />
		&nbsp;关键字：&nbsp;<input type="text" name="s_title" id="s_title" size="20" onkeydown="if(event.keyCode==13) searchByx()"/>
		<a href="javascript:searchByx()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>











</body>
</html>