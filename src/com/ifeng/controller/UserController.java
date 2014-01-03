package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.dao.UserActiveInfoDao;
import com.ifeng.util.DateUtils;
import com.ifeng.util.MemCachedManager1;
import com.ifeng.util.UserActivedRecords;
import com.ifeng.util.Util;
/**
 * 用户
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/user/")
public class UserController {

	Logger log = Logger.getLogger(UserController.class);
	MemCachedManager1 cache = MemCachedManager1.getInstance();
	
	@Autowired
	private UserActiveInfoDao userActiveInfoDao;
	
	@RequestMapping("getUserInfo")
	public void getUserInfo( String sid,HttpServletRequest request,HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		log.info("查询用户信息");
		String param = Util._callHttp("https://id.ifeng.com/api/getuserinfo?sid=", sid);
		if(StringUtils.isNotEmpty(param)){
			JSONObject jobject = JSONObject.fromObject(param);
			Integer code = (Integer)jobject.get("code");
			if(1 == code.intValue()){
				Map<String,Object> dataMap = (Map<String,Object>)jobject.get("data");
				Object nickname = dataMap.get("nickname");
				String guid = (String)dataMap.get("guid");
				String time = String.valueOf(new Date().getTime());
				String flag = Util.Md5(guid+time+"$@EE$R$dsdee*&46rooms&ifeng_coop");
				String params = "uid="+guid+"&time="+time+"&flag="+flag+"&nickname="+nickname;
				boolean b = cache.add(sid, params,new Date(12*10*60*1000));
				Cookie cookie = new Cookie("cookie", sid);
				cookie.setMaxAge(1000*60*60*12);
				response.addCookie(cookie);
				log.info("params:"+params+",sid="+sid+",b:"+b);
				writer.print(1);
				String realIp = request.getRemoteAddr();
				log.info("用户IP："+realIp);
				if(StringUtils.isNotEmpty(sid)){
					UserActivedRecords.pushUserCache(sid, guid, realIp,true);
				}
			}else{
				log.info("登录失败");
				writer.print(0);
			}
		}
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
		log.info("用户IP是："+realIp);
		if(StringUtils.isNotEmpty(sid)){
			UserActivedRecords.pushUserCache(sid, guid, realIp,false);
		}
		try {
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("flushUserInfoToDb")
	public void flushUserInfoToDb(String commond , HttpServletRequest request,HttpServletResponse response){
		UserActivedRecords uar = new UserActivedRecords(userActiveInfoDao);
		log.info("将用户登录或者退出信息持久化到DB");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int loginSize = UserActivedRecords.LoginUserInfo.size();
		if(loginSize > 200){
			uar.flushLoginToBlockQueue();
			writer.write("定时登录用户持久化DB"+DateUtils.getCurrentDate()+"用户数量："+loginSize);
		}
		
		int logoutSize = UserActivedRecords.LogoutUserInfo.size();
		if(logoutSize > 200){
			uar.flushLogoutToBlockQueue();
			writer.write("定时退出用户持久化DB"+DateUtils.getCurrentDate()+"用户数量："+logoutSize);
		}
		if(StringUtils.isNotEmpty(commond)){
			uar.flushLoginToBlockQueue();
			writer.write("手动持久化用户登录信息到DB"+DateUtils.getCurrentDate()+"用户数量："+loginSize);
			uar.flushLogoutToBlockQueue();
			writer.write("手动持久化用户退出信息到DB"+DateUtils.getCurrentDate()+"用户数量："+logoutSize);
		}
	}
	
	public static void main(String[] args) {
		System.out.println("\u672a\u767b\u5f55");
	}
}
