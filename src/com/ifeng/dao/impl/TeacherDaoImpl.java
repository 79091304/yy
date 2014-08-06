package com.ifeng.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.TeacherDao;
import com.ifeng.entity.Teacher;

@Repository("teacherDao")
public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements TeacherDao {

	@Override
	public List<Teacher> queryByC(int count) {
		Map<String,Integer> data = new HashMap<String,Integer>();
		data.put("count", count);
		return this.getSqlSession().selectList(this.getClassName()+".queryByC", data);
	}

	

}
