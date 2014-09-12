package com.ifeng.dao;


import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.Course;
import com.ifeng.util.PageView;

public interface CourseDao extends BaseDao<Course>{

	/**
	 * 查询指定数目的
	 * @param count
	 * @return
	 */
	public List<Course> queryByC(int count);
	
	/**
	 * 分页查询
	 * @return
	 */
	public List<Course> queryForPage(PageView page,Course course);
	
	/**
	 * 增加liked
	 * @param id
	 * @return
	 */
	public int increaseLiked(String id);
	
	/**
	 * 获取记录数
	 * @param course
	 * @return
	 */
	public int getCount(Course course);
}
