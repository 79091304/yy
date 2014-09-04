package com.ifeng.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;
import com.ifeng.util.CookieHelper;
import com.ifeng.util.PageView;

@Controller
@RequestMapping("/course/")
public class CourseController {
	
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
	public ModelAndView listForIndex(String status,String pageNow,String cid,HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("courses");
		int now = 0;
		int pstatus = -1;
		Course course = new Course();
		if(StringUtils.isNotEmpty(pageNow)){
			now = Integer.parseInt(pageNow);
		}
		if(StringUtils.isNotEmpty(status)){
			pstatus = Integer.parseInt(status);
			course.setScount(pstatus);
		}
		if(StringUtils.isNotEmpty(cid)){
			course.setCategory(cid);
		}
		PageView page = new PageView(Instant.PAGE_SIZE, now);
		List<Course> courses =courseService.listForPage(page, course);
		mv.addObject("courses", courses);
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
		if(0 != id){
			Course course = courseService.getCourse(id);
			if(null != course)
			mv.addObject("course", course);
		}
		return mv;
	}
	
	/**
	 * 预发布 跳转到提示页面
	 * @param request
	 * @return
	 */
	@RequestMapping("prepublish")
	public ModelAndView prepublish(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String uid = CookieHelper.getValue(Instant.COOKIE_USERID, request);
		if(StringUtils.isEmpty(uid)){
			mv.setViewName("nologin");
		}else{
			mv.setViewName("publish");
		}
		return mv;
	}
	
	/**
	 * 跳转到发布页面
	 * @param request
	 * @return
	 */
	@RequestMapping("publish")
	public ModelAndView publish(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String uid = CookieHelper.getValue(Instant.COOKIE_USERID, request);
		if(StringUtils.isNotEmpty(uid)){
			mv.setViewName("publish");
		}else{
			mv.setViewName("login");
		}
		return mv;
	}
}
