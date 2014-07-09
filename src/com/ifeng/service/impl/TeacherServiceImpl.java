package com.ifeng.service.impl;

import org.springframework.stereotype.Repository;

import com.ifeng.dao.TeacherDao;
import com.ifeng.service.TeacherService;

@Repository("teacherService")
public class TeacherServiceImpl implements TeacherService {

	private TeacherDao teacherDao;
	
}
