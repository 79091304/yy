package com.ifeng.controller.cron;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;
import com.ifeng.util.HtmlFileWriter;

@Controller
@RequestMapping("/cron/course/")
public class CourseWriterController {

	private static final String COURSE_FOR_INDEX = "course.html";//首页课程信息
	
	private StringBuilder courseStr = new StringBuilder();
	
	private static final int COUNT = 4; 
	
	@Autowired
	private CourseService courseService;

	private static final String ONE = "<li><div class='list-item'><a class='item-figure' href='"+Instant.WEBSITE+"/course/getInfo.htm?id=";
	private static final String TWO = "' target='_blank'><img src='"+Instant.WEBSITE+"/image/out.htm?uri=";
	private static final String WHREE = "' alt='";
	private static final String FORE = "'>";
	private static final String FIVE01 = "</a><div class='item-upvote'><a class='icons ' href='javascript:void(0);' rel='";
	private static final String FIVE02 = "' onclick='like_deal_v2(";
	private static final String FIVE03 =", this)'>8</a>";
	private static final String SIX = "</div><h3><a href='"+Instant.WEBSITE+"/course/getInfo.htm?id=";
	private static final String SEVEN = "' target='_blank'>";
	private static final String EIGHT = "</a></h3><div class='item-caption'><span class='btn-base btn-red-h20 common-sprite'><span class='common-sprite'>已认证</span></span></div><div class='progress-bar'><span class='progress bg-red' style='width: 46%;'></span></div>";
	private static final String NIGHT = "<div class='item-rate clearfix'><span class='rate1'> <em>";
	private static final String TEN = 	"46%</em><br>好评度</span> <span class='rate3'> <em>";
	private static final String EVLEVEN = "</em><br>报名人数</span></div></div></li>";
		
	
	@RequestMapping("write")
	public void writeCouresForIndex(){
		List<Course> courses = courseService.listForIndex(COUNT);
		for(int i=0; i< courses.size(); i++){
			Course course = courses.get(i);
			courseStr.append(ONE).append(course.getId()).append(TWO).append(course.getImgUrl()).append(WHREE).append(course.getName())
			.append(FORE).append(FIVE01).append(course.getLiked()).append(FIVE02).append(course.getLiked()).append(FIVE03).append(SIX).append(course.getId())
			.append(SEVEN).append(EIGHT).append(NIGHT).append(TEN).append(course.getScount()).append(EVLEVEN);
		}
		HtmlFileWriter.writeHtml(courseStr.toString(), COURSE_FOR_INDEX);
	}
	
	
}
