package com.ifeng.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Course;
import com.ifeng.entity.User;
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
	 * 
	 * @param response
	 * @param count
	 *            展示的数量
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("list")
	public ModelAndView list(String sid, String pageNow, String cid,
			HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView("courses");
		int now = 0;
		int pstatus = -1;
		Course course = new Course();
		if (StringUtils.isNotEmpty(pageNow)) {
			now = Integer.parseInt(pageNow);
			mv.addObject("pageNow", pageNow);
		}
		if (StringUtils.isNotEmpty(sid)) {
			pstatus = Integer.parseInt(sid);
			course.setScount(pstatus);
		}
		if (StringUtils.isNotEmpty(cid)) {
			course.setCategory(cid);
		}
		PageView page = new PageView(Instant.PAGE_SIZE, now);
		int rowCount = courseService.queryAllCount(course);//总条数
		int pageCount = rowCount % Instant.PAGE_SIZE == 0 ? rowCount/Instant.PAGE_SIZE : (rowCount/Instant.PAGE_SIZE +1);//总页数
		mv.addObject("pageCount", pageCount);
		List<Course> courses = courseService.listForPage(page, course);
		mv.addObject("sid", sid);
		mv.addObject("courses", courses);
		return mv;
	}

	/**
	 * 查询课程信息
	 * 
	 * @param id
	 * @param request
	 */
	@RequestMapping("getInfo")
	public ModelAndView getInfo(long id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("course");
		if (0 != id) {
			Course course = courseService.getCourse(id);
			if (null != course)
				mv.addObject("course", course);
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping("save")
	public Object saveCourse(HttpServletRequest request,String cname, String cdays, String cid,
			String pro, String cty, String are, String addre, String ved,
			String bri, String img) {
		int flag = 0;
		Course course = new Course();
		if (StringUtils.isNotEmpty(cname) && StringUtils.isNotEmpty(cdays)
				&& StringUtils.isNotEmpty(cid) && StringUtils.isNotEmpty(pro)
				&& StringUtils.isNotEmpty(cty) && StringUtils.isNotEmpty(are)
				&& StringUtils.isNotEmpty(addre) && StringUtils.isNotEmpty(bri)) {
			User user = (User)request.getAttribute("user");
			course.setName(cname);
			course.setCategory(cid);
			course.setProvince(pro);
			course.setAddress(addre);
			course.setCity(cty);
			course.setArea(are);
			course.setVideoUrl(ved);
			course.setDetail(bri);
			course.setImgUrl(img);
			//course.setCreatedBy(user.getUsername());
			flag = courseService.save(course);
		}
		if(flag >0)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}

	/**
	 * 预发布 跳转到提示页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("prepublish")
	public ModelAndView prepublish(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String uid = CookieHelper.getValue(Instant.COOKIE_USERID, request);
		if (StringUtils.isEmpty(uid)) {
			mv.setViewName("nologin");
		} else {
			mv.setViewName("publish");
		}
		return mv;
	}

	/**
	 * 跳转到发布页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("publish")
	public ModelAndView publish(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		/*
		 * String uid = CookieHelper.getValue(Instant.COOKIE_USERID, request);
		 * if(StringUtils.isNotEmpty(uid)){ mv.setViewName("publish"); }else{
		 * mv.setViewName("login"); }
		 */

		mv.setViewName("publish");

		return mv;
	}
	
	/**
	 * 喜欢
	 * @param id
	 */
	@ResponseBody
	@RequestMapping("like")
	public Object like(String id){
		int result = this.courseService.liked(id);
		if(result >0 )
				return ResponseMessage.SUCCESS;
			return ResponseMessage.FAIL;
	}
	
}
