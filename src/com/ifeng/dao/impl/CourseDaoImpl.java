package com.ifeng.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.CourseDao;
import com.ifeng.entity.Course;
import com.ifeng.util.PageView;

@Repository("courseDao")
public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {

	@Override
	public List<Course> queryByC(int count) {
		return this.getSqlSession().selectList(this.getClassName()+".queryByC", count);
	}

	@Override
	public List<Course> queryForPage(PageView page,Course course) {
		return this.query(page, course);
	}

	@Override
	public int increaseLiked(String id) {
		return this.getSqlSession().update(this.getClassName()+".liked", id);
	}

	@Override
	public int getCount(Course course) {
		Map<String , Course> data = new HashMap<String, Course>();
		data.put("count", course);
		return this.getSqlSession().selectOne(this.getClassName()+".getCount", course);
	}


}
