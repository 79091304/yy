package com.ifeng.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.ProductDao;
import com.ifeng.entity.Product;
import com.ifeng.util.PageView;

@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao {


	@Override
	public List<Product> queryForPage(PageView page,Product product) {
		return this.query(page, product);
	}


	@Override
	public int getCount(Product product) {
		Map<String , Product> data = new HashMap<String, Product>();
		data.put("count", product);
		return this.getSqlSession().selectOne(this.getClassName()+".getCount", product);
	}


}
