package com.ifeng.controller.cron;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.entity.Teacher;
import com.ifeng.service.TeacherService;
import com.ifeng.util.HtmlFileWriter;

@Controller
@RequestMapping("/cron/teacher/")
public class TeacherWriterController {

	private static final String TEACHER_FOR_INDEX = "teacher.html";//首页课程信息
	
	
	private static final int COUNT = 4; 
	
	@Autowired
	private TeacherService teacherService;

	private static final String ONE = "<li><div class='list-item'><a class='item-figure' href='"+Instant.WEBSITE+"/teacher/getInfo.htm?id=";
	private static final String TWO = "' target='_blank'><img src='"+Instant.WEBSITE+"/image/out.htm?uri=";
	private static final String WHREE = "' alt='";
	private static final String FORE = "'>";
	private static final String FIVE01 = "</a><div class='item-upvote'><a class='icons ' href='javascript:void(0);' rel='";
	private static final String FIVE02 = "' onclick='like_deal_v2(";
	private static final String FIVE03 =", this)'>8</a>";
	private static final String SIX = "</div><h3><a href='"+Instant.WEBSITE+"/teacher/getInfo.htm?id=";
	private static final String SEVEN = "' target='_blank'>";
	private static final String EIGHT = "</a></h3><div class='item-caption'><span class='btn-base btn-red-h20 common-sprite'><span class='common-sprite'>已认证</span></span></div><div class='progress-bar'><span class='progress bg-red' style='width: 46%;'></span></div>";
	private static final String NIGHT = "<div class='item-rate clearfix'><span class='rate1'> <em>";
	private static final String TEN = 	"46%</em><br>人气指数</span> <span class='rate3'> <em>";
	private static final String EVLEVEN = "</em><br>课程数</span></div></div></li>";
		
	
	@RequestMapping("write")
	public void writeCouresForIndex(){
		StringBuilder str = new StringBuilder();
		List<Teacher> teachers = teacherService.listForIndex(COUNT);
		for(int i=0; i< teachers.size(); i++){
			Teacher teacher = teachers.get(i);
			str.append(ONE).append(teacher.getId()).append(TWO).append(teacher.getImgUrl()).append(WHREE).append(teacher.getName())
			.append(FORE).append(FIVE01).append(6).append(FIVE02).append(16).append(FIVE03).append(SIX).append(teacher.getId())
			.append(SEVEN).append(EIGHT).append(NIGHT).append(TEN).append(3).append(EVLEVEN);
		}
		HtmlFileWriter.writeHtml(str.toString(), TEACHER_FOR_INDEX);
	}
	
	
}
