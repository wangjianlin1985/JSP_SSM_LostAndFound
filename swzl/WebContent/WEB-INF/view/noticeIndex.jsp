<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title></title>
    
    <style type="text/css">
    	.datagrid-row-selected {
    		background:white;
    	}
    </style>
    
    <script type="text/javascript">
		function searchNotice(){
    		$('#dg').datagrid('load',{
    			title:$("#s_title").val()
    		});
        }

		$(function(){
			$("#dg").datagrid({  
				onClickRow: function (index, row) { 
					window.open("findOne.htm?id="+row.id);
				}
			});
		});
		
		
    </script>
    </head>
 
 
<body  style="margin:1px">


<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="false" url="list.htm?type=1" fit="true" toolbar="#tb">
        <thead>
            	<tr>
                	<th data-options="field:'id',width:80,hidden:'true'" align="center"></th>
                	<th field="title" width="60" align="center"   >标题</th>
                	<th field="time" width="60" align="center">发布时间</th>
            	</tr>
        </thead>
</table>
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<input type="hidden" id="hdeptid"  />
		&nbsp;关键字：&nbsp;<input type="text" name="s_title" id="s_title" size="20" onkeydown="if(event.keyCode==13) searchNotice()"/>
		<a href="javascript:searchNotice()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>




</body>
</html>
