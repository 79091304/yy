package com.ifeng.dao;


import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.Product;
import com.ifeng.util.PageView;

public interface ProductDao extends BaseDao<Product>{

	
	/**
	 * 分页查询
	 * @return
	 */
	public List<Product> queryForPage(PageView page,Product product);
	
	
	/**
	 * 获取记录数
	 * @param product
	 * @return
	 */
	public int getCount(Product product);
}
