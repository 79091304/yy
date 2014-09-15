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
	public Order getOrderByOrderId(String id);

	
	/**
	 * 更新订单状态
	 * @param orderid
	 * @param state
	 * @return
	 */
	public int updateOrderState(String orderid,int state);
	
	/**
	 * 查询订单
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return
	 */
	public List<Order> getOrderByDate(String startDate,String endDate);
}
