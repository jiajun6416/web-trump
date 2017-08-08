var locat = (window.location+'').split('/');
var wsPath;
//获得项目的根路径
$(function(){
	if('main'== locat[3]){
		wsPath = "ws://" + locat[2];
		locat =  locat[0]+'//'+locat[2];
	}else{
		wsPath = "ws://"+locat[2]+'/'+locat[3];
		locat =  locat[0]+'//'+locat[2]+'/'+locat[3];
	};
});

var fmid = "fhindex";	//菜单点中状态
var mid = "fhindex";	//菜单点中状态
var fhsmsCount = 0;		//站内信总数
var USER_ID;			//用户ID
var user = "FH";		//用于即时通讯（ 当前登录用户）
var TFHsmsSound = '1';	//站内信提示音效
var wimadress="";		//即时聊天服务器IP和端口

//菜单切换
function siMenu(id,fid,MENU_NAME,MENU_URL){
	//不是上次选中
	if(id != mid){
		$("#"+mid).removeClass();
		mid = id;
	}
	//父节点不是上次的
	if(fid != fmid){
		$("#"+fmid).removeClass();
		fmid = fid;
	}
	//父节点是打开状态
	$("#"+fid).attr("class","active open");
	//当前节点是活跃状态
	$("#"+id).attr("class","active");
	top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
	if(MENU_URL != "druid/index.html"){
		jzts();
	}
}

$(function(){
//	getHeadMsg();	//初始页面最顶部信息
	 online();	//用户上线, 连接websocket
});


//初始页面信息
function getHeadMsg(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getList.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			 $.each(data.list, function(i, list){
				 $("#user_info").html('<small>Welcome</small> '+list.NAME+'');//登陆者资料
				 user = list.USERNAME;
				 USER_ID = list.USER_ID;		//用户ID
				 if(list.USERNAME != 'admin'){
					 $("#systemset").hide();	//隐藏系统设置
				 }
			 });
			 updateUserPhoto(data.userPhoto);			//用户头像
			 fhsmsCount = Number(data.fhsmsCount);
			 $("#fhsmsCount").html(Number(fhsmsCount));	//站内信未读总数
			 TFHsmsSound = data.FHsmsSound;				//站内信提示音效
			 wimadress = data.wimadress;				//即时聊天服务器IP和端口
			 oladress = data.oladress;					//在线管理和站内信服务器IP和端口
			 online();									//连接在线
		}
	});
}
//获取站内信未读总数(在站内信删除未读新信件时调用此函数更新未读数)
function getFhsmsCount(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getFhsmsCount.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		cache: false,
		success: function(data){
			 fhsmsCount = Number(data.fhsmsCount);
			 $("#fhsmsCount").html(Number(fhsmsCount));	//站内信未读总数
		}
	});
}


var onlineWebsocket;			//websocket对象
var onlineWsUrl="/ws/online";		//在线管理和站内信服务器IP和端口

window.onbeforeunload = function(){
	if(onlineWebsocket != null) {
		onlineWebsocket.close();
		onlineWebsocket = null;
	}
}
//加入在线列表
 function online(){
	if (window.WebSocket) {
		onlineWebsocket = new WebSocket(encodeURI(wsPath+onlineWsUrl)); //onlineWsUrl在main.jsp页面定义
		onlineWebsocket.onopen = function() {
		};
		onlineWebsocket.onerror = function() {
			//连接失败
			alert("online websocket error!");
		};
		onlineWebsocket.onclose = function() {
			//连接断开
		};
		//消息接收
		onlineWebsocket.onmessage = function(message) {
			var msg = JSON.parse(message.data);
			if(msg.type == 1) {
				alert("已在其他地方登录");
				goOut();
			}
			/*			var message = JSON.parse(message.data);
			if(message.type == 'goOut'){
				$("body").html("");
				goOut("1");
			}else if(message.type == 'thegoout'){
				$("body").html("");
				goOut("2");
			}else if(message.type == 'senFhsms'){
				fhsmsCount = Number(fhsmsCount)+1;
				$("#fhsmsCount").html(Number(fhsmsCount));
				$("#fhsmsobj").html('<audio style="display: none;" id="fhsmstsy" src="static/sound/'+TFHsmsSound+'.mp3" autoplay controls></audio>');
				$("#fhsmstss").tips({
					side:3,
		            msg:'有新消息',
		            bg:'#AE81FF',
		            time:30
		        });
			}*/
		};
	}
}

//下线
function goOut(){
	window.location.href=locat+"/logout";
}

//去通知收信人有站内信接收
function fhsmsmsg(USERNAME){
	var arrUSERNAME = USERNAME.split(';');
	for(var i=0;i<arrUSERNAME.length;i++){
		websocket.send('[fhsms]'+arrUSERNAME[i]);//发送通知
	}
}

//读取站内信时减少未读总数
function readFhsms(){
	fhsmsCount = Number(fhsmsCount)-1;
	$("#fhsmsCount").html(Number(fhsmsCount) <= 0 ?'0':fhsmsCount);
}

//修改头像
function editPhoto(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改头像";
	 diag.URL = locat+'/head/editPhoto.do';
	 diag.Width = 650;
	 diag.Height = 530;
	 diag. ShowMaxButton = true;	//最大化按钮
     diag.ShowMinButton = true;		//最小化按钮
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//修改个人资料
function editMyself(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人资料";
	 diag.URL = locat+'/user/toEditMyself';
	 diag.Width = 486;
	 diag.Height = 560;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//系统设置
function editSys(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="系统设置";
	 diag.URL = locat+'/head/goSystem.do';
	 diag.Width = 600;
	 diag.Height = 526;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//站内信
function fhsms(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="站内信";
	 diag.URL = locat+'/fhsms/list.do?STATUS=2';
	 diag.Width = 800;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//切换菜单
function changeMenus(){
	window.location.href=locat+'/main/yes';
}

//清除遮罩层
function hangge(){
	$("#jzts").hide();
}

//加载遮罩层
function jzts(){
	$("#jzts").show();
}

//刷新用户头像
function updateUserPhoto(value){
	$("#userPhoto").attr("src",value);//用户头像
}
