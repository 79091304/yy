package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.TeacherDao;
import com.ifeng.entity.Teacher;
import com.ifeng.service.TeacherService;
import com.ifeng.util.PageView;

@Repository("teacherService")
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherDao teacherDao;

	@Override
	public List<Teacher> listForIndex(int count) {
		return teacherDao.queryByC(count);
	}

	@Override
	public int add(Teacher teacher) {
		return teacherDao.add(teacher);
	}

	@Override
	public Teacher queryById(long id) {
		return teacherDao.getById(id);
		
	}

	@Override
	public int queryAllCount(Teacher teacher) {
		return 0;
	}

	@Override
	public List<Teacher> pageQuery(PageView page, Teacher teacher) {
		return teacherDao.query(page, teacher);
	}

	
}
