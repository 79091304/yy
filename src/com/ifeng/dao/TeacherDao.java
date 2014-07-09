package com.ifeng.dao;

import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.Teacher;

public interface TeacherDao extends BaseDao<Teacher> {

	/**
	 * 获取指定数量的
	 * @return
	 */
	public List<Teacher> queryByC(int count);
}
