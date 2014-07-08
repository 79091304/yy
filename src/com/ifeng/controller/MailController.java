package com.ifeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail/")
public class MailController {

	@RequestMapping("sendMail")
	public void sendMail(){
		
	}
}
