package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;
import com.ifeng.util.EmailUtils;
import com.ifeng.util.Md5Tool;
import com.ifeng.util.RandomValidateCode;

@Controller
@RequestMapping("/register/")
public class RegisterController {
	
	@Autowired
	private UserService userService;

	
	@RequestMapping("toRegister")
	public ModelAndView toLogin(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("register");
		 String ctx = request.getContextPath();
	     mv.addObject("ctx", ctx);
		return mv;
	} 
	
	@RequestMapping("register")
	public void register(String type,String email,String phone,String password,String username,String verify,HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		String code = (String)request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY);
		if(StringUtils.isNotEmpty(verify) && verify.equalsIgnoreCase(code)){
			User user = new User();
			user.setType(Integer.parseInt(type));
			user.setEmail(email);
			user.setPhone(phone);
			user.setUsername(username);
			user.setPassword(Md5Tool.getMd5(password));
			int result = userService.add(user);
			if(result > 0){
				writer.print(JSONObject.fromObject(ResponseMessage.SUCCESS));
				EmailUtils.sendAccountActivateEmail(user);
			}else{
				writer.print(JSONObject.fromObject(ResponseMessage.FAIL));
			}
		}else{
			writer.print(JSONObject.fromObject(ResponseMessage.CODEFAIL));
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
