﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<!-- 检索  -->
						<form action="log/list" method="post" name="Form" id="Form">
							<input type="hidden" name="currentPage" id="currentPage" value="${params.currentPage}">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keyword" value="${params.keyword}" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="begimTime" id="lastStart"  value="${params.beginTime }" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="endTime" name="lastEnd"  value="${params.endTime }" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">用户名</th>
									<th class="center">IP</th>
									<th class="center">事件</th>
									<th class="center">操作时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty page.list}">
									<c:forEach items="${page.list}" var="log" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${log.id}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center' style="width: 150px;">${log.opearUser}</td>
											<td class="center" style="width: 150px">${log.ip}</td>
											<td class='center'>${log.event}</td>
											<td class='center' style="width: 180px;"><fmt:formatDate value="${log.opearTime}" pattern="yyyy/MM/dd HH:mm:SS"/></td>
											<td class="center" style="width: 50px;">
												<div class="hidden-sm hidden-xs btn-group">
													<a class="btn btn-xs btn-danger" onclick="del('${log.id}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																<a style="cursor:pointer;" onclick="del('${log.id}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
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
									<a class="btn btn-mini btn-danger" onclick="deleteCheck('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
								</td>
								<td style="vertical-align:top;">
									<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
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
									
									</div>
								</td>
							</tr>
						</table>
						</div>
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
	
		$("[name=rows]").children("[value='${params.rows}']").attr("selected", "selected");
		
		function changeRows() {
			$("#currentPage").val(1);
			tosearch();
		}
		
		function toPage(page) {
			if(page <= 1) {
				$("#currentPage").val(1);
			} else if(page > '${page.totalPage}'){
				$("#currentPage").val('${page.totalPage}');
			} else {
				$("#currentPage").val(page);
			}
			tosearch();
		}
		
		function toPageButton() {
			var page = $("#toGoPage").attr("value");
			alert(page);
			toPage(page);
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
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
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
				         type: "POST",
				         url: "log/delete",
				         data: {'logId':Id},
				         success: function(data){
				        	 if(data=="success") {
				        		 tosearch();
				        	 } else{
				        		 alert(data.msg);
				        		 tosearch();	
				        	 }
				         },
						 error:function() {
							 hangge();
							 alert("未知错误");
				 		 }
					});
				}
			});
		}
		
		//批量操作
		function deleteCheck(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: 'log/batchDelete',
						    	data: {logIds:str},
								cache: false,
								success: function(data){
						        	 if(data=="success") {
						        		 tosearch();
						        	 } else{
						        		 alert(data.msg);
						        		 tosearch();
						        	 }
						         },
								 error:function() {
									 hangge();
									 alert("未知错误");
						 		 }
							});
						}
					}
				}
			});
		};

		function toExcel() {
			var params  = $("#Form").serialize();
			window.location.href='<%=basePath%>log/excel.do?'+params;
		}
		
	</script>

</body>
</html>