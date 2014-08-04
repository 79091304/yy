package com.ifeng.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.CourseDao;
import com.ifeng.entity.Course;

@Repository("courseDao")
public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {

	@Override
	public List<Course> queryByC(int count) {
		return this.getSqlSession().selectList(this.getClassName()+".queryByC", count);
	}


}
