package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.ProductDao;
import com.ifeng.entity.Product;
import com.ifeng.service.ProductService;
import com.ifeng.util.PageView;

@Repository("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	

	@Override
	public List<Product> listForIndex(int count) {
		return productDao.queryByC(count);
	}

	@Override
	public Product getProduct(long id) {
		return productDao.getById(id);
	}

	@Override
	public List<Product> queryPage(PageView page,Product product) {
		return productDao.query(page, product);
	}

	@Override
	public int save(Product product) {
		return productDao.add(product);
	}

	@Override
	public int liked(String id) {
		return productDao.increaseLiked(id);
	}

	@Override
	public int queryAllCount(Product product) {
		return productDao.getCount(product);
	}

	@Override
	public int modify(Product product) {
		return this.productDao.modify(product);
	}


}
