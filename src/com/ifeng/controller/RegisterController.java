package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;

@Controller
@RequestMapping("/register/")
public class RegisterController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("toRegister")
	public String toRegister(){
		return "/user/register";
	}
	
	@RequestMapping("register")
	public void register(String type,String email,String phone,String password,String username,HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		User user = new User();
		user.setType(Integer.parseInt(type));
		user.setEmail(email);
		user.setPhone(phone);
		user.setUsername(username);
		user.setPassword(password);
		int result = userService.add(user);
		if(result > 0){
			writer.print(JSONObject.fromObject(ResponseMessage.SUCCESS));
		}else{
			writer.print(JSONObject.fromObject(ResponseMessage.FAIL));
		}
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
