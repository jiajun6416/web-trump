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
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									编辑菜单
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="menu/${action}.do" name="menuForm" id="menuForm" method="post" class="form-horizontal">
							<input type="hidden" name="id" id="menuId" value="${menu.id}"/>
							<input type="hidden" name="parentId" value="${pId}">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上级 :</label>
								<div class="col-sm-9">
									<div style="padding-top:5px;">
										<div class="col-xs-4 label label-lg arrowed-in arrowed-right">
											<b>${pId == 0?'(无) 此项为顶级菜单':pName}</b>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="menuName" id="menuName" value="${menu.menuName }" placeholder="这里输入菜单名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 排序 : </label>
								<div class="col-sm-9">
									<input type="number" name="sort" id="menuOrder" value="${menu.sort}" placeholder="这里输入菜单序号" title="请输入正整数" class="col-xs-10 col-sm-5" />
								</div>
							</div>							
							<c:if test="${!menu.isParent}">
								<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 链接  :</label>
									<div class="col-sm-9">
										<input type="text" name="accessUrl" id="menuUrl" value="${menu.accessUrl}" placeholder="这里输入菜单链接" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> </label>
									<div class="col-sm-9">
										<div style="padding-top:0px;">
											<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
												<b>权限代码</b>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 查询 :</label>
									<div class="col-sm-9">
										<input type="text" name="premissionList[0].premissionCode" id="qeury_permission" value="" placeholder="这里输入代表权限名称" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 增加 :</label>
									<div class="col-sm-9">
										<input type="text" name="premissionList[1].premissionCode" id="add_permission" value="" placeholder="这里输入代表权限名称" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">修改 :</label>
									<div class="col-sm-9">
										<input type="text" name="premissionList[2].premissionCode" id="update_permission" value="" placeholder="这里输入代表权限名称" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 删除 :</label>
									<div class="col-sm-9">
										<input type="text" name="premissionList[3].premissionCode" id="delete_permission" value="" placeholder="这里输入代表权限名称" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 其他 :</label>
									<div class="col-sm-9">
										<input type="text" name="premissionList[4].premissionCode" id="other_permission" value="" placeholder="这里输入代表权限名称" class="col-xs-10 col-sm-5" />
									</div>
								</div>																																
							</c:if>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 状态 : </label>
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="status" type="radio" class="ace"  value="1" id="form-field-radio3" <c:if test="${menu.isShow}">checked="checked"</c:if>/>
										<span class="lbl"> 显示</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="status" type="radio" class="ace" id="form-field-radio4"  value="0" <c:if test="${!menu.isShow }">checked="checked"</c:if>"/>
										<span class="lbl"> 隐藏</span>
									</label>
								</div>
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="goback('${pId}');">取消</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
						</form>

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
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.serializejson.min.js"></script>
	<!-- inline scripts related to this page -->

	
	<script type="text/javascript">
		$(top.hangge());
		
		//返回
		function goback(pId){
			top.jzts();
			window.location.href="menu/"+pId;
		}
		
		//保存
		function save(){
			if($("#menuName").val()==""){
				$("#menuName").tips({
					side:3,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuName").focus();
				return false;
			}
			if($("#menuUrl").val()==""){
				$("#menuUrl").val('#');
			}
			//状态值为空默认为隐藏
			if($("#MENU_STATE").val()==""){
				$("#MENU_STATE").val(0);
			}
			if($("#menuOrder").val()==""){
				$("#menuOrder").tips({
					side:1,
		            msg:'请输入菜单序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuOrder").focus();
				return false;
			}
			if(isNaN(Number($("#menuOrder").val()))){
				$("#menuOrder").tips({
					side:1,
		            msg:'请输入菜单序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuOrder").focus();
				$("#menuOrder").val(1);
				return false;
			}
 			$.ajax({
				type:"POST",
				url:"menu/${action}.do",
				//serializeArray()转成json对象
				data:$("#menuForm").serializeArray(),
				dataType:'json',
				success: function(result) {
					if("success" == result.msg) {
						parent.location.href = "menu/listAllMenu?pId="+${pId};
					} else {
						alert(result.msg);
					}
				},
				error: function() {
					alert("未知错误!");
				}
			}) 
		}
	</script>


</body>
</html>