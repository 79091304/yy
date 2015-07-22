package com.ifeng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.service.ProductService;

@Controller
@RequestMapping("/edit/course/")
public class EditCourseController {
	
	@Autowired
	private ProductService courseService;

	@RequestMapping("edit")
	public void edit(){
		
	}
}
