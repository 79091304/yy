package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.TeacherDao;
import com.ifeng.entity.Teacher;
import com.ifeng.service.TeacherService;

@Repository("teacherService")
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherDao teacherDao;

	@Override
	public List<Teacher> listForIndex(int count) {
		return teacherDao.queryByC(count);
	}

	
}
