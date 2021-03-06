package com.ifeng.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
import com.ifeng.util.CookieHelper;
import com.ifeng.util.PageView;

@Controller
@RequestMapping("/course/")
public class CourseController {

	
	private static Log log = LogFactory.getLog(CourseController.class);
	
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
	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public ModelAndView list(String sid, String pageNow, String cid,String orderby,
			HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView("courses");
		int now = 0;
		int pstatus = -1;
		Course course = new Course();
		if (StringUtils.isNotEmpty(pageNow)) {
			now = Integer.parseInt(pageNow);
		}
		if (StringUtils.isNotEmpty(sid)) {
			pstatus = Integer.parseInt(sid);
		}
		course.setStatus(pstatus);
		if (StringUtils.isNotEmpty(cid)) {
			course.setCategory(cid);
		}
		PageView pager = new PageView(Instant.PAGE_SIZE, now);
		List<Course> courses = courseService.queryPage(pager, course);
		//排序
		if(StringUtils.isNotEmpty(orderby)){
			CourseComparator cc = new CourseComparator();
			if("newline".equals(orderby))
				courses.sort(cc.getNewLineComparator());
			else{
				courses.sort(cc.getLikedComparator());
			}
		}
		pager.setRecords(courses);
		mv.addObject("sid", sid);
		mv.addObject("pager", pager);
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
	public Object saveCourse(HttpServletRequest request, String cname,
			String cdays, String cid, String pro, String cty, String are,
			String addre, String ved, String bri, String img,String uname,String uid,String detail) {
		log.info("保存课程，课程名称："+cname+",课时:"+cdays+",类别:"+cid+"，省份："+pro+"，城市："+cty+"，地区："+are+"，地址："+addre+"，ved:"+ved+"简介："+bri+"，图片"+img+",用户名："+uname);
		int flag = 0;
		Course course = new Course();
		if (StringUtils.isNotEmpty(cname) && StringUtils.isNotEmpty(cdays)
				&& StringUtils.isNotEmpty(cid) && StringUtils.isNotEmpty(pro)
				&& StringUtils.isNotEmpty(cty) && StringUtils.isNotEmpty(are)
				&& StringUtils.isNotEmpty(addre) && StringUtils.isNotEmpty(bri) && StringUtils.isNotEmpty(detail)) {
			course.setCreatedAt(new Date());
			course.setName(cname);
			course.setCategory(cid);
			course.setProvince(pro);
			course.setAddress(addre);
			course.setCity(cty);
			course.setArea(are);
			course.setVideoUrl(ved);
			course.setBrief(bri);
			course.setImgUrl(img);
			course.setCreatedBy(uname);
			course.setTeacherId(uid);
			course.setStatus(Course.STATUS_OFF);
			course.setDetail(detail);
			course.setPeriod(Integer.parseInt(cdays));
			flag = courseService.save(course);
		}
		if (flag > 0)
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
		String uid = CookieHelper.getValue(Instant.COOKIE_USERID, request);
		if (StringUtils.isNotEmpty(uid)) {
			mv.setViewName("publish");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	/**
	 * 喜欢
	 * 
	 * @param id
	 */
	@ResponseBody
	@RequestMapping("like")
	public Object like(String id) {
		int result = this.courseService.liked(id);
		if (result > 0)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}

}
