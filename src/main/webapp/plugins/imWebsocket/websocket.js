var locat = (window.location+'').split('/');
//项目除了请求头的路径 
var wsPath;
if('main'== locat[3]){
	wsPath = "ws://" + locat[2];
}else{
	wsPath = "ws://"+locat[2]+'/'+locat[3];
};
var websocket; //im websocket对象
var isCreatw = false;
var title="";
var win;
var input;
var isQj = true;
var toUser="";


function toUserMsg(toU){
	if((!isQj && toUser == toU) || toU == user){
		win.setTitle(title + "&nbsp;&nbsp;(已连接)   【现在全局对话】");
		isQj = true;
		toUser = "";
	}else{
		win.setTitle(title + "&nbsp;&nbsp;(已连接)   【现在单独与"+toU+"对话】");
		isQj = false;
		toUser = toU;
	}
}

//启动聊天窗口并连接聊天服务器
 function connectIm() {
	 		if(isCreatw){
	 			alert("已经启动");
	 			return;
	 		}else{
	 			isCreatw = true;
	 		}
			//创建用户输入框
			input = Ext.create('Ext.form.field.HtmlEditor', {
						region : 'south',
						height : 120,
						enableFont : false,
						enableSourceEdit : false,
						enableAlignments : false,
						listeners : {
							initialize : function() {
								Ext.EventManager.on(me.input.getDoc(), {
											keyup : function(e) {
												//按住ctrl和enter发送
												if (e.ctrlKey === 1 && e.keyCode == 13) {
													e.preventDefault();
													e.stopPropagation();
													send();
												}
											}
										});
							}
						}
					});
			
			//创建消息展示容器
			var output = Ext.create('MessageContainer', {
						region : 'center'
					});

			var dialog = Ext.create('Ext.panel.Panel', {
						region : 'center',
						layout : 'border',
						items : [input, output],
						buttons : [{
									text : '发送',
									handler : send
								}]
					});

			//初始话WebSocket
			function initWebSocket() {
				if (window.WebSocket) {
					websocket = new WebSocket(encodeURI(imUrl));
					
					websocket.onopen = function() {
						//连接成功
						win.setTitle(title + '&nbsp;&nbsp;(已连接)   【现在全局对话】');
					}
					websocket.onerror = function() {
						//连接失败
						win.setTitle(title + '&nbsp;&nbsp;(连接发生错误)');
					}
					websocket.onclose = function() {
						//连接断开
						win.setTitle(title + '&nbsp;&nbsp;(已经断开连接)');
					}
					//消息接收
					websocket.onmessage = function(message) {
						var message = JSON.parse(message.data);
						if(message.type == "userList") {
							//用户列表
							var root = onlineUser.getRootNode();
							Ext.each(message.content,function(u){
								var node = root.createNode({
									id : u,
									text : u,
									iconCls : 'user',
									leaf : true
								});
								root.appendChild(node);
								//发送用户系统上线消息
							});							
							output.receive({from: "<b>[系统]</b>", content: '<span style="color: rgb(133, 133, 133); white-space: pre;">					</span><i style=""><font >用户'+user+'加入了聊天室</font></i>'});
						} else if(message.type == "userJoin") {
							//用户上线
							var root = onlineUser.getRootNode();
							var newUser = message.content;
							var node = root.createNode({
								id : newUser,
								text : newUser,
								iconCls : 'user',
								leaf : true
							});
							root.appendChild(node);	
							//发送用户系统上线消息
							output.receive({from: "<b>[系统]</b>", content: '<span style="color: rgb(133, 133, 133); white-space: pre;">					</span><i style=""><font >用户'+newUser+'加入了聊天室</font></i>'});
						} else if(message.type == "userLeave") {
							//用户下线
							var root = onlineUser.getRootNode();
							var leaveUser = message.content;
							var node = root.findChild('id',leaveUser);
							root.removeChild(node);		
							//发送用户系统下线消息
							output.receive({from: "<b>[系统]</b>", content: '<span style="color: rgb(133, 133, 133); white-space: pre;">					</span><i style=""><font >用户'+leaveUser+'离开了聊天室</font></i>'});
						} else if(message.type == "userTalk") {
							output.receive(message);
						}
					}
				}
			};

			//在线用户树
			var onlineUser = Ext.create('Ext.tree.Panel', {
						title : '在线用户',
						rootVisible : false,
						region : 'east',
						width : 150,
						lines : false,
						useArrows : true,
						autoScroll : true,
						split : true,
						iconCls : 'user-online',
						store : Ext.create('Ext.data.TreeStore', {
									root : {
										text : '在线用户',
										expanded : true,
										children : []
									}
								})
					});
			
			title = '欢迎您：' + user;
			//展示窗口
			win = Ext.create('Ext.window.Window', {
						title : title + '&nbsp;&nbsp;(未连接)',
						layout : 'border',
						iconCls : 'user-win',
						minWidth : 650,
						minHeight : 460,
						width : 650,
						animateTarget : 'websocket_button',
						height : 460,
						items : [dialog,onlineUser],
						border : false,
						listeners : {
							render : function() {
								initWebSocket();
							}
						}
					});

			win.show();
			
			win.on("close",function(){
				if(websocket != null) {
					websocket.close();
				}
				websocket = null;
				isCreatw = false;
			 });
			
			//关闭窗口前会关闭websocket连接, 防止丢出异常
			window.onbeforeunload = function(){
				if(websocket != null) {
					websocket.close();
					websocket = null;
				}
			}	
			
			//发送消息
			function send() {
				var content = input.getValue();
				if(toUser != ""){content = "fhadmin886"+toUser+"fhfhadmin888" + content;}
				var message = {};
				if (websocket != null) {
					if (input.getValue()) {
						/*Ext.apply(message, {
									content : content,
									timestamp : new Date().getTime(),
								});
						websocket.send(JSON.stringify(message));*/
						websocket.send(content);
						//output.receive(message);
						input.setValue('');
					}
				} else {
					Ext.Msg.alert('提示', '您已经掉线，无法发送消息!');
				}
			}
};

//用于展示用户的聊天信息
Ext.define('MessageContainer', {
	extend : 'Ext.view.View',
	trackOver : true,
	multiSelect : false,
	itemCls : 'l-im-message',
	itemSelector : 'div.l-im-message',
	overItemCls : 'l-im-message-over',
	selectedItemCls : 'l-im-message-selected',
	style : {
		overflow : 'auto',
		backgroundColor : '#fff'
	},

	tpl : [
		'<div class="l-im-message-warn">​交谈中请勿轻信汇款、中奖信息、陌生电话。 请遵守相关法律法规。</div>',
		'<tpl for=".">',
		'<div class="l-im-message">',
		'<div class="l-im-message-header l-im-message-header-{source}">{from}  {timestamp}</div>',
		'<div class="l-im-message-body">{content}</div>', '</div>',
		'</tpl>'],
		
	messages : [],

	
	//初始化组件
	initComponent : function() {
		var me = this;
		me.messageModel = Ext.define('Leetop.im.MessageModel', {
					extend : 'Ext.data.Model',
					fields : ['from', 'timestamp', 'content', 'source']
				});
		me.store = Ext.create('Ext.data.Store', {
					model : 'Leetop.im.MessageModel',
					data : me.messages
				});
		me.callParent();
	},
	//将服务器推送的信息展示到页面中
	receive : function(message) {
		var me = this;
		message['timestamp'] = Ext.Date.format(new Date(),
				'H:i:s');
		if(message.from == user){
			message.source = 'self';
		}else{
			message.source = 'remote';
		}
		me.store.add(message);
		if (me.el.dom) {
			me.el.dom.scrollTop = me.el.dom.scrollHeight;
		}
	},
});
