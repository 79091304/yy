package com.ifeng.dao.impl;


import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.CourseDao;
import com.ifeng.entity.Course;

@Repository("courseDao")
public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {


}
