package com.jiajun.shiro.session;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.session.mgt.SimpleSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 每次访问session都会更新LastAccessTime这个字段, 重置session过期时间,且会调用update方法, 但是项目中过期时间是由redis自己维护的
 * 
 * 解决: 如果只是修改lastAccessTime这个字段,则不实际调用redis的update, 除去只是修改lastAccessTIme字段的操作还是需要访问redis
 * 
 * @author jiajun
 * @date 2017/08/05 12时
 */
public class SimpleShiroSession extends SimpleSession{

	private static final long serialVersionUID = 8925447489623100056L;
	
	private static Logger logger = LoggerFactory.getLogger(SimpleShiroSession.class);
	
	//除lastAccessTime以外其他字段发生改变时为true  
	private boolean changed = false; 

	
	public SimpleShiroSession() {
		super();
		setChanged(true);
	}
	
	public SimpleShiroSession(String host) {
		super(host);
		setChanged(true);
	}

	/**
	 * 有redis自己维护, 则此时执行update
	 */
	@Override
	public void setLastAccessTime(Date lastAccessTime) {
		super.setLastAccessTime(lastAccessTime);
		setChanged(false);
	}
	/**
	 * 有redis自己维护, 则此时执行update
	 */
	@Override
	public void setStartTimestamp(Date startTimestamp) {
		super.setStartTimestamp(startTimestamp);
		setChanged(false);
	}
	
	
    @Override  
    public void setId(Serializable id) {  
        super.setId(id);  
        this.setChanged(true);  
    }  
  
    @Override  
    public void setStopTimestamp(Date stopTimestamp) {  
        super.setStopTimestamp(stopTimestamp);  
        this.setChanged(true);  
    }  
  
    @Override  
    public void setExpired(boolean expired) {  
        super.setExpired(expired);  
        this.setChanged(true);  
    }  
  
    @Override  
    public void setTimeout(long timeout) {  
        super.setTimeout(timeout);  
        this.setChanged(true);  
    }  
  
    @Override  
    public void setHost(String host) {  
        super.setHost(host);  
        this.setChanged(true);  
    }  
  
    @Override  
    public void setAttributes(Map<Object, Object> attributes) {  
        super.setAttributes(attributes);  
        this.setChanged(true);  
    }  
  
    @Override  
    public void setAttribute(Object key, Object value) {  
    	// jstl标签中的fmt会设置编码格式, 忽略掉
    	if("javax.servlet.jsp.jstl.fmt.request.charset".equals(key)) {
    		return;
    	}
    	logger.info("session set attribute, key:{}, value:{}", key, value);
        super.setAttribute(key, value);  
        this.setChanged(true);  
    }  
  
    @Override  
    public Object removeAttribute(Object key) {  
    	logger.info("remove attribute , key {}", key);
        this.setChanged(true);  
        return super.removeAttribute(key);  
    }  
  
    /** 
     * 停止 
     */  
    @Override  
    public void stop() {  
    	logger.info("session stop");
        super.stop();  
        this.setChanged(true);  
    }  
  
    /** 
     * 设置过期 
     */  
    @Override  
    protected void expire() {  
        this.stop();  
        this.setExpired(true);  
    }  
    @Override  
    public boolean equals(Object obj) {  
        return super.equals(obj);  
    }  
  
    @Override  
    protected boolean onEquals(SimpleSession ss) {  
        return super.onEquals(ss);  
    }  
  
    @Override  
    public int hashCode() {  
        return super.hashCode();  
    }  
  
    @Override  
    public String toString() {  
        return super.toString();  
    }  
	
	public boolean isChanged() {
		return changed;
	}
	public void setChanged(boolean changed) {
		this.changed = changed;
	}
}
