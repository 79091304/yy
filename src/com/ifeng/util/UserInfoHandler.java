package com.ifeng.util;

import java.beans.Encoder;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONNull;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.ifeng.entity.User;


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
	public static String getUserInfoAndSetCache(HttpServletRequest request,HttpServletResponse response,int source){
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
				else{
					name = username.toString();
				}
				if(StringUtils.isEmpty(name)){
					name = mail.toString();
				}
				String guid = (String)dataMap.get("guid");
				String time = String.valueOf(new Date().getTime());
				String params = null;
				//将用户信息缓存
				User user = new User();
				user.setNickname(name);
				user.setGuid(guid);
				user.setEmail(mail.toString());
				if(null == cache.get(sid)){
					cache.add(sid, user,new Date(12*10*60*1000));
				}else{
					cache.replace(sid, user,new Date(12*10*60*1000));
				}
				
				switch (source) {
				case 1:
				{//六间房用户
					String flag = Util.Md5(guid+time+Util.getKeyBySource(source));
					params = "uid="+guid+"&time="+time+"&flag="+flag+"&nickname="+name;
					log.info("六间房用户 请求主站参数"+params);
				}
					break;
				case 2:
				{//我秀用户
					time = time.substring(0, 10);
					String token = Util.Md5(guid+time+Util.getKeyBySource(source));
					params = "uid="+guid+"&time="+time+"&token="+token+"&nickname="+name;
					log.info("我秀用户 请求主站参数"+params);
				}
					break;
				default:
					break;
				}
				
				cache.add("gui"+sid, guid,new Date(12*10*60*1000));//保存用户GUID
				Cookie cookie = new Cookie("cookie", sid);//保存SID
				cookie.setMaxAge(1000*60*60*12);
				response.addCookie(cookie);
				
				return params;
			}else{//
				return null;
			}
		}else{
			return null;
		}
	}
	
}
