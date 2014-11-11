package com.ifeng.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;
import com.ifeng.util.PageView;
/**
 * 后台管理类
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static Log log = LogFactory.getLog(AdminController.class);
	
	@Autowired
	private CourseService courseService;
	
	/**
	 * 审核课程
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("auditCourse")
	public Object auditCourse(int id,int state){
		int updatecount = 0;
		if(0 != id && 0!= state)
		{
			log.info("审核课程，课程id:"+id+"，课程状态："+state);
			Course course = new Course();
			course.setId(id);
			course.setStatus(state);
			updatecount = courseService.modify(course);
		}
		if(updatecount >0)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}
	
	/**
	 * 课程列表
	 * @return
	 */
	@RequestMapping("auditList")
	public ModelAndView auditList(){
		ModelAndView mv = new ModelAndView("acourses");
		Course course = new Course();
		course.setStatus(Course.STATUS_ONLINE);
		PageView pager = new PageView(Instant.PAGE_SIZE, 0);
		List<Course> courses = courseService.queryPage(pager, course);
		mv.addObject("courses", courses);
		return mv;
	}
}
