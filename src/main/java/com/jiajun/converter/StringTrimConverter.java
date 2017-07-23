package com.jiajun.converter;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * @desc  参数trim
 * @author JIAJUN
 * @date 2017年7月23日上午9:54:00
 */
public class StringTrimConverter implements Converter<String, String>{

	@Override
	public String convert(String source) {
		if(StringUtils.isNotEmpty(source)) {
			String trim = source.trim();
			if("".equals(trim)) {
				return null;
			}
			return trim;
		}
		return null;
	}

}
