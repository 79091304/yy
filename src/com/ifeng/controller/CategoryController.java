package com.ifeng.controller;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.entity.Category;
import com.ifeng.service.CategoryService;
import com.ifeng.util.MemCachedManager;

@Controller
@RequestMapping("/category/")
public class CategoryController {
	
	private MemCachedManager manager = new MemCachedManager();
	
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("getAll")
	public void getAll(){
		List<Category> categories = categoryService.getAll();
		String jsonstr = JSONObject.fromBean(categories).toString();
		manager.add(Instant.CATEGORY_KEY, jsonstr);
	}

}
