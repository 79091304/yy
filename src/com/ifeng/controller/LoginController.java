package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	
	
	@Autowired
	UserService userService;
   
	
	@RequestMapping("toLogin")
	public ModelAndView toLogin(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("login");
		 String ctx = request.getContextPath();
	     mv.addObject("ctx", ctx);
		return mv;
	} 
	
	@RequestMapping("login")
	public void login(String username,String email,String phone,String password,HttpServletRequest request,HttpServletResponse response) throws IOException{
		ResponseMessage rm = null;
		PrintWriter writer = response.getWriter();
		User user = userService.hasUser(username, email, phone, password);
		if(null != user){
			rm = ResponseMessage.SUCCESS;
			request.setAttribute("user", user);
			Cookie cookie = new Cookie("userid", user.getId()+"");
			response.addCookie(cookie);
		}else{
			 rm = new ResponseMessage(3, "用户名或密码错误，请重新输入！");
		}
		writer.print(JSONObject.fromObject(rm));
	}
	
	
}
