package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;

@Controller
@RequestMapping("/course/")
public class CourseController {
	
	private static final int COUNT = 4; 
	
	@Autowired
	private CourseService courseService;

	@RequestMapping("list")
	public void listForIndex(HttpServletResponse response) throws IOException{
		PrintWriter writer = response.getWriter();
		List<Course> courses = courseService.listForIndex(COUNT);
		ResponseMessage rm = new ResponseMessage(courses);
		writer.print(JSONObject.fromObject(rm));
	}
	
	/**
	 * 查询课程信息
	 * @param id
	 * @param request
	 */
	@RequestMapping("getInfo")
	public ModelAndView getInfo(long id,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("course");
		mv.addObject("ctx", request.getContextPath());
		if(0 != id){
			Course course = courseService.getCourse(id);
			if(null != course)
			mv.addObject("course", course);
		}
		return mv;
	}
	
}
