package com.ifeng.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieHelper {

	/**
	 * 取得value
	 * @param key
	 * @param request
	 * @return
	 */
	public static String getValue(String key,HttpServletRequest request){
		String value = null;
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			if(key.equals(cookie.getName()))
				value = cookie.getValue();
		}
		return value;
	}
	
	
}
