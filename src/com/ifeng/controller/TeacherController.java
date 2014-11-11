package com.ifeng.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Course;
import com.ifeng.entity.Teacher;
import com.ifeng.service.TeacherService;
import com.ifeng.util.PageView;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {

	
	@Autowired
	private TeacherService teacherService;
	
	/**
	 * 首页展示
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("list")
	public ModelAndView list(String sid, String pageNow, String cid,String orderby,
			HttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView("teachers");
		int now = 0;
		Teacher teacher = new Teacher();
		if (StringUtils.isNotEmpty(pageNow)) {
			now = Integer.parseInt(pageNow);
			mv.addObject("pageNow", pageNow);
		}
		PageView page = new PageView(Instant.PAGE_SIZE, now);
		List<Teacher> teachers = teacherService.pageQuery(page, teacher);
		/*//排序
		if(StringUtils.isNotEmpty(orderby)){
			CourseComparator cc = new CourseComparator();
			if("newline".equals(orderby))
				courses.sort(cc.getNewLineComparator());
			else{
				courses.sort(cc.getLikedComparator());
			}
		}*/
		page.setRecords(teachers);
		mv.addObject("sid", sid);
		mv.addObject("page", page);
		return mv;
	}
	
	/**
	 * 查看老师信息
	 * @param id
	 * @return
	 */
	@RequestMapping("getInfo")
	public ModelAndView getInfo(String id){
		ModelAndView mv = new ModelAndView("teacher");
		if(StringUtils.isNotEmpty(id)){
			Teacher teacher = teacherService.queryById(Long.parseLong(id));
			mv.addObject("teacher", teacher);
		}
		return mv;
	}
	
	/**
	 * 教师发布页面
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("publishTeacher");
		return mv;
	}
	
	/**
	 * 增加教师
	 * @param name
	 * @param age
	 * @param zone
	 * @param detail
	 * @return
	 */
	@RequestMapping("add")
	public Object add(String cname,String cage,String cid,String pro,String cty,String are,String addre,String bri,String detail,String ved,String img){
		int flag = 0;
		Teacher teacher = new Teacher();
		if (StringUtils.isNotEmpty(cname) && StringUtils.isNotEmpty(cage)
				&& StringUtils.isNotEmpty(cid) && StringUtils.isNotEmpty(pro)
				&& StringUtils.isNotEmpty(cty) && StringUtils.isNotEmpty(are)
				&& StringUtils.isNotEmpty(addre) && StringUtils.isNotEmpty(bri) && StringUtils.isNotEmpty(detail)) {
			teacher.setCreatedAt(new Date());
			teacher.setName(cname);
			teacher.setCategory(cid);
			teacher.setProvince(pro);
			teacher.setAddress(addre);
			teacher.setCity(cty);
			teacher.setArea(are);
			teacher.setVideoUrl(ved);
			teacher.setDetail(bri);
			teacher.setImgUrl(img);
			teacher.setStatus(Course.STATUS_OFF);
			teacher.setDetail(detail);
			teacher.setAge(Integer.parseInt(cage));
			flag = teacherService.add(teacher);
		}
		if (flag > 0)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}
}
