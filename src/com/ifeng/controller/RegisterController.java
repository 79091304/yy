package com.ifeng.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;
import com.ifeng.util.EmailUtils;
import com.ifeng.util.RandomValidateCode;
import com.ifeng.util.MD5Sec;

@Controller
@RequestMapping("/register/")
public class RegisterController {
	
	private static Log log = LogFactory.getLog(RegisterController.class);
	
	@Autowired
	private UserService userService;

	
	@RequestMapping("toRegister")
	public ModelAndView toLogin(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("register");
		return mv;
	} 
	
	@ResponseBody
	@RequestMapping("register")
	public Object register(String email,String phone,String password,String username,String verify,HttpServletRequest request) throws IOException{
		ResponseMessage rm = null;
		log.info("用户注册，用户邮箱："+email+"，用户手机号:"+phone+"用户名："+username+",验证码："+verify);
		String code = (String)request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY);
		if(StringUtils.isNotEmpty(verify) && verify.equalsIgnoreCase(code)){
			User user = new User();
			user.setEmail(email);
			user.setPhone(phone);
			user.setUsername(username);
			user.setPassword(MD5Sec.md5(password));
			user.setVerify(code);
			int result = userService.add(user);
			if(result > 0){
				rm = ResponseMessage.SUCCESS;
				EmailUtils.sendAccountActivateEmail(user);
			}else{
				rm = ResponseMessage.FAIL;
			}
		}else{
			rm = ResponseMessage.CODEFAIL;
		}
		return rm;
	}
	
	/**
	 * 检查手机是否合法
	 * @param phone 
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("phoneIsLegal")
	public Object phoneIsLegal(String phone) throws IOException{
		boolean flag = false;
		ResponseMessage rm = null;
		if(StringUtils.isNotEmpty(phone)){
			flag = userService.checkPhoneIsLegal(phone);
		}
		if(flag){
			rm = ResponseMessage.SUCCESS;
		}else{
			rm = ResponseMessage.FAIL;
		}
		return rm;
	}
}
