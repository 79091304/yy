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
		ModelAndView mv = new ModelAndView("courses");
		int now = 0;
		int pstatus = -1;
		Teacher teacher = new Teacher();
		if (StringUtils.isNotEmpty(pageNow)) {
			now = Integer.parseInt(pageNow);
			mv.addObject("pageNow", pageNow);
		}
		
		
		PageView page = new PageView(Instant.PAGE_SIZE, now);
		int rowCount = teacherService.queryAllCount(teacher);// 总条数
		int pageCount = rowCount % Instant.PAGE_SIZE == 0 ? rowCount
				/ Instant.PAGE_SIZE : (rowCount / Instant.PAGE_SIZE + 1);// 总页数
		mv.addObject("pageCount", pageCount);
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
		mv.addObject("sid", sid);
		mv.addObject("teachers", teachers);
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
	 * 增加教师
	 * @param name
	 * @param age
	 * @param zone
	 * @param detail
	 * @return
	 */
	@RequestMapping("add")
	public Object add(String name,String age,String zone,String detail){
		Teacher teacher = new Teacher();
		teacher.setAge(Integer.parseInt(age));
		teacher.setName(name);
		teacher.setZone(zone);
		teacher.setDetail(detail);
		int result = teacherService.add(teacher);
		if(result >0){
			return ResponseMessage.SUCCESS;
		}else{
			return ResponseMessage.FAIL;
		}
	}
}
