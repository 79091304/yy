package com.ifeng.dao;

import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.Order;

public interface OrderDao extends BaseDao<Order>{
	
	/**
	 * 查询订单
	 * @param orderid 对外订单号
	 * @return
	 */
	public Order getOrderByOrderId(String orderid);

	/**
	 * 查询订单
	 * @param orderid 对外订单号
	 * @param source 来源
	 * @return
	 */
	public Order getOrderByOrderId(String orderid,int source);
	
	/**
	 * 更新订单状态
	 * @param orderid
	 * @param state
	 * @return
	 */
	public int updateOrderState(String orderid,int state);
	/**
	 * 更新订单支付类型
	 * @param orderid
	 * @param type
	 * @return
	 */
	public int updateOrderType(String orderid,int type);
	
	/**
	 * 查询用户订单
	 * @return
	 */
	public List<Order> getOrderByUser(String userkey);
	/**
	 * 查询订单
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return
	 */
	public List<Order> getOrderByDate(String startDate,String endDate);
}
