package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Product;
import com.ifeng.util.PageView;

public interface ProductService {

	public List<Product> listForIndex(int count);

	public List<Product> queryPage(PageView page, Product product);

	/**
	 * 查询总记录数
	 * 
	 * @param product
	 * @return
	 */
	public int queryAllCount(Product product);

	public Product getProduct(long id);

	public int save(Product product);

	/**
	 * 修改课程
	 * 
	 * @param product
	 * @return
	 */
	public int modify(Product product);

}
