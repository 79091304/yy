package com.ifeng.dao.impl;


import java.util.List;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.TeacherDao;
import com.ifeng.entity.Teacher;

public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements TeacherDao {

	@Override
	public List<Teacher> queryByC(int count) {
		return this.getSqlSession().selectList(this.getClassName()+".queryByC", count);
	}

	

}
