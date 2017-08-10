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
	
	private String from;
	
	private Object content;
	
	public EventMessage(String type, Object content) {
		super();
		this.type = type;
		this.content = content;
	}
	public EventMessage(String type, String from, Object content) {
		super();
		this.type = type;
		this.from = from;
		this.content = content;
	}

	public EventMessage() {
		super();
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
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
