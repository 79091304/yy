package com.ifeng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.service.CourseService;

@Controller
@RequestMapping("/edit/course/")
public class EditCourseController {
	
	@Autowired
	private CourseService courseService;

	@RequestMapping("edit")
	public void edit(){
		
	}
}
