package com.ifeng.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.entity.User;

@Controller
@RequestMapping("/settings/")
public class SettingsController {

	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("settings");
		User user = (User)request.getSession().getAttribute("user");
		mv.addObject("user", user);
		return mv;
	}
	
	@RequestMapping("forgetpwd")
	public ModelAndView fogetpwd(){
		ModelAndView mv = new ModelAndView("forgetpwd");
		return mv;
	}
}
