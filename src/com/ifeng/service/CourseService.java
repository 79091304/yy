package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Course;
import com.ifeng.util.PageView;

public interface CourseService {

	public List<Course> listForIndex(int count);
	
	public List<Course> queryPage(PageView page,Course course);
	
	/**
	 * 查询总记录数
	 * @param course
	 * @return
	 */
	public int queryAllCount(Course course);
	
	
	public Course getCourse(long id);
	
	public int save(Course course);
	
	/**
	 * 修改课程
	 * @param course
	 * @return
	 */
	public int modify(Course course);
	
	/**
	 * 喜欢
	 * @param id
	 * @return
	 */
	public int liked(String id);
}
