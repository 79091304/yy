package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	public void login(String username,String email,String phone,String password,HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		User user = userService.hasUser(username, email, phone, password);
		if(null != user){
			ResponseMessage rm = new ResponseMessage(user); 
			writer.print(JSONObject.fromObject(rm));
		}else{
			writer.print(JSONObject.fromObject(ResponseMessage.FAIL));
		} 
	}
	
	
}
