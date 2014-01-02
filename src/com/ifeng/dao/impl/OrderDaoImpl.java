package com.ifeng.dao.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.OrderDao;
import com.ifeng.entity.Order;
import com.ifeng.util.DateUtils;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao {

	@Override
	public Order getOrderByOrderId(String orderid) {
		return this.getSqlSession().selectOne(this.getClassName()+".getByOrderid", orderid);
	}

	@Override
	public int updateOrderState(String orderid, int state) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("state", state);
		map.put("orderid", orderid);
		map.put("changedAt", new Date());
		return this.getSqlSession().update(this.getClassName()+".updateState", map);
	}

	@Override
	public int updateOrderType(String orderid, int type) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("type", type);
		map.put("orderid", orderid);
		map.put("changedAt", new Date());
		return this.getSqlSession().update(this.getClassName()+".updateType", map);
	}

	@Override
	public List<Order> getOrderByUser(String userkey) {
		return this.getSqlSession().selectList(this.getClassName()+".getByUserkey", userkey);
	}

	@Override
	public List<Order> getOrderByDate(String startDate, String endDate) {
		Map<String,Date> data = new HashMap<String, Date>();
		if(StringUtils.isNotEmpty(startDate)){
			data.put("startDate", DateUtils.parseStringToDate(startDate));
		}else{
			data.put("startDate", new Date());
		}
		if(StringUtils.isNotEmpty(endDate)){
			data.put("endDate", DateUtils.parseStringToDate(endDate));
		}else{
			data.put("endDate", new Date());
		}
		return this.getSqlSession().selectList(this.getClassName()+".getByDate", data);
	}



}
