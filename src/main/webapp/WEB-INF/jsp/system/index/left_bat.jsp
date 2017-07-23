<!-- 左侧菜单 -->
			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						
						<button class="btn btn-info" onclick="changeMenus();" title="切换菜单">
							<i class="ace-icon fa fa-pencil"></i>
						</button>
						
						<button class="btn btn-success" title="UI实例" onclick="window.open('static/html_UI/html');">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning" title="" id="adminzidian">
							<i class="ace-icon fa fa-book"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
				
					<li class="">
						<a href="main/index">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text">后台首页</span>
						</a>
						<b class="arrow"></b>
					</li>

					<li class=""  id="lm1">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop blue"></i>
							<span class="menu-text">
								系统管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="" id="z2">
								<a style="cursor:pointer;"  class="dropdown-toggle">
									<i class="menu-icon fa fa-lock black"></i>
										权限管理
									<b class="arrow fa fa-angle-down"></b>
								</a>
								<b class="arrow"></b>
								
								<ul class="submenu">
										<li class="" id="m36">
											<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('m36','z2','角色(基础权限)','role/list.do?roleType')">
												<i class="menu-icon fa fa-key orange"></i>
													角色(基础权限)
											</a>
											<b class="arrow"></b>
										</li>
									
										<li class="" id="m37">
											<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('m37','z2','按钮权限','role/operation/list.do')">
												<i class="menu-icon fa fa-key green"></i>
													按钮权限
											</a>
											<b class="arrow"></b>
										</li>
								</ul>
							</li>
							<li class="" id="z39">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z39','lm1','按钮管理','operation/list.do')">
									<i class="menu-icon fa fa-download orange"></i>
										按钮管理
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z38">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z38','lm1','菜单管理','menu/listAllMenu.do')">
									<i class="menu-icon fa fa-folder-open-o brown"></i>
										菜单管理
								</a>
								<b class="arrow"></b>
								
							</li>
							<li class="" id="z43">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z43','lm1','数据字典','dictionaries/listAllDict.do?DICTIONARIES_ID=0')">
									<i class="menu-icon fa fa-book purple"></i>
										数据字典
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z20">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z20','lm1','在线管理','onlinemanager/list.do')">
									<i class="menu-icon fa fa-laptop green"></i>
										在线管理
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z3">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z3','lm1','日志管理','log/list')">
									<i class="menu-icon fa fa-book blue"></i>
										日志管理
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class=""  id="lm40">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-users blue"></i>
							<span class="menu-text">
								用户管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
						
							
							<li class="" id="z41">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z41','lm40','系统用户','user/listUser')">
									<i class="menu-icon fa fa-users green"></i>
										系统用户
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z42">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z42','lm40','会员管理','happuser/listUsers.do')">
									<i class="menu-icon fa fa-users orange"></i>
										会员管理
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class=""  id="lm9">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-cog black"></i>
							<span class="menu-text">
								系统工具
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
							<li class="" id="z44">
								<a style="cursor:pointer;"  class="dropdown-toggle">
									<i class="menu-icon fa fa-cogs brown"></i>
										代码生成器
									<b class="arrow fa fa-angle-down"></b>
								</a>
								<b class="arrow"></b>
								
								<ul class="submenu">
										<li class="" id="m62">
											<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('m62','z44','正向生成','createCode/list.do')">
												<i class="menu-icon fa fa-cogs green"></i>
													正向生成
											</a>
											<b class="arrow"></b>
										</li>
										<li class="" id="m63">
											<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('m63','z44','反向生成','recreateCode/list.do')">
												<i class="menu-icon fa fa-cogs blue"></i>
													反向生成
											</a>
											<b class="arrow"></b>
										</li>
								</ul>
							</li>
							<li class="" id="z53">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z53','lm9','表单构建器','tool/goFormbuilder.do')">
									<i class="menu-icon fa fa-credit-card green"></i>
										表单构建器
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z10">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z10','lm9','接口测试','tool/interfaceTest.do')">
									<i class="menu-icon fa fa-exchange green"></i>
										接口测试
								</a>
								<b class="arrow"></b>
								
							</li>
							<li class="" id="z11">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z11','lm9','发送邮件','tool/goSendEmail.do')">
									<i class="menu-icon fa fa-envelope-o green"></i>
										发送邮件
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z12">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z12','lm9','置二维码','tool/goTwoDimensionCode.do')">
									<i class="menu-icon fa fa-barcode green"></i>
										置二维码
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z48">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z48','lm9','图表报表',' tool/fusionchartsdemo.do')">
									<i class="menu-icon fa fa-bar-chart-o black"></i>
										图表报表
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z14">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z14','lm9','地图工具','tool/map.do')">
									<i class="menu-icon fa fa-globe black"></i>
										地图工具
								</a>
								<b class="arrow"></b>
								
							</li>
							<li class="" id="z21">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z21','lm9','打印测试','tool/printTest.do')">
									<i class="menu-icon fa fa-hdd-o grey"></i>
										打印测试
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="z8">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z8','lm9','性能监控','druid/index.html')">
									<i class="menu-icon fa fa-tachometer red"></i>
										性能监控
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				
				
				
					<li class=""  id="lm15">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-comments purple"></i>
							<span class="menu-text">
								微信管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
						
							
							<li class="" id="z19">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z19','lm15','关注回复','textmsg/goSubscribe.do')">
									<i class="menu-icon fa fa-comment orange"></i>
										关注回复
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z16">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z16','lm15','文本回复','textmsg/list.do')">
									<i class="menu-icon fa fa-comment green"></i>
										文本回复
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z18">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z18','lm15','图文回复','imgmsg/list.do')">
									<i class="menu-icon fa fa-comment pink"></i>
										图文回复
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z17">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z17','lm15','应用命令','command/list.do')">
									<i class="menu-icon fa fa-comment grey"></i>
										应用命令
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
						</ul>
						
					</li>
				
				
				
					<li class=""  id="lm6">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-credit-card green"></i>
							<span class="menu-text">
								信息管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
						
							
							<li class="" id="z7">
								<a style="cursor:pointer;"  class="dropdown-toggle">
									<i class="menu-icon fa fa-folder-o blue"></i>
										图片管理
									<b class="arrow fa fa-angle-down"></b>
								</a>
								<b class="arrow"></b>
								
								<ul class="submenu">
										<li class="" id="m54">
											<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('m54','z7','图片列表','pictures/list.do')">
												<i class="menu-icon fa fa-leaf green"></i>
													图片列表
											</a>
											<b class="arrow"></b>
										</li>
										<li class="" id="m55">
											<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('m55','z7','图片爬虫','pictures/goImageCrawler.do')">
												<i class="menu-icon fa fa-cloud-download green"></i>
													图片爬虫
											</a>
											<b class="arrow"></b>
										</li>
								</ul>
								
							</li>
							
						
							
							<li class="" id="z61">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z61','lm6','主附结构','attached/list.do')">
									<i class="menu-icon fa fa-folder-open blue"></i>
										主附结构
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z50">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z50','lm6','站内信','fhsms/list.do')">
									<i class="menu-icon fa fa-envelope green"></i>
										站内信
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
						
							
							<li class="" id="z4">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z4','lm6','下拉联动','linkage/view.do')">
									<i class="menu-icon fa fa-exchange green"></i>
										下拉联动
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
						</ul>
						
					</li>
				
				
				
					<li class=""  id="lm51">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-laptop green"></i>
							<span class="menu-text">
								OA办公
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
						
							
							<li class="" id="z52">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z52','lm51','组织机构','department/listAllDepartment.do?DEPARTMENT_ID=0')">
									<i class="menu-icon fa fa-users green"></i>
										组织机构
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z65">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z65','lm51','员工管理','staff/list.do')">
									<i class="menu-icon fa fa-users blue"></i>
										员工管理
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z5">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z5','lm51','文件管理','fhfile/list.do')">
									<i class="menu-icon fa fa-folder-open purple"></i>
										文件管理
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
						</ul>
						
					</li>
				
				
				
					<li class=""  id="lm56">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-hdd-o pink"></i>
							<span class="menu-text">
								数据库管理
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
						
							
							<li class="" id="z57">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z57','lm56','数据库备份','brdb/listAllTable.do')">
									<i class="menu-icon fa fa-cloud-upload blue"></i>
										数据库备份
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z58">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z58','lm56','备份定时器','timingbackup/list.do')">
									<i class="menu-icon fa fa-tachometer purple"></i>
										备份定时器
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z59">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z59','lm56','数据库还原','brdb/list.do')">
									<i class="menu-icon fa fa-cloud-download orange"></i>
										数据库还原
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
							
							<li class="" id="z60">
								<a style="cursor:pointer;" target="mainFrame" onclick="siMenu('z60','lm56','SQL编辑器','sqledit/view.do')">
									<i class="menu-icon fa fa-pencil-square-o green"></i>
										SQL编辑器
									
								</a>
								<b class="arrow"></b>
								
							</li>
							
						
						</ul>
						
					</li>
				
				
				
					<li class=""  id="lm22">
						<a style="cursor:pointer;" class="dropdown-toggle">
							<i class="menu-icon fa fa-fire orange"></i>
							<span class="menu-text">
								一级菜单
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						
						<ul class="submenu">
						
							
							<li class="" id="z23">
								<a style="cursor:pointer;"  class="dropdown-toggle">
									<i class="menu-icon fa fa-leaf black"></i>
										二级菜单
									<b class="arrow fa fa-angle-down"></b>
								</a>
								<b class="arrow"></b>
								
								<ul class="submenu">
										<li class="" id="m24">
											<a style="cursor:pointer;"  class="dropdown-toggle">
												<i class="menu-icon fa fa-leaf black"></i>
													三级菜单
												<b class="arrow fa fa-angle-down"></b>
											</a>
											<b class="arrow"></b>
	
											
											<ul class="submenu">
												
												
												<li class="" id="n30">
													
													<a style="cursor:pointer;" target="mainFrame" target="mainFrame" onclick="siMenu('n30','m24','四级菜单','menu/otherlistMenu.do?MENU_ID=30')">
														<i class="menu-icon fa fa-leaf black"></i>
														四级菜单
													</a>
													<b class="arrow"></b>
												</li>
												<li class="" id="n35">
													<a style="cursor:pointer;" target="mainFrame" target="mainFrame" onclick="siMenu('n35','m24','四级菜单2','login_default.do')">
													
														<i class="menu-icon fa fa-leaf black"></i>
														四级菜单2
													</a>
													<b class="arrow"></b>
												</li>
												
												
											</ul>
											
										</li>
										
									
								</ul>
								
							</li>
							
						
						</ul>
						
					</li>
				
				

				</ul><!-- /.nav-list -->


				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>