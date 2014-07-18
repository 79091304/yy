package com.ifeng.controller.cron;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.util.HtmlFileWriter;

@Controller
@RequestMapping("/teacherWriter/")
public class TeacherWriterController {

	
	private static final String TEACHER_FOR_INDEX = "";//首页教师信息
	
	
	private StringBuilder teacherStr = new StringBuilder();
	
	
	public void writeTeachersForIndex(){
		HtmlFileWriter.writeHtml("", TEACHER_FOR_INDEX);
	}
}
