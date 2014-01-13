package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.entity.User;
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
						Object obj =  cache.get(c.getValue());
						User user = null;
						if(obj instanceof String){
							break;
						}else if(obj instanceof User){
							user = (User)obj;
						}
						if(null == user){
							break;
						}
						String time = String.valueOf(new Date().getTime());
						String flag = Util.Md5(user.getGuid()+time+Util.getKeyBySource(Instant.CHARGE_SOURCE_LIU));
						params = "uid="+user.getGuid()+"&time="+time+"&flag="+flag+"&nickname="+user.getNickname();
						break;
				}
			}
			if (StringUtils.isEmpty(params)) {
				params = UserInfoHandler.getUserInfoAndSetCache(request,
						response,Instant.CHARGE_SOURCE_LIU);
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
	
	
	@RequestMapping("loginByWoxiu")
	public void loginByWoxiu(HttpServletRequest request, HttpServletResponse response){
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
					Object obj =  cache.get(c.getValue());
					User user = null;
					if(obj instanceof String){
						break;
					}else if(obj instanceof User){
						user = (User)obj;
					}
					if(null == user){
						break;
					}
						String time = String.valueOf(new Date().getTime());
						time = time.substring(0, 10);
						String token = Util.Md5(user.getGuid()+time+Util.getKeyBySource(Instant.CHARGE_SOURCE_WOXIU));
						params = "uid="+user.getGuid()+"&time="+time+"&token="+token+"&nickname="+user.getNickname();
						break;
				}
			}
			if (StringUtils.isEmpty(params)) {
				params = UserInfoHandler.getUserInfoAndSetCache(request,
						response,Instant.CHARGE_SOURCE_WOXIU);
			}
		}
		out.print("http://www.woxiu.com/coop/ifeng.php?" + params);
	}
	
	
}
