package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Teacher;
import com.ifeng.service.TeacherService;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {

	private static final int COUNT = 4;
	
	@Autowired
	private TeacherService teacherService;
	
	/**
	 * 首页展示
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("list")
	public void list(HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		List<Teacher> teachers = teacherService.listForIndex(COUNT);
		ResponseMessage rm = new ResponseMessage(teachers);
		writer.print(JSONObject.fromObject(rm));
	}
}
