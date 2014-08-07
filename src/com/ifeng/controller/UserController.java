package com.ifeng.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;
import com.ifeng.util.AesSec;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("getInfo")
	public Object getInfo(String uid){
		String userid = AesSec.decrypt(uid, Instant.AES_PASSWORD);
		User user = userService.getById(Long.parseLong(userid));
		return user;
	}
	
	@RequestMapping("activateAccount")
	public ModelAndView activateAccount(String uid,String checkcode,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		if(StringUtils.isNotEmpty(uid) && StringUtils.isNotEmpty(checkcode)){
			User user = userService.getById(Long.parseLong(uid));
			if(checkcode.equals(user.getVerify())){
				String encryptStr = AesSec.encrypt(user.getId()+"", Instant.AES_PASSWORD);
				Cookie cookie = new Cookie(Instant.COOKIE_USERID, encryptStr);
				cookie.setMaxAge(60*60*24*3);
				response.addCookie(cookie);
				int type = user.getType();//根据注册类型跳转到相应的页面，教师发布课程
				if(type == User.TYPE_TEACHER){
					mv.setViewName("index");//引动用户填写课程信息
				}else if(type == User.TYPE_PARENT){
					mv.setViewName("index");//引导用户填写孩子信息
				}
				
			}else{
				mv.setViewName("");;
			}
		}
		return mv;
	}
}
