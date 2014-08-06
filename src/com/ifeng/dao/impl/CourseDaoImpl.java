package com.ifeng.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.CourseDao;
import com.ifeng.entity.Course;

@Repository("courseDao")
public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {

	@Override
	public List<Course> queryByC(int count) {
		Map<String , Integer> data = new HashMap<String, Integer>();
		data.put("count", count);
		return this.getSqlSession().selectList(this.getClassName()+".queryByC", data);
	}


}
