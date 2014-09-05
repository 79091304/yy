package com.ifeng.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.entity.Category;
import com.ifeng.entity.Teacher;
import com.ifeng.service.TeacherService;
import com.ifeng.util.MemCachedManager;

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
	public ModelAndView list(HttpServletResponse response,String count,HttpServletRequest request) throws IOException{
		List<Category> categories = (List<Category>)MemCachedManager.getInstance().get(Instant.CATEGORY_KEY);
		ModelAndView mv = new ModelAndView("teachers");
		List<Teacher> teachers = teacherService.listForIndex(COUNT);
		mv.addObject("categories", categories);
		mv.addObject("teachers", teachers);
		return mv;
	}
}
