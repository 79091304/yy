package com.ifeng.controller;

import java.util.Date;
import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Category;
import com.ifeng.service.CategoryService;
import com.ifeng.util.MemCachedManager;

@Controller
@RequestMapping("/category/")
public class CategoryController {
	
	private MemCachedManager manager = new MemCachedManager();
	
	@Autowired
	private CategoryService categoryService;


	/**
	 * 将种类信息存入缓存
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pushcache")
	public Object pushcache(){
		List<Category> categories = categoryService.getAll();
		boolean flag = manager.add(Instant.CATEGORY_KEY, categories,new Date("2100 12 12"));
		if(flag)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}

	@RequestMapping("getAll")
	public Object getAll(){
		List<Category> categories = (List<Category>)manager.get(Instant.CATEGORY_KEY);
		return categories;
	}
	
}
