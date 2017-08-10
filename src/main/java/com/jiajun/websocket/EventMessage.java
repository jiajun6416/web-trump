package com.jiajun.websocket;

import com.jiajun.util.JsonUtils;

/**
 * websocket发送的消息
 * 
 * @author jiajun
 * @Date 2017/08/09 11时
 */
public class EventMessage implements java.io.Serializable{

	private static final long serialVersionUID = -4245101405509451231L;
	
	private String type;
	
	private String sender;
	
	private Object content;
	
	public void setSender(String sender) {
		this.sender = sender;
	}
	
	public EventMessage(String type, Object content) {
		super();
		this.type = type;
		this.content = content;
	}
	public EventMessage(String type, String sender, Object content) {
		super();
		this.type = type;
		this.sender = sender;
		this.content = content;
	}

	public EventMessage() {
		super();
	}
	
	public String getSender() {
		return sender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return JsonUtils.encode(this);
	}
	
}
