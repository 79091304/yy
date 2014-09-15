package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Course;
import com.ifeng.util.PageView;

public interface CourseService {

	public List<Course> listForIndex(int count);
	
	public List<Course> listForPage(PageView page,Course course);
	
	/**
	 * 查询总记录数
	 * @param course
	 * @return
	 */
	public int queryAllCount(Course course);
	
	
	public Course getCourse(long id);
	
	public int save(Course course);
	
	/**
	 * 喜欢
	 * @param id
	 * @return
	 */
	public int liked(String id);
}
