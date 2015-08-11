package com.ifeng.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.type.JavaType;




/**
 * json转换方面的工具类,全部为静态方法
 * @author zhaoyunxiao
 * 
 */
public class JsonUtil<T> {
	private static final Log log = LogFactory.getLog(JsonUtil.class);
	private static ObjectMapper mapper = new ObjectMapper(); 
	static{
		mapper.setSerializationInclusion(Inclusion.NON_NULL);//设置序列化配置，为null的属性不加入到json中
		mapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);//兼容单引号 但单引号不属于json标准 不建议使用
	}
	/**
	 * 将对象转换成json字符串,如果转换失败则返回null
	 * @author zhaoyunxiao
	 * @param o 需要转换为json的对象
	 * @return String 转换后的json字符串
	 * 
	 * 
	 * */
    public static String write2JsonStr(Object o){
    	String jsonStr = "";
    	try {
    		jsonStr = mapper.writeValueAsString(o);
		} catch (JsonProcessingException e) {
			log.error("write2JsonStr() exception: " + e.getMessage(),e);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonStr;
    }
    
    /**
     * 将json转换为对象 如果对象模版为内部类会出现问题，所以不要使用内部类
     * @author zhaoyunxiao
     * @param json 要转换的json
//     * @param 要映射的类型
     * @return 转换成的目标对象，如果转换失败返回null
     * */
    public static Object json2Object(String json,Class<?> clazz){
    	try {
			 return mapper.readValue(json,clazz);
		} catch (JsonParseException e) {
			log.error("json2Object() parseException: " + e.getMessage());
		} catch (JsonMappingException e) {
			log.error("json2Object() mappingException: " + e.getMessage());
		} catch (IOException e) {
			log.error("json2Object() IOException: " + e.getMessage());
		}
    	return null;
    }
    
    /**
     * 将json字符串转换为Map
     * @author zhaoyunxiao
     * @param  json 需要转换为Map的json字符串 {}开头结尾的
     * @return 转换后的map 如果转换失败返回null
     * */
    @SuppressWarnings("unchecked")
	public static Map<String,Object> json2Map(String json){
    	try {
    		if(StringUtils.isBlank(json)) {
    			return new HashMap<String,Object>() ;
    		}
			return mapper.readValue(json,Map.class);
		} catch (JsonParseException e) {
			log.error("json2Map(), 出错的json内容："  + " ,JsonParseException: " + e.getMessage());
		} catch (JsonMappingException e) {
			log.error("json2Map(), 出错的json内容："  + " ,JsonMappingException: " + e.getMessage());
		} catch (IOException e) {
			log.error("json2Map(), 出错的json内容为："  + " ,IOException: " + e.getMessage());
		}
   	    return new HashMap<String,Object>() ;
    }


    /**
     * 将json数组转换为List<Map<String,Object>> json数组格式[{},{}]
     * @author zhaoyunxiao
//     * @param  需要转换的json数组
     * @return 转换后的列表   如果转换失败返回null
     * */
    @SuppressWarnings("unchecked")
	public static List<Map<String,Object>> jsonArray2List(String jsonArray){
        try {
			return mapper.readValue(jsonArray, List.class);
		} catch (JsonParseException e) {
			log.error("jsonArray2List() exception, 异常字符串: " + jsonArray, e);
		} catch (JsonMappingException e) {
			log.error("jsonArray2List() exception, 异常字符串: " + jsonArray, e);
		} catch (IOException e) {
			log.error("jsonArray2List() exception",e);
		}
        return new ArrayList<Map<String,Object>>();
    }
    @SuppressWarnings("rawtypes")
	public static <T> List<T> jsonArray2List(String jsonArray, Class clazz){
    	try {
    		JavaType jt = mapper.getTypeFactory().constructParametricType(List.class, clazz);  
    		return mapper.readValue(jsonArray, jt);
    	} catch (JsonParseException e) {
    		log.error("jsonArray2List() exception, 异常字符串: " + jsonArray, e);
    	} catch (JsonMappingException e) {
    		log.error("jsonArray2List() exception, 异常字符串: " + jsonArray, e);
    	} catch (IOException e) {
    		log.error("jsonArray2List() exception",e);
    	}
    	return null;
    }
    
    /**
     * 将json数组转换为List<Map<String,Object>> json数组格式[{},{}]
     * @author zhaoyunxiao
//     * @param  需要转换的json数组
     * @return 转换后的列表   如果转换失败返回null
     * */
    @SuppressWarnings("unchecked")
	public static List<Map<String,Object>> jsonArray2List(String jsonArray,String keyword){
        try {
			return mapper.readValue(jsonArray, List.class);
		} catch (JsonParseException e) {
			log.error("JsonUtil exception, keyword: "+keyword+", 异常字符串: " + jsonArray, e);
		} catch (JsonMappingException e) {
			log.error("JsonUtil exception, keyword: "+keyword+", 异常字符串: " + jsonArray, e);
		} catch (IOException e) {
			log.error("JsonUtil exception",e);
		}
        return new ArrayList<Map<String,Object>>();
    }
   /* public static void main(String[] args) {
    	String json = "{'name':'zhaoyunxiao','age':'12'}";
    	String jsonArray = "[{\"name\":\"zhaoyunxiao\",\"age\":\"12\"},{\"name\":\"dengzhengping\",\"age\":\"13\"}]";
    	System.out.println(json);
    	Map p = (Map)json2Object(json, Map.class);
    	//System.out.println(p.getName());
    	Map<String,Object> res = json2Map(json);
    	System.out.println(res);
    	List<Map<String,Object>> l = jsonArray2List(jsonArray);
    	System.out.println(l);
		
	}*/
}
