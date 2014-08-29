package com.ifeng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.service.TeacherService;

@Controller
@RequestMapping("/edit/teacher/")
public class EditTeacherController {
	
	@Autowired
	private TeacherService teacherService;

	@RequestMapping("edit")
	public void edit(){
		
	}
}
