package com.ifeng.util;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONNull;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;


/**
 * 获取用户信息
 * @author zhang_zhanhui
 *
 */
public class UserInfoHandler {

	
	/**
	 * 获取用户信息
	 * @param request
	 * @return
	 */
	public static String getUserInfoAndSetCache(HttpServletRequest request,HttpServletResponse response){
		Logger log = Logger.getLogger(UserInfoHandler.class);
		MemCachedManager1 cache = MemCachedManager1.getInstance();
		Cookie[] cookies = request.getCookies();
		String sid = null;
		if(cookies!=null){
			for(Cookie c :cookies ){
				if(StringUtils.isNotEmpty(c.getValue())){
					if("sid".equals(c.getName())){
						sid = c.getValue();
						break;
					}
				}
			}
		}
		if(StringUtils.isNotEmpty(sid)){
			log.info("向主站查询用户信息");
			String param = Util._callHttp("https://id.ifeng.com/api/getuserinfo?sid=", sid);
			JSONObject jobject = JSONObject.fromObject(param);
			Integer code = (Integer)jobject.get("code");
			if(1 == code.intValue()){
				String name = null;
				Map<String,Object> dataMap = (Map<String,Object>)jobject.get("data");
				Object nickname = dataMap.get("nickname");
				Object username = dataMap.get("username");
				Object mail = dataMap.get("mail");
				if( !nickname.getClass().equals(JSONNull.class))
					name = nickname.toString();
				else if(!username.getClass().equals(JSONNull.class))
					name = username.toString();
				else
					name = mail.toString();
				String guid = (String)dataMap.get("guid");
				String time = String.valueOf(new Date().getTime());
				String flag = Util.Md5(guid+time+"$@EE$R$dsdee*&46rooms&ifeng_coop");
				String params = "uid="+guid+"&time="+time+"&flag="+flag+"&nickname="+name;
				cache.add(sid, params,new Date(12*10*60*1000));
				cache.add("gui"+sid, guid,new Date(12*10*60*1000));//保存用户GUID
				Cookie cookie = new Cookie("cookie", sid);//保存SID
				cookie.setMaxAge(1000*60*60*12);
				response.addCookie(cookie);
				log.info("请求主站参数"+params);
				return params;
			}else{//
				return null;
			}
		}else{
			return null;
		}
	}
	
}
