package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Teacher;
import com.ifeng.util.PageView;

public interface TeacherService {

	public List<Teacher> listForIndex(int count);
	
	public int add(Teacher teacher);
	
	public Teacher queryById(long id);

	public int queryAllCount(Teacher teacher);

	public List<Teacher> pageQuery(PageView page, Teacher teacher);
}
