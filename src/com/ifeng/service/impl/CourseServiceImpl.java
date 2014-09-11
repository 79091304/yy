package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.CourseDao;
import com.ifeng.entity.Course;
import com.ifeng.service.CourseService;
import com.ifeng.util.PageView;

@Repository("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDao courseDao;

	@Override
	public List<Course> listForIndex(int count) {
		return courseDao.queryByC(count);
	}

	@Override
	public Course getCourse(long id) {
		return courseDao.getById(id);
	}

	@Override
	public List<Course> listForPage(PageView page,Course course) {
		return courseDao.query(page, course);
	}

	@Override
	public int save(Course course) {
		return courseDao.add(course);
	}

	@Override
	public int liked(String id) {
		return courseDao.increaseLiked(id);
	}

}
