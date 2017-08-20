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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="static/ace/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
<!-- page specific plugin styles -->
<!-- text fonts -->
<link rel="stylesheet" href="static/ace/css/ace-fonts.css" />
<!-- ace styles -->
<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
<!--[if lte IE 9]>
	<link rel="stylesheet" href="static/ace/css/ace-part2.css" class="ace-main-stylesheet" />
<![endif]-->
<!--[if lte IE 9]>
  <link rel="stylesheet" href="static/ace/css/ace-ie.css" />
<![endif]-->
<!-- inline styles related to this page -->
<!-- ace settings handler -->
<script src="static/ace/js/ace-extra.js"></script>
<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
<!--[if lte IE 8]>
<script src="static/ace/js/html5shiv.js"></script>
<script src="static/ace/js/respond.js"></script>
<![endif]-->
<!--查看图片插件 -->
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/custom.css" />
<script type="text/javascript" src="plugins/zoomimage/js/jquery.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/eye.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/utils.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/zoomimage.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/layout.js"></script>
<!--查看图片插件 -->
</head>
<body class="no-skin">
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
					<!-- 检索  -->
					<form action="picture/list" method="post" name="Form" id="Form">
					<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"> 
					<table style="margin-top:5px;">
						<tr>
							<td>
								<div class="nav-search">
								<span class="input-icon">
									<input autocomplete="off" class="nav-search-input"  id="nav-search-input" type="text" name="keyword"  value="${params.keyword}" placeholder="这里输入关键词" />
								</span>
								</div>
							</td>
							<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
						</tr>
					</table>
					<!-- 检索  -->
					<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:0px;">
						<thead>
							<tr>
								<th class="center" onclick="selectAll()" style="width:35px;">
								<label><input type="checkbox" id="zcheckbox" class="ace" /><span class="lbl"></span></label>
								</th>
								<th class="center" style="width:50px;">序号</th>
								<th class="center" >图片</th>
								<th class="center" >描述</th>
								<th class="center">类型</th>
								<th class="center" >创建时间</th>
								<th class="center">操作</th>
							</tr>
						</thead>
						<tbody>
						<!-- 开始循环 -->	
						<c:choose>
							<c:when test="${not empty page.list}">
								<c:forEach items="${page.list}" var="picture" varStatus="vs">
									<tr>
										<td class='center' style="width: 30px;">
											<label><input type='checkbox' name='ids' class="ace" value="${picture.id}" /><span class="lbl"></span></label>
										</td>
										<td class='center' style="width: 30px;">${vs.count}</td>
										<td class="center">
										<a href="<%=basePath%>${picture.path}" title="" class="bwGal"><img src="<%=basePath%>${picture.path}" " width="100"></a>
										</td>
										<td class="center">${picture.pictureDesc}</td>
										<td class="center">${picture.typeView}</td>
										<td class="center"><fmt:formatDate value="${picture.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/> </td>
										<td class="center" style="width:130px;">
											<a style="cursor:pointer;" class="green" onclick="edit('${picture.id}');" title="编辑">
												<i class="ace-icon fa fa-pencil bigger-130"></i>
											</a>
											&nbsp;
											<a style="cursor:pointer;" class="red" onclick="del('${picture.id}');" title="删除">
												<i class="ace-icon fa fa-trash-o bigger-130"></i>
											</a>
										</td>
									</tr>
								
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="100" class="center" >没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					
				<div class="page-header position-relative">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align:top;">
							<a class="btn btn-sm btn-success" onclick="add();">新增</a>
							<a title="批量删除" class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
						</td>
						<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
															<!-- 分页-->
										<ul class="pagination pull-right no-margin">
											<li><a>共<font color=red></font>${page.count}条</a></li>
											<li><input type="number" value="" id="toGoPage" style="width:50px;text-align:center;float:left" placeholder="页码"/></li>
											<li style="cursor:pointer;"><a onclick="toPageButton();"  class="btn btn-mini btn-success">跳转</a></li>
											<li><a href="javascript:void(0)" onclick="toPage(1)">首页</a></li>
											<li><a href="javascript:void(0)" onclick="toPage(${page.currentPage-1})">上页</a></li>
											<li class="active"><a><font color='white'>${page.currentPage}</font></a></li>
											<li><a href="javascript:void(0)" onclick="toPage(${page.currentPage+1})">下页</a></li>
											<li><a href="javascript:void(0)" onclick="toPage(${page.totalPage})">尾页</a></li>
											<li><a>共${page.totalPage}页</a></li>
											<li><select title='显示条数' name="rows" style="width:55px;float:left;margin-top:1px;" onchange="changeRows()">
													<option value='10'>10</option>
													<option value='20'>20</option>
													<option value='30'>30</option>
													<option value='40'>40</option>
													<option value='50'>50</option>
													<option value='60'>60</option>
													<option value='70'>70</option>
													<option value='80'>80</option>
													<option value='90'>90</option>
												</select>
											</li>
										</ul>
						</div></td>
					</tr>
				</table>
				</div>
				</form>
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	</body>
	<script type="text/javascript">
		$(top.hangge());

		function toPage(pageNum) {
			var currentPage;
			if(pageNum <= 0 ) {
				currentPage = 1;
			} else if(pageNum >= '${page.count}') {
				currentPage = page.count;
			} else {
				currentPage = pageNum;
			}
			$("#currentPage").val(currentPage); 
			$("form:first").submit();
		}
		
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>picture/toAdd.do';
			 diag.Width = 800;
			 diag.Height = 490;
			 diag.CancelEvent = function(){ //关闭事件
				 top.jzts();
				 setTimeout("self.location=self.location",100);
				/*  if('${page.currentPage}' == '0'){
				 }else{
					 nextPage(${page.currentPage});
				 } */
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(id){
			if(confirm("确定要删除?")){ 
				top.jzts();
				var url = "<%=basePath%>picture/delete.do?pictureId="+id+"&tm="+new Date().getTime();
				$.get(url,function(data){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				//	nextPage(${page.currentPage});
				});
			}
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>pictures/goEdit.do?PICTURES_ID='+Id;
			 diag.Width = 600;
			 diag.Height = 465;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					// nextPage(${page.currentPage});
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				 }
				diag.close();
			 };
			 diag.show();
		}
		
		//全选 （是/否）
		function selectAll(){
			 var checklist = document.getElementsByName ("ids");
			   if(document.getElementById("zcheckbox").checked){
			   for(var i=0;i<checklist.length;i++){
			      checklist[i].checked = 1;
			   } 
			 }else{
			  for(var j=0;j<checklist.length;j++){
			     checklist[j].checked = 0;
			  }
			 }
		}
		//批量操作
		function makeAll(msg){
			if(confirm(msg)){ 
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						alert("您没有选择任何内容!"); 
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>picture/deleteAll.do?tm='+new Date().getTime(),
						    	data: {pictureIds:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 top.jzts();
									 setTimeout("self.location=self.location",100);
								}
							});
						}
					}
			}
		}
	</script>
	<style type="text/css">
	li {list-style-type:none;}
	</style>
	<ul class="navigationTabs">
           <li><a></a></li>
           <li></li>
       </ul>
</html>

