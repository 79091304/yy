package com.ifeng.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;

@Controller
@RequestMapping("/course/")
public class CourseController extends BaseController{
	
	
	private static final int COUNT = 4; 
	
	@Autowired
	private CourseService courseService;

	/**
	 * 展示课程
	 * @param response
	 * @param count 展示的数量
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("list")
	public ModelAndView listForIndex(String count,HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("courses");
		List<Course> courses = courseService.listForIndex(COUNT);
		mv.addObject("courses", courses);
		mv.addObject("ctx", request.getContextPath());
		return mv;
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
