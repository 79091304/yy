package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.CourseDao;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;

@Repository("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDao courseDao;

	@Override
	public List<Course> listForIndex(int count) {
		return courseDao.queryByC(count);
	}

}
