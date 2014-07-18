package com.ifeng.controller.cron;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;
import com.ifeng.util.HtmlFileWriter;

@Controller
@RequestMapping("/courseWriter/")
public class CourseWriterController {

	private static final String COURSE_FOR_INDEX = "";//首页课程信息
	
	private StringBuilder courseStr = new StringBuilder();
	
	private static final int COUNT = 4; 
	
	@Autowired
	private CourseService courseService;

	private static final String ONE = "<li><div class='list-item'><a class='item-figure' href='";
	private static final String TWO = "' target='_blank'><img src='";
	private static final String WHREE = "' alt='";
	private static final String FORE = "'>";
	private static final String FIVE = "</a><div class='item-upvote'><a class='icons ' href='javascript:void(0);' rel='8' onclick='like_deal_v2(3032, this)'>8</a>";
	private static final String SIX = "</div><h3><a href='";
	private static final String SEVEN = "' target='_blank'>";
	private static final String EIGHT = "</a></h3><div class='item-caption'><span class='caption-title'>";
	private static final String NIGHT = "<em>11天</em> <em><i class='font-yen'>¥</i>3000</em></span> <span class='btn-base btn-red-h20 common-sprite'> <span class='common-sprite'>众筹中</span>";
	private static final String TEN = "</span></div><div class='progress-bar'><span class='progress bg-red' style='width: 0%;'></span></div><div class='item-rate clearfix'>";	
	private static final String EVLEVEN = "<span class='rate1'> <em>0%</em><br>好评度</span> <span class='rate2'> <em><a>报名</a></em><br></span> <span class='rate3'> <em>9天</em><br>剩余时间</span></div></div></li>";
		
	
	public void writeCouresForIndex(){
		List<Course> courses = courseService.listForIndex(COUNT);
		for(int i=0; i< courses.size(); i++){
			Course course = courses.get(i);
			courseStr.append(ONE).append(Instant.COURSEWEBSITE+course.getId()).append(TWO);
		}
		HtmlFileWriter.writeHtml(courseStr.toString(), COURSE_FOR_INDEX);
	}
	
	
}
