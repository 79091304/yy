package com.ifeng.dao;


import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.Product;
import com.ifeng.util.PageView;

public interface ProductDao extends BaseDao<Product>{

	/**
	 * 查询指定数目的
	 * @param count
	 * @return
	 */
	public List<Product> queryByC(int count);
	
	/**
	 * 分页查询
	 * @return
	 */
	public List<Product> queryForPage(PageView page,Product product);
	
	/**
	 * 增加liked
	 * @param id
	 * @return
	 */
	public int increaseLiked(String id);
	
	/**
	 * 获取记录数
	 * @param product
	 * @return
	 */
	public int getCount(Product product);
}
