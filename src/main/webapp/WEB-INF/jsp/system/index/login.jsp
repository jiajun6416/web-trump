<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>welcome to trump</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/css/camera.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="static/login/js/jquery-1.5.1.min.js"></script>

<!-- 软键盘控件start -->
<link href="static/login/keypad/css/framework/form.css" rel="stylesheet" type="text/css"/>
<!-- 软键盘控件end -->
 <style type="text/css">
    /*
   body{
    -webkit-transform: rotate(-3deg);
    -moz-transform: rotate(-3deg);
    -o-transform: rotate(-3deg);
	padding-top:20px;
    }
    */
      .cavs{
    	z-index:1;
    	position: fixed;
    	width:95%;
    	margin-left: 20px;
    	margin-right: 20px;
    }
  </style>
  <script>
  		//window.setTimeout(showfh,3000); 
  		var timer;
		function showfh(){
			fhi = 1;
			//关闭提示晃动屏幕，注释掉这句话即可
			timer = setInterval(xzfh2, 10); 
		};
		var current = 0;
		function xzfh(){
			current = (current)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current>360){current = 0;}
		};
		var fhi = 1;
		var current2 = 1;
		function xzfh2(){
			if(fhi>50){
				document.body.style.transform = 'rotate(0deg)';
				clearInterval(timer);
				return;
			}
			current = (current2)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current2 == 1){current2 = -1;}else{current2 = 1;}
			fhi++;
		};
	</script>
</head>
<body>

	<c:if test="${music == 'yes' }">
	<div style="display: none">
	    <audio src="static/login/music/fh1.mp3" autoplay="" loop=""></audio>
	</div>	
	</c:if>
	<canvas class="cavs"></canvas>
	<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<!-- 登录 -->
	<div id="windows1">
		<div id="loginbox" >
			<form action="" method="post" name="loginForm" id="loginForm">
				<div class="control-group normal_text">
					<h3>
						<!-- <img src="static/login/logo.png" alt="Logo" /> -->
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
								<i><img height="37" src="static/login/suo.png" /></i>
							</span>
							<!-- <input type="password" name="password" id="password" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/> -->
							<input type="password" name="password" id="password" placeholder="请输入密码" value=""/>
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:10%;">
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							 style="padding-top:0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

						<div style="float: left;padding-top:2px;">
							<i><img src="static/login/yan.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:4px;" />
						</div>
						<div style="float: left;">
							<i><img style="height:22px;" id="codeImg" alt="点击更换" title="点击更换" src="" /></i>
						</div>
						<span class="pull-right" ><a href="javascript:changepage(1);" class="btn btn-success">注册</a></span>
						<span class="pull-right"><a onclick="severCheck();" class="flip-link btn btn-info" id="to-recover">登录</a></span>
					</div>
				</div>
			</form>
			<div class="controls">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright © JAVA2017</span></font>
				</div>
			</div>
		</div>
		</div>
		<!-- 注册 -->
		<div id="windows2" style="display: none; ">
		<div id="loginbox">
			<form action="" method="post" name="loginForm" id="loginForm">
				<div class="control-group normal_text">
					<h3>
						<!-- <img src="static/login/logo.png" alt="Logo" /> -->
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i>用户</i>
							</span><input type="text" name="username" id="registUsername" value="" placeholder="请输入用户名" onblur="usernameCheck()"/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i>密码</i>
							<!-- </span><input type="password" name="PASSWORD" id="PASSWORD" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/> -->
							</span><input type="password" name="password" id="PASSWORD" placeholder="请输入密码"  value=""/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i>重输</i>
							<!-- </span><input type="password" name="chkpwd" id="chkpwd" placeholder="请重新输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/> -->
							</span><input type="password" name="chkpwd" id="chkpwd" placeholder="请重新输入密码" value=""/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i>姓名</i>
							</span><input type="text" name="name" id="name" value="" placeholder="请输入姓名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i>邮箱</i>
							</span><input type="text" name="email" id="registEmail" value="" placeholder="请输入邮箱" onblur="registEmailCheck()"/>
						</div>
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

						<div style="float: left;padding-top:2px;">
							<i><img src="static/login/yan.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="rcode" id="rcode" class="login_code"
								style="height:16px; padding-top:4px;" />
						</div>
						<div style="float: left;">
							<i><img style="height:22px;" id="zcodeImg" alt="点击更换" title="点击更换" src="" /></i>
						</div>
						<span class="pull-right" ><a href="javascript:changepage(2);" class="btn btn-success">取消</a></span>
						<span class="pull-right"><a onclick="register();" class="flip-link btn btn-info" id="to-recover">提交</a></span>
					</div>
				</div>
			</form>
			<div class="controls">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright © JAVA2100</span></font>
				</div>
			</div>
		</div>
		</div>
		
	</div>
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<!-- 背景图片 -->
					<div data-src="static/login/images/banner_slide_01.jpg"></div>
					<div data-src="static/login/images/banner_slide_02.jpg"></div>
					<div data-src="static/login/images/banner_slide_03.jpg"></div>
					<div data-src="static/login/images/banner_slide_05.jpg"></div>
			<!-- 暂时没有图片选择 -->
			<%-- <c:choose>
				<c:when test="${not empty pd.listImg}">
					<c:forEach items="${pd.listImg}" var="var" varStatus="vs">
						<div data-src="static/login/images/${var.FILEPATH }"></div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div data-src="static/login/images/banner_slide_01.jpg"></div>
					<div data-src="static/login/images/banner_slide_02.jpg"></div>
					<div data-src="static/login/images/banner_slide_03.jpg"></div>
					<div data-src="static/login/images/banner_slide_05.jpg"></div>
				</c:otherwise>
			</c:choose> --%>
		</div>
		<!-- #camera_wrap_3 -->
	</div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		changeCode1();
		$("#codeImg").bind("click", changeCode1);
		$("#zcodeImg").bind("click", changeCode2);
	});
	
	/* 可以使用enter出发登录, trigger表示登录建出发click事件 */
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$("#to-recover").trigger("click");
		}
	});

	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}

	function changeCode1() {
		$("#codeImg").attr("src", "checkCode/login?t="+ genTimestamp());
	}
	
	function changeCode2() {
		$("#zcodeImg").attr("src", "checkCode/regist?t="+ genTimestamp());
	}
	
	
	//登陆校验
	function check() {
		if ($("#loginname").val() == "") {
			$("#loginname").tips({
				side : 2,
				msg : '用户名不得为空',
				bg : '#AE81FF',
				time : 3
			});
			showfh();
			$("#loginname").focus();
			return false;
		} else {
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		if ($("#password").val() == "") {
			$("#password").tips({
				side : 2,
				msg : '密码不得为空',
				bg : '#AE81FF',
				time : 2
			});
			showfh();
			$("#password").focus();
			return false;
		}
		if ($("#code").val() == "") {
			$("#code").tips({
				side : 1,
				msg : '验证码不得为空',
				bg : '#AE81FF',
				time : 2
			});
			showfh();
			$("#code").focus();
			return false;
		}
		$("#loginbox").tips({
			side : 1,
			msg : '正在登录 , 请稍后 ...',
			bg : '#68B500',
			time : 2
		});
		return true;
	}

		//登陆
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				//密码加密
				var md5_passoword = $.md5(password);
				//remember
				var rememberMe = false;
				if($("#saveid").attr("checked")) {
					rememberMe = true;
				}
				var code = $("#code").val();
				$.ajax({
					type: "POST",
					url: 'login',
			    	data: {"username":loginname, "password":md5_passoword, "rememberMe":rememberMe, "code":code},
					dataType:'json',
					cache: false,
					success: function(data) {
						if(data.status == 200) {
							saveCookie();
							window.location.href="main/index";
						} else {
							changeCode1();
							if(data.status == 403) {
								$("#code").tips({
									side : 1,
									msg : "验证码输入有误",
									bg : '#FF5080',
									time : 3
								});
								showfh();
								$("#code").focus();
							} 
							if (data.status == 500){ 
								$("#loginname").tips({
									side : 1,
									msg : data.msg,
									bg : '#FF5080',
									time : 3
								});
								showfh();
								$("#loginname").focus();
							}
							
						}
					}
				});
			}
		}
	
			//保存密码
		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('username', $("#loginname").val(), {
					expires : 7, path:'/'
				});
				$.cookie('password', $("#password").val(), {
					expires : 7,path:'/'
				});
			} else { //不保存密码, 设置-1不生效, 和java中有点不一样
				$.cookie('loginname', $("#loginname").val(), {
					expires : 365, path:'/'
				});
				$.cookie('password', '', {
					expires : -1, path:'/'
				});
			}
		} 
		
		//进入页面的时候通过判断cookie是否为空来确定上次是否保存了cookie
 		jQuery(function() {
			var loginname = $.cookie('username');
			var password = $.cookie('password');
			if ( typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			} else {
				$("#loginname").val(loginname);
				$("#password").focus();
			}
		}); 
		
		//登录注册页面切换
		function changepage(value) {
			if(value == 1){
				$("#windows1").hide();
				$("#windows2").show();
				changeCode2();
			}else{
				$("#windows2").hide();
				$("#windows1").show();
				changeCode1();
			}
		}
		


	//注册
	
	//重名校验
	function usernameCheck() {
		var username = $("#registUsername").val().trim();
		lastInputName = username;
		if(username == '') {
			$("#registUsername").tips({
				side:3,
	            msg:'用户名不能为空',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#registUsername").focus();
			$("#registUsername").val('');
		} else {
			$.ajax({
				url:'<%=basePath%>user/hasUsername',
				method:'POST',
				data:{"username":username},
				cache:false,
				dataType:'json',
				success: function(data) {
					if(data.msg != "success") {
						$("#registUsername").tips({
							side:3,
				            msg:'用户名已经存在',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#registUsername").focus();
					}
				},
				error: function() {
					alert("服务器忙")
				}
			});
		}
	}
	
	//邮箱验证
	function registEmailCheck() {
		var email = $("#registEmail").val().trim();
		if(email == "") {
			$("#registEmail").tips({
				side:3,
	            msg:'邮箱不能为空',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#registEmail").focus();
			$("#registEmail").val() = '';
		} else if(!ismail(email)) {
			$("#registEmail").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#registEmail").focus();
		} else {
			$.ajax({
				url:'<%=basePath%>user/hasEmail',
				method:'POST',
				data:{"email":email},
				cache:false,
				dataType:'json',
				success: function(data) {
					if(data.msg != "success") {
						$("#registEmail").tips({
							side:3,
				            msg:'此邮箱已经存在',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#registEmail").focus();
					}
				},
				error: function() {
					alert("服务器忙")
				}
			});
		}	
	}
	
	function rcheck(){
		if($("#registUsername").val().trim()==""){
			$("#registUsername").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#registUsername").focus();
			$("#registUsername").val('');
			return false;
		}else{
			$("#USERNAME").val(jQuery.trim($('#USERNAME').val()));
		}
		if($("#PASSWORD").val()==""){
			$("#PASSWORD").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PASSWORD").focus();
			return false;
		}
		if($("#PASSWORD").val()!=$("#chkpwd").val()){
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
		if($("#registEmail").val()==""){
			$("#registEmail").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#registEmail").focus();
			return false;
		}else if(!ismail($("#registEmail").val())){
			$("#registEmail").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#registEmail").focus();
			return false;
		}
		if ($("#rcode").val() == "") {
			$("#rcode").tips({
				side : 1,
				msg : '验证码不得为空',
				bg : '#AE81FF',
				time : 3
			});
			$("#rcode").focus();
			return false;
		}
		return true;
	}
	
	//提交注册
	function register(){
		if(rcheck()){
			var password = $("#PASSWORD").val();
			//密码加密
			var md5_passoword = $.md5(password);
			$.ajax({
				type: "POST",
				url: '<%=basePath%>user/regist',
				//直接将form表单序列化成一个json字符串
				//data:$("[name=loginForm]").serializeArray(), 
		    	data: {"username":$("#registUsername").val(),"password":md5_passoword,"name":$("#name").val(),"email":$("#registEmail").val(),"checkCode":$("#rcode").val()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("200" == data.status){
						$("#windows2").hide();
						$("#windows1").show();
						$("#loginbox").tips({
							side : 1,
							msg : '注册成功,请登录',
							bg : '#68B500',
							time : 3
						});
						changeCode1();
					}else if("403" == data.status){
						$("#USERNAME").tips({
							side : 1,
							msg : "用户名已存在",
							bg : '#FF5080',
							time : 15
						});
						showfh();
						$("#USERNAME").focus();
					}else if("400" == data.status){
						$("#rcode").tips({
							side : 1,
							msg : "验证码输入有误",
							bg : '#FF5080',
							time : 15
						});
						showfh();
						$("#rcode").focus();
					}
				}
			});
		}
	}
	
	//邮箱格式校验
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	//js  日期格式
	function date2str(x,y) {
	     var z ={y:x.getFullYear(),M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
	     return y.replace(/(y+|M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-(v.length>2?v.length:2))});
	 	};
	</script>
	
	
	<script type="text/javascript">
		if (window != top) {
			top.location.href = location.href; //保证是顶层显示,当服务重启或者被踢出的时候可以顶层显示
		}
	</script>
	
	<script src="static/login/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script src="static/login/js/ban.js"></script>
	<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	
	<!-- 软键盘控件start -->
	<script type="text/javascript" src="static/login/keypad/js/form/keypad.js"></script>
	<script type="text/javascript" src="static/login/keypad/js/framework.js"></script>
	<!-- 软键盘控件end -->
</body>

</html>