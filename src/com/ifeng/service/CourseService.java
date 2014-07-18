package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Course;

public interface CourseService {

	public List<Course> listForIndex(int count);
	
	
	public Course getCourse(long id);
}
