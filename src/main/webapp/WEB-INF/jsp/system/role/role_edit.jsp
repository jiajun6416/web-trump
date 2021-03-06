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
						<form action="role/${action}.do" name="form1" id="form1"  method="post">
						<input type="hidden" name="id" id="id" value="${role.id}"/>
						<input name="roleType" id="roleType" value="${roleType}" type="hidden">
							<div id="zhongxin" style="padding-top:13px;">
							<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-1">   </label>
								<div class="col-sm-9">
									<input type="text" name="roleName" id="roleName" value="${role.roleName}" placeholder="这里输入角色名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-1">  </label>
								<div class="col-sm-9">
									<input type="number" name="sort" id="sort" value="${role.sort}" placeholder="这里输入角色序号" title="请输入正整数" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<br/>
							<div class="clearfix " style="margin-top: 10px;margin-left: 50px;">
								<div>
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
							</div>
						</form>
					
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>

					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	top.hangge();
	//保存
	function save(){
		if($("#roleName").val()==""){
			$("#roleName").tips({
				side:3,
	            msg:'请输入',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#roleName").focus();
			return false;
		}
		if($("#sort").val() == "") {
			$("#sort").tips({
				side:3,
	            msg:'请输入',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#sort").focus();
			return false;
		}
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	
	</script>
</body>
</html>

