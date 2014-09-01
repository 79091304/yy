package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.CategoryDao;
import com.ifeng.entity.Category;
import com.ifeng.service.CategoryService;

@Repository("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> getAll() {
		return categoryDao.queryAll(null);
	}
	
	
}
