package com.ifeng.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;
import com.ifeng.util.AesSec;
import com.ifeng.util.CoderUtils;
import com.ifeng.util.CookieHelper;

@Controller
@RequestMapping("/log/")
public class LoginController {
	
	
	@Autowired
	UserService userService;
   
	
	@RequestMapping("toLogin")
	public ModelAndView toLogin(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("login");
		return mv;
	} 
	
	/**
	 * 登录
	 * @param username
	 * @param email
	 * @param phone
	 * @param password
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("login")
	public Object login(String username,String email,String phone,String password,HttpServletRequest request,HttpServletResponse response) throws IOException{
		ResponseMessage rm = null;
		User user = userService.hasUser(username, email, phone, password);
		if(null != user){
			rm = ResponseMessage.SUCCESS;
			String encryptStr = AesSec.encrypt(user.getId()+"", Instant.AES_PASSWORD);
			Cookie cuid = new Cookie(Instant.COOKIE_USERID, encryptStr);
			cuid.setPath(getPath(request));
			cuid.setMaxAge(Instant.COOKIE_EXPIRE);
			Cookie cuname = new Cookie(Instant.COOKIE_USERNAME, CoderUtils.string2Unicode(user.getUsername()));
			cuname.setMaxAge(60*60*24*3);
			cuname.setPath(getPath(request));
			
			response.addCookie(cuid);
			response.addCookie(cuname);
		}else{
			 rm = new ResponseMessage(3, "用户名或密码错误，请重新输入！");
		}
		return rm;
	}
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response){
		CookieHelper.removeCookie(Instant.COOKIE_USERID, request, response);
		CookieHelper.removeCookie(Instant.COOKIE_USERNAME, request, response);
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	/**
	 * 获取跟路径
	 * @param request
	 * @return
	 */
	String getPath(HttpServletRequest request) {
	    String path = request.getContextPath();
	    return (path == null || path.length()==0) ? "/" : path;
	  }
}
