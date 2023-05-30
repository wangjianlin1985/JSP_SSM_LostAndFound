<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
<script type="text/javascript">
var setting = {
		async: {    
            enable: true,    
            url:"${path}/dept/loadAllDept.htm"
        },
		
	view: {
		dblClickExpand: false,
		showLine: true,
		showIcon : true,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
		    pIdKey: "pid",
			rootPId: "0"
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			$("#hidePid").val(treeNode.id);
			$("#HIDDENPID").val(treeNode.id);
			searchDept();
		}
	}
	
};

 

var zNodes =[];
		
		
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	setTimeout("expendAll()",60);
	
});

function expendAll(){
	var zTree1 = $.fn.zTree.getZTreeObj("treeDemo");
	zTree1.expandAll(true); 
}

function searchDept(){
	$('#dg').datagrid('load',{
		pid:$('#hidePid').val()
	});
}


var deptUrl;
function openDeptAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加部门信息");
	deptUrl ="reserve.htm";
	initTree2();
}


function openDeptUpdateDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert('系统提示','请选择一条要编辑的数据！');
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","修改部门信息");
	$("#fm").form("load",row);
	deptUrl="reserve.htm?id="+row.id;
	initTree2();
}

function reserveDept(){
	$("#fm").form("submit",{
		url:deptUrl,
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
				closeDeptDialog();
				$("#dg").datagrid("reload");
			}
		}
	});
}

function closeDeptDialog(){
	$("#fm").form('clear');
	$("#dlg").dialog("close");
}


function deleteDept(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert('系统提示','请选择一条要删除的数据！');
		return;
	}
	var id =selectedRows[0].id;
	$.messager.confirm("系统提示","您确认要删除这条数据吗？",function(r){
		if(r){
			$.post("delete.htm",{id:id},function(result){
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
 
<body class="easyui-layout" >

<input  type="hidden" id="hidePid"  value="0" />
<div region="center">
		<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="true" url="list.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
            		<th data-options="field:'id'">
            		<th data-options="field:'pid',hidden:'true'">
                	<th field="name" width="60" align="center">名称</th>
            	</tr>
        </thead>
</table>
</div>
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="10016" clazz="easyui-linkbutton" onClick="openDeptAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="10017" clazz="easyui-linkbutton" onClick="openDeptUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="10018" clazz="easyui-linkbutton" onClick="deleteDept()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
</div>

	

<div region="west" style="width: 160px;padding: 5px;" title="部门班级" split="true">
		<ul id="treeDemo" class="ztree"></ul>
</div>

			
<!-- 新增和修改对话框 -->
<div id="dlg" class="easyui-dialog" style="text-align:right;width: 320px;height: 420px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 <form id="fm" method="post">
 	<table cellspacing="5px;">
  		<tr>
  			<td>名称：</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>上级：</td>
  				<input type="hidden"  value="0"  name="pid" id="HIDDENPID" />
  			<td>
  				<ul id="treeDemo2" class="ztree"></ul>
  			</td>
  		</tr>
  	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:reserveDept()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeDeptDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
		
<script type="text/javascript">
var setting2 = {
  		async: {    
              enable: true,    
              url:"${path}/dept/loadAllDept.htm"
          },
  		
  	view: {
  		dblClickExpand: false,
  		showLine: true,
  		showIcon : true,
  		selectedMulti: false
  	},
  	 check : {
          enable : true,
          chkStyle : "checkbox",   
          chkboxType : {
              "Y" : "",
              "N" : ""
          }
      },
  	data: {
  		simpleData: {
  			enable:true,
  			idKey: "id",
  		    pIdKey: "pid",
  			rootPId: "0"
  		}
  	},
  	callback: {
  		beforeClick: function(treeId, treeNode) {
  			// 设置隐藏deptcode
  			$("#HIDDENPID").val(treeNode.id);
  			// 只能单选
  			var treeObj = $.fn.zTree.getZTreeObj('treeDemo2');
  			treeObj.checkAllNodes(false);
  			treeObj.selectNode(treeNode,true); 
  		},
  		onCheck:function(event,treeId,treeNode){
  			// 设置隐藏deptcode
  			$("#HIDDENPID").val(treeNode.id);
  			// 只能单选
  			var treeObj = $.fn.zTree.getZTreeObj('treeDemo2');
  			treeObj.checkAllNodes(false);
  			// 设置选中
  			treeObj.checkNode(treeNode, true, true);
  		}
  	}
  	
  };
  var zNodes2 =[];

 function initTree2(){
	 var t = $("#treeDemo2");
	  	t = $.fn.zTree.init(t, setting2, zNodes2);
	  	setTimeout("a()",300);
 }
  
function a(){
	var a = $("#hidePid").val();
  	var treeObjx = $.fn.zTree.getZTreeObj('treeDemo2');
  	var node = treeObjx.getNodeByParam("id",a);
  	treeObjx.checkNode(node, true, true);
}
</script>
</body>
</html>
