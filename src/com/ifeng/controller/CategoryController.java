package com.ifeng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ifeng.entity.Category;
import com.ifeng.service.CategoryService;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@ResponseBody
	@RequestMapping("getAll")
	public List<Category> getAll(){
		return categoryService.getAll();
	}

}
