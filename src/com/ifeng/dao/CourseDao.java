package com.ifeng.dao;


import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.Course;

public interface CourseDao extends BaseDao<Course>{

	/**
	 * 查询指定数目的
	 * @param count
	 * @return
	 */
	public List<Course> queryByC(int count);
}
