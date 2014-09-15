package com.ifeng.service;

import java.util.List;

import com.ifeng.entity.Order;

public interface OrderService {

	/**
	 * 创建订单
	 * @param order
	 */
	public int createOrder(Order order);
	
	/**
	 * 查询订单
	 * @param orderid 对外订单号
	 * @return
	 */
	public Order getByOrderid(String id);
	
	/**
	 * 根据时间查询订单
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<Order> queryOrderByDate(String startDate,String endDate);
	/**
	 * 根据时间查询订单数量
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public int queryCountByDate(String startDate,String endDate);
}
