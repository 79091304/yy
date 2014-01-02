package com.ifeng.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 订单错误日志
 * @author zhang_zhanhui
 *
 */
public class OrderErrorLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1509610515702800547L;

	private long id;
	
	private String orderid;
	
	private Date createdAt;
	
	private String message;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
}
