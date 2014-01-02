package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.util.MemCachedManager1;
import com.ifeng.util.UserActivedRecords;
import com.ifeng.util.UserInfoHandler;
import com.ifeng.util.Util;

/**
 * 用户登录 退出
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/log/")
public class LogController {

	Logger log = Logger.getLogger(LogController.class);
	MemCachedManager1 cache = MemCachedManager1.getInstance();
	
	@RequestMapping("login")
	public void login(HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Cookie[] cookies = request.getCookies();
		String params = null;
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (StringUtils.isNotEmpty(c.getValue()) && "cookie".equals(c.getName())) {
						params = (String) cache.get(c.getValue());
						break;
				}
			}
			if (StringUtils.isEmpty(params)) {
				params = UserInfoHandler.getUserInfoAndSetCache(request,
						response);
			}
		}
		out.print("http://v.6.cn/coopweb/ifeng/?" + params);
	}
	
	@RequestMapping("logout")
	public void logout(HttpServletRequest request,HttpServletResponse response){
		String sid = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (StringUtils.isNotEmpty(c.getValue()) && "cookie".equals(c.getName())) {
					sid = c.getValue();
					break;
				}
				}
		}
		
		String guid = Util.getGuid(request);
		String realIp = request.getRemoteAddr();
		log.info("用户退出："+realIp);
		if(StringUtils.isNotEmpty(sid)){
			UserActivedRecords.pushUserCache(sid, guid, realIp,false);
		}
		try {
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
