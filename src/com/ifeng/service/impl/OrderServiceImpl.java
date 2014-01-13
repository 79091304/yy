package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifeng.common.Instant;
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
	public int payForOrder(String orderid) {
		return orderDao.updateOrderState(orderid, Instant.ORDER_PAYED);
	}

	@Override
	public int sendForOrder(String orderid) {
		return orderDao.updateOrderState(orderid, Instant.ORDER_SENDED);
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
	public Order getByOrderid(String orderid,int source) {
		return orderDao.getOrderByOrderId(orderid,source);
	}

	@Override
	public int sendFailForOrder(String orderid) {
		return orderDao.updateOrderState(orderid, Instant.ORDER_SEND_FAILD);
	}

	@Override
	public List<Order> queryOrderByUser(String userkey) {
		return orderDao.getOrderByUser(userkey);
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
