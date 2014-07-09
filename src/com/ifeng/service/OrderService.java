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
	public Order getByOrderid(String orderid);
	
	/**
	 * 查询订单
	 * @param orderid 对外订单号
	 * @return
	 */
	public Order getByOrderid(String orderid,int source);
	
	/**
	 * 订单支付
	 * @param id
	 * @return
	 */
	public int payForOrder(String orderid);
	
	/**
	 * 订单发货
	 * @param id
	 * @return
	 */
	public int sendForOrder(String orderid);
	
	/**
	 * 订单发货失败
	 * @param orderid
	 * @return
	 */
	public int sendFailForOrder(String orderid);
	
	/**
	 * 更新充值类型
	 * @param id
	 */
	public int modifyChargeType(String orderid,int type);
	
	
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
