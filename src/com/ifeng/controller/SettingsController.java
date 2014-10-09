package com.ifeng.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
import com.ifeng.util.CookieHelper;
import com.ifeng.util.EmailUtils;

@Controller
@RequestMapping("/settings/")
public class SettingsController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("settings");
		String uid = CookieHelper.getValue(Instant.COOKIE_USERID, request);
		if(StringUtils.isNotEmpty(uid)){
			String userid = AesSec.decrypt(uid, Instant.AES_PASSWORD);
			User user = userService.getById(Long.parseLong(userid));
			mv.addObject("user", user);
		}
		return mv;
	}
	
	@RequestMapping("forgetpwd")
	public ModelAndView fogetpwd(){
		ModelAndView mv = new ModelAndView("forgetpwd");
		return mv;
	}
	
	/**
	 * 找回密码第一步
	 * @param email
	 * @return
	 */
	@ResponseBody
	@RequestMapping("step1")
	public Object step1(String email){
		User user = userService.hasUser(null, email, null, null);
		if(null !=user)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}
	
	/**
	 * 找回密码第2步
	 * @param email
	 * @return
	 */
	@ResponseBody
	@RequestMapping("step2")
	public Object step2(String email,HttpServletRequest request){
		try{
			EmailUtils.sendAccountActivateEmail(request, email,"验证码");
		}catch(Exception e){
			e.printStackTrace();
		}
		return ResponseMessage.SUCCESS;
	}
	
	/**
	 * 找回密码第3步
	 * @param email
	 * @return
	 */
	@ResponseBody
	@RequestMapping("step3")
	public Object step3(String email,String password,String vcode,String piccode){
		//判断验证码是否正确
		//todo
		int result = this.userService.changepwd(email, password);
		if(result >0 )
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}
}
