<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../index/top.jsp"%>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/v3/zTreeStyle.css"/>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"/></script>
	<script type="text/javascript" src="plugins/zTree/v3/jquery.ztree.core.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/v3/jquery.ztree.excheck.js"></script>
	<style type="text/css">
		footer{height:50px;position:fixed;bottom:0px;left:0px;width:100%;text-align: center;}
	</style>
<body>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div id="zhongxin">
								<div style="overflow: scroll; scrolling: yes;height:415px;width: 309px;">
									<ul id="menuTree" class="ztree" style="overflow:auto;"></ul>
								</div>
							</div>
							<div id="zhongxin2" class="center" style="display:none">
								<br/><br/><br/><br/>
								<img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">正在保存...</h4></div>
							</div>
						<!-- /.col -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	
		<div style="width: 100%;padding-top: 5px;" class="center">
			<c:if test="${not empty action}">
				<c:choose>
					<c:when test="${'maxMenu' == action}">
							<a class="btn btn-mini btn-primary" onclick="saveMaxMenus();">保存</a>
					</c:when>
					<c:when test="${'premission' == action}">
						<a class="btn btn-mini btn-primary" onclick="savepremission();">保存</a>
					</c:when>
					<c:otherwise>
							<a class="btn btn-mini btn-primary" onclick="saveMenus();">保存</a>
					</c:otherwise>
				</c:choose>
			</c:if>
			<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
		</div>
	
<script type="text/javascript">
	$(top.hangge());
	/* ==========================================Ztree===================================== */
	var zTree;
	$(function() {
		/* Ztree */
		var setting = {
			check: {
				enable: true,
				checkable: true,
				 showLine: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "ps", "N": "ps" }
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		//console.log('${treeNodes}');
		zTree = $.fn.zTree.init($("#menuTree"), setting, eval('${treeNodes}'));
	});
	/* ======================================================================================= */
		//保存角色组菜单权限
		 function saveMaxMenus(){
			var nodes = zTree.getCheckedNodes(true);
			var tmpNode;
			var ids = "";
			for(var i=0; i<nodes.length; i++){
				tmpNode = nodes[i];
				if(i!=nodes.length-1){
					ids += tmpNode.id+",";
				}else{
					ids += tmpNode.id;
				}
			}
			var roleType = '${roleType}';
			var url = "role/saveMaxTypeMenu.do";
			var postData;
			postData = {"roleType":roleType,"menuIds":ids};
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			$.post(url,postData,function(data){
				if(data.status != 200) {
					alert(data.msg);
				}
				top.Dialog.close();
			});
		 }
		//保存角色菜单权限
		 function saveMenus(){
			var nodes = zTree.getCheckedNodes(true);
			var tmpNode;
			var ids = "";
			for(var i=0; i<nodes.length; i++){
				tmpNode = nodes[i];
				if(i!=nodes.length-1){
					ids += tmpNode.id+",";
				}else{
					ids += tmpNode.id;
				}
			}
			var roleId = '${roleId}';
			var url = "role/saveRoleMenus.do";
			var postData;
			postData = {"roleId":roleId,"menuIds":ids};
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			$.post(url,postData,function(data){
				if(data.status != 200) {
					alert(data.msg);
				}
				top.Dialog.close();
			});
		 }	

	</script>
</body>
</html>