package com.jiajun.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiajun.pojo.system.SysMenuEntity;
import com.jiajun.pojo.system.SysMenuPremission;

/**
 * @描述：json转换工具类
 * @author jiajun
 * @date 2017年6月4日上午9:14:22
 */
public class JsonUtils {
	
    /**
     * Logger for this class
     */
    private static final Logger logger = LoggerFactory.getLogger(JsonUtils.class);

    private final static ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 对象转换为json字符串
     * @param obj
     * @return
     */
    public static String encode(Object obj) {
        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonGenerationException e) {
            logger.error("encode(Object)", e); 
        } catch (JsonMappingException e) {
            logger.error("encode(Object)", e); 
        } catch (IOException e) {
            logger.error("encode(Object)", e); 
        }
        return null;
    }

    /**
     * 将json string反序列化成对象
     *
     * @param json
     * @param valueType
     * @return
     */
    public static <T> T decode(String json, Class<T> valueType) {
        try {
            return objectMapper.readValue(json, valueType);
        } catch (JsonParseException e) {
            logger.error("decode(String, Class<T>)", e);
        } catch (JsonMappingException e) {
            logger.error("decode(String, Class<T>)", e);
        } catch (IOException e) {
            logger.error("decode(String, Class<T>)", e);
        }
        return null;
    }

    /**
     *将集合类型的json转化为对象
     *
     * @param json
     * @param jsonTypeReference
     * @return
     */
    public static <T> T decode(String json, TypeReference<T> jsonTypeReference) {
        try {
            return (T) objectMapper.readValue(json, jsonTypeReference);
        } catch (JsonParseException e) {
            logger.error("decode(String, JsonTypeReference<T>)", e);
        } catch (JsonMappingException e) {
            logger.error("decode(String, JsonTypeReference<T>)", e);
        } catch (IOException e) {
            logger.error("decode(String, JsonTypeReference<T>)", e);
        }
        return null;
    }
    
   /**
    * 将集合类型的json转化为对象
    * @param is
    * @param jsonTypeReference
    * @return
    */
    public static <T> T decode(InputStream is, TypeReference<T> jsonTypeReference) {
        try {
            return (T) objectMapper.readValue(is, jsonTypeReference);
        } catch (JsonParseException e) {
            logger.error("decode(String, JsonTypeReference<T>)", e);
        } catch (JsonMappingException e) {
            logger.error("decode(String, JsonTypeReference<T>)", e);
        } catch (IOException e) {
            logger.error("decode(String, JsonTypeReference<T>)", e);
        }
        return null;
    }
    
    
    public static void main(String[] args) {
		SysMenuEntity menu = new SysMenuEntity();
		menu.setAccessUrl("123");
		menu.setId(2);
		List<SysMenuPremission> premissionList = new ArrayList<>();
		SysMenuPremission premssion = new SysMenuPremission();
		for(int i=0; i<5; i++) {
			premssion.setId(i);
			premssion.setPremissionCode("abc");
			premissionList.add(premssion);
		}
		menu.setPremissionList(premissionList );
		
		System.out.println(JsonUtils.encode(menu));
    }
}
