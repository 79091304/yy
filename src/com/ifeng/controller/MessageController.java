package com.ifeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/message/")
public class MessageController {

	@RequestMapping("index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("message");
		return mv;
	}
}
