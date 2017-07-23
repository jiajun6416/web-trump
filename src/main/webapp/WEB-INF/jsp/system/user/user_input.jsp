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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
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
								<form action="user/${action}.do" name="userForm" id="userForm" method="post">
									<input type="hidden" name="id" id="user_id" value="${user.id}"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">角色:</td>
											<c:choose>
												<c:when test="${msg != null && msg == 'editSelef'}">
													<td><input type="text" value="${user.role.roleName}" maxlength="32"style="width:98%;" readonly="readonly" /></td>
												</c:when>
												<c:otherwise>
													<td id="juese">
														<select class="chosen-select form-control" name="roleId" id="role_id" data-placeholder="请选择角色" style="vertical-align:top;" style="width:98%;" >
													<option value=""></option>
													<c:forEach items="${roleList}" var="role">
														<c:choose>
															<c:when test="${user != null && role.id == user.roleId}">
																<option value="${role.id}" selected="selected">${role.roleName}</option>
															</c:when>
															<c:otherwise>
																<option value="${role.id }">${role.roleName}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													</select>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户名:</td>
											<td><input type="text" name="username" id="loginname" value="${user.username}" maxlength="32" placeholder="这里输入用户名" title="用户名" style="width:98%;" onblur="hasU()"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">排序:</td>
											<td><input type="text" name="sort" id="NUMBER" value="${user.sort }" maxlength="32" placeholder="这里输入编号" title="编号" onblur="hasN('${user.sort}')" style="width:98%;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">密码:</td>
											<td><input type="password" name="password" id="password"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td>
											<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">姓名:</td>
											<td><input type="text" name="name" id="name"  value="${user.name}"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">手机号:</td>
											<td><input type="number" name="phone" id="PHONE"  value="${user.phone}"  maxlength="32" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">邮箱:</td>
											<td><input type="email" name="email" id="EMAIL"  value="${user.email }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${user.email}')" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
											<td><input type="text" name="remark" id="BZ"value="${user.remark}" placeholder="这里输入备注" maxlength="64" title="备注" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	//保存
	function save(){
		if($("#role_id").val()==""){
			$("#juese").tips({
				side:3,
	            msg:'选择角色',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#role_id").focus();
			return false;
		}
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		
		if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'输入序号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NUMBER").focus();
			return false;
		}else{
			$("#NUMBER").val($.trim($("#NUMBER").val()));
		}
		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	}
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasU(){
		var username = $.trim($("#loginname").val());
		var oldName = '${user.username}';
		if(oldName != null && username == oldName) return;
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasUsername.do',
	    	data: {"username":username},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.msg){
					 $("#loginname").tips({
							side:3,
				            msg:''+username+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#loginname").val("");
				 }
			}
		});
	}
	//判断邮箱是否存在
	function hasE(email){
		var newEmail = $.trim($("#EMAIL").val());
		if(newEmail == email) return;
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasEmail.do',
	    	data: {"email":newEmail},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.msg){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+newEmail+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val(email);
				 }
			}
		});
	}
	//判断排序是否存在
	function hasN(sort){
		var newSort = $.trim($("#NUMBER").val());
		if(newSort == sort) return ;
	    if(!/^[0-9]+$/.test(newSort)){
	    	$("#NUMBER").val(sort);
	    	return;
	    }
		
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasSort.do',
	    	data: {"sort":newSort},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.msg){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号 '+newSort+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#NUMBER").val(sort);
				 }
			}
		});
	}
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
</script>
</html>