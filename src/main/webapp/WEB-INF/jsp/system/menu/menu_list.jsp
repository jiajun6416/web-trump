 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
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
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center" style="width: 50px;">序号</th>
										<th class='center'>名称</th>
										<th class='center'>资源路径</th>
										<th class="center">权限名称</th>
										<th class="center" style="width: 50px;"> 排序</th>
										<th class='center' style="width: 50px;">状态</th>
										<th class='center' style="width: 120px;">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${not empty menuList}">
									<c:forEach items="${menuList}" var="menu" varStatus="vs">
									<tr>
										<td class='center'>${vs.count}</td>
										<td class='center'><i class="${menu.icon }">&nbsp;</i>
											<a href="javascript:goSonmenu('${menu.id}')">${menu.menuName}</a>
										</td>
										<c:choose>
											<c:when test="${menu.isParent }">
												<td align="center">/</td>
												<td align="center">/</td>
											</c:when>
											<c:otherwise>
												<td>${menu.accessUrl}</td>
												<td></td>
											</c:otherwise>
										</c:choose>
										<td>${menu.sort}</td>
										<td class='center'><i class="ace-icon fa ${menu.isShow ? 'fa-eye': 'fa-eye-slash'}"></i></td>
										<td class='center'>
											<div class="hidden-sm hidden-xs action-buttons">
												<a class="blue" href="javascript:editTb('${menu.id}');"> 
													<i class="ace-icon glyphicon glyphicon-picture bigger-130" title="编辑图标"></i>
												</a> 
												<a class="green" href="javascript:void(0);" onclick="editmenu('${menu.id}')">
													<i class="ace-icon fa fa-pencil-square-o bigger-130" title="修改"></i>
												</a>
												<a class="red" href="javascript:delmenu('${menu.id}');">
													<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
												</a>
											</div>
										</td>
									</tr>
									</c:forEach>
									</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100" class='center'>没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<div>
								&nbsp;&nbsp;
								<a class="btn btn-sm btn-success" onclick="addmenu('${pId}');">新增</a>
								<c:if test="${null != pId && pId != 0}">
									<a class="btn btn-sm btn-success" onclick="goSonmenu('${ppId}');">返回</a>
								</c:if>
							</div>
							
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<%@ include file="../index/foot.jsp"%>
</body>
	<script src="static/ace/js/bootbox.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		$(function() {
			top.hangge();
		});
		//编辑菜单
		function editmenu(menuId){
			top.jzts();
			window.location.href="<%=basePath%>menu/toEdit.do?menuId="+menuId;
		};
		//新增菜单
		function addmenu(){
			top.jzts();
			window.location.href="<%=basePath%>menu/toAdd.do?pId="+${pId};
		};
		
		//ecit icon
		function editTb(menuId) {
			 top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑图标";
			 diag.URL = '<%=basePath%>menu/toEditIcon.do?menuId='+menuId;
			 diag.Width = 800;
			 diag.Height = 380;
			//关闭事件, 页面刷新
			 diag.CancelEvent = function(){ 
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts(); 
					setTimeout("location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function delmenu(menuId) {
			bootbox.confirm("确定要删除此菜单吗?", function(result) {
				if(result) {
					$.ajax({
						type:'POST',
						url:"menu/delete",
						data:{"menuId":menuId},
						dataType:"json",
						success:function(result) {
							if("success" == result.msg) {
								//window.location.href = "menu/"+${pId};
								parent.location.href="menu/listAllMenu.do?pId="+${pId};
							} else {
								top.hangge();
								bootbox.dialog({
									message: "<span class='bigger-110'>删除失败,请先删除子菜单!</span>",
									buttons: 			
									{
										"button" :
										{
											"label" : "确定",
											"className" : "btn-sm btn-success"
										}
									}
								});
							}
						},
						error: function() {
							alert("未知错误");
						}
					
					})
				}
			});
		};
		function goSonmenu(menuId) {
			top.jzts();
			window.location.href="<%=basePath%>menu/"+menuId;		
		}
		
	</script>
</html>



















