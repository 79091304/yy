package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.ResponseMessage;
import com.ifeng.service.UserService;

@Controller
@RequestMapping("/register/")
public class RegisterController {
	
	private UserService userService;

	@RequestMapping("toRegister")
	public String toRegister(){
		return "/user/register";
	}
	
	@RequestMapping("register")
	public String register(String type,String email,String phone,String user_pwd,String user_name){
		
		return null;
	}
	
	/**
	 * 检查手机是否合法
	 * @param phone
	 * @throws IOException 
	 */
	@RequestMapping("phoneIsLegal")
	public void phoneIsLegal(String phone,HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		boolean flag = false;
		if(StringUtils.isNotEmpty(phone)){
			flag = userService.checkPhoneIsLegal(phone);
		}
		if(flag){
			writer.print(JSONObject.fromObject(ResponseMessage.SUCCESS));
		}else{
			writer.print(JSONObject.fromObject(ResponseMessage.FAIL));
		}
		 
		
	}
}
