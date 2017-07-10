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
							<table style="margin-top: 8px;">
								<tr height="35">
									<td style="width:69px;"><a href="javascript:addRoleType(0);" class="btn btn-sm btn-success">新增组</a></td>
										<c:choose>
										<c:when test="${not empty roleTypes }">
										<c:forEach items="${roleTypes}" var="role" varStatus="vs">
											<td style="width:100px;" class="center" <c:choose><c:when test="${role.roleType == roleType}">bgcolor="#FFC926" onMouseOut="javascript:this.bgColor='#FFC926';"</c:when><c:otherwise>bgcolor="#E5E5E5" onMouseOut="javascript:this.bgColor='#E5E5E5';"</c:otherwise></c:choose>  onMouseMove="javascript:this.bgColor='#FFC926';" >
												<a href="role/list.do?roleType=${role.roleType}" style="text-decoration:none; display:block;"><i class="menu-icon fa fa-users"></i><font color="#666666">${role.roleName}</font></a>
											</td>
											<td style="width:5px;"></td>
										</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100">没有相关数据</td>
											</tr>
										</c:otherwise>
										</c:choose>
									<td></td>
								</tr>
							</table>
							<p><p/>
							<table >
								<tr height="7px;"><td colspan="100"></td></tr>
								<tr>
								<td><font color="#808080">本组：</font></td>
								<td>
								<a class="btn btn-mini btn-info" onclick="editRoleType();">修改组信息<i class="icon-arrow-right  icon-on-right"></i></a>
									<a class="btn btn-mini btn-purple" onclick="editMaxRights();">
										<i class="icon-pencil"></i>
										组允许最大菜单
									</a>
									<c:if test="${roleType != 1 && roleType != 2}">
										<a class='btn btn-mini btn-danger' title="删除" onclick="delRoleType()">
											<i class='ace-icon fa fa-trash-o bigger-130'></i>
										</a>
									</c:if>
								</td>
								</tr>
							</table>
							
							<table id="dynamic-table" class="table table-striped table-bordered table-hover" style="margin-top:7px;">
								<thead>
								<tr>
									<th class="center" style="width: 50px;">序号</th>
									<th class='center'>角色</th>
									<th class='center'>排序</th>
									<th class="center">增</th>
									<th class="center">删</th>
									<th class="center">改</th>
									<th class="center">查</th>
									<th style="width:155px;"  class="center">操作</th>
								</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty roleList}">
										<c:forEach items="${roleList}" var="role" varStatus="vs">
										<tr>
											<td class='center' style="width:30px;">${vs.count}</td>
											<td id="ROLE_NAMETd${role.id }" class='center'>${role.roleName}</td>
											<td class='center' width="8%">${role.sort}</td>
											<td style="width:30px;"><a onclick="roleButton('${role.id}','add_qx');" class="btn btn-warning btn-mini" title="分配新增权限"><i class="ace-icon fa fa-wrench bigger-110 icon-only"></i></a></td>
											<td style="width:30px;"><a onclick="roleButton('${role.id}','del_qx');" class="btn btn-warning btn-mini" title="分配删除权限"><i class="ace-icon fa fa-wrench bigger-110 icon-only"></i></a></td>
											<td style="width:30px;"><a onclick="roleButton('${role.id}','edit_qx');" class="btn btn-warning btn-mini" title="分配修改权限"><i class="ace-icon fa fa-wrench bigger-110 icon-only"></i></a></td>
											<td style="width:30px;"><a onclick="roleButton('${role.id}','cha_qx');" class="btn btn-warning btn-mini" title="分配查看权限"><i class="ace-icon fa fa-wrench bigger-110 icon-only"></i></a></td>
											<td style="width:155px;">
											<!-- <div style="width:100%;" class="center">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
											</div> -->
												<a class="btn btn-mini btn-purple" onclick="editRights('${role.id}');"><i class="icon-pencil"></i>菜单权限</a>
												<a class='btn btn-mini btn-info' title="编辑" onclick="editRole('${role.id}');"><i class='ace-icon fa fa-pencil-square-o bigger-130'></i></a>
 												<a class='btn btn-mini btn-danger' title="删除" onclick="delRole('${role.id}','${role.roleName }');"><i class='ace-icon fa fa-trash-o bigger-130'></i></a>
											</td>
										</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
										<td colspan="100" class="center" >没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div>
								&nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="addRole('${roleType}');">新增角色</a>
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		
		//新增组
		function addRoleType(roleType){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>role/toAddRoleType.do?roleType='+roleType;
			 diag.Width = 250;
			 diag.Height =150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts();
					//弹出新窗口之后, 关闭刷新原页面
					setTimeout("self.location.reload()",100);
				 }
				diag.close();
			 };
			 diag.show();
		}
		//修改组名称
		function editRoleType() {
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改组名";
			 diag.URL = '<%=basePath%>role/toEditRoleType.do?roleType='+${roleType};
			 diag.Width = 250;
			 diag.Height =150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts();
					//弹出新窗口之后, 关闭刷新原页面
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除角色组
		function delRoleType() {
			bootbox.confirm("确定要删除改角色组吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						url:"<%=basePath%>role/deleteType.do",
						data:{"roleType":'${roleType}',"time":new Date().getTime()},
						dataType:'json',
						success: function(data) {
							if('success' == data.msg) {
								top.jzts();
								//document.location.reload();
								window.location.href='<%=basePath%>role/list.do?roletype=1';
							} else {
								top.hangge();
								bootbox.dialog({
									message: "<span class='bigger-110'>"+data.msg+"</span>",
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
							alert("未知错误!");
						}
					})
				}
			});
		}
		
		//添加角色
		function addRole(roleType){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>role/toAdd.do?roleType='+roleType;
			 diag.Width = 250;
			 diag.Height =150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts();
					//弹出新窗口之后, 关闭刷新原页面
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		//修改角色
		function editRole(roleId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>role/toEdit.do?roleId='+roleId;
			 diag.Width = 250;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts();
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除角色
		function delRole(roleId,roleName){
			bootbox.confirm("确定要删除["+roleName+"]吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						url:"<%=basePath%>role/delete.do?roleId="+roleId+"&guid="+new Date().getTime(),
						dataType:'json',
						success: function(data) {
							if('success' == data.msg) {
								top.jzts();
								document.location.reload();
							} else {
								top.hangge();
								bootbox.dialog({
									message: "<span class='bigger-110'>"+data.msg+"</span>",
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
							alert("未知错误!");
						}
					})
				}
			});
		}
		
		//角色类别最大权限
		function editMaxRights(){
			// top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "菜单权限";
			 diag.URL = '<%=basePath%>role/maxMenuList.do?roleType='+${roleType};
			 diag.Width = 320;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//菜单权限
		function editRights(roleId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "菜单权限";
			 diag.URL = '<%=basePath%>role/menuList.do?roleId='+roleId;
			 diag.Width = 320;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//按钮权限(增删改查)
		function roleButton(ROLE_ID,msg){
			top.jzts();
			if(msg == 'add_qx'){
				var Title = "授权新增权限(此角色下打勾的菜单拥有新增权限)";
			}else if(msg == 'del_qx'){
				Title = "授权删除权限(此角色下打勾的菜单拥有删除权限)";
			}else if(msg == 'edit_qx'){
				Title = "授权修改权限(此角色下打勾的菜单拥有修改权限)";
			}else if(msg == 'cha_qx'){
				Title = "授权查看权限(此角色下打勾的菜单拥有查看权限)";
			}
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = Title;
			 diag.URL = '<%=basePath%>role/b4Button.do?ROLE_ID='+ROLE_ID+'&msg='+msg;
			 diag.Width = 330;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
	</script>

</body>
</html>