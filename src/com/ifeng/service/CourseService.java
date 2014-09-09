package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Course;
import com.ifeng.util.PageView;

public interface CourseService {

	public List<Course> listForIndex(int count);
	
	public List<Course> listForPage(PageView page,Course course);
	
	public Course getCourse(long id);
	
	public int save(Course course);
}
