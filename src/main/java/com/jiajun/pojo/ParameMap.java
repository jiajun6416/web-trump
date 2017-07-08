package com.jiajun.pojo;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

/**
 * @描述：封装页面参数的map
 * @author jiajun
 * @date 2017年7月1日下午6:29:23
 */
public class ParameMap extends HashMap<String, Object>{
	
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> params = new HashMap<>();
	
	public ParameMap() {
		super();
	}

	public ParameMap(HttpServletRequest request) {
		if(request != null) {
			Map<String, String[]> paramMap = request.getParameterMap();
			Set<Entry<String, String[]>> entry = paramMap.entrySet();
			if(entry != null) {
				String[] value;
				for (Entry<String, String[]> e : entry) {
					 value = e.getValue();
					 if(value != null && value.length > 1) {
						 put(e.getKey(), value);
					 } else {
						 put(e.getKey(), value[0].trim());
					 }
				}
			}
		}
	}
	
	@Override
	public Set entrySet() {
		return params.entrySet();
	}
	
	@Override
	public Object get(Object key) {
		return params.get(key);
	}
	@Override
	public boolean isEmpty() {
		return params.isEmpty();
	}
	@Override
	public Object put(String key, Object value) {
		return params.put(key, value);
	}
	
	public int size() {
		return params.size();
	}
	
}
