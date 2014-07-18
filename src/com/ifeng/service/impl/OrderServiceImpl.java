package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifeng.dao.OrderDao;
import com.ifeng.entity.Order;
import com.ifeng.service.OrderService;
/**
 * 订单服务类
 * @author zhang_zhanhui
 *
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public int createOrder(Order order) {
		return orderDao.add(order);
	}


	@Override
	public int modifyChargeType(String orderid,int type) {
		return orderDao.updateOrderType(orderid, type);
	}

	@Override
	public Order getByOrderid(String orderid) {
		return orderDao.getOrderByOrderId(orderid);
	}
	



	@Override
	public List<Order> queryOrderByDate(String startDate, String endDate) {
		return orderDao.getOrderByDate(startDate, endDate);
	}

	@Override
	public int queryCountByDate(String startDate, String endDate) {
		return orderDao.getOrderByDate(startDate, endDate).size();
	}


}
