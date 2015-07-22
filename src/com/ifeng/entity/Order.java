package com.ifeng.entity;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1444863341680091247L;

	private long id;
	
	private int state;//状态
	
	private long productid;//
	
	private Date createdAt;
	
	private Date changedAt;
	
	private long userid;//用户id
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}



	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getChangedAt() {
		return changedAt;
	}

	public void setChangedAt(Date changedAt) {
		this.changedAt = changedAt;
	}

	public long getProductid() {
		return productid;
	}

	public void setProductid(long productid) {
		this.productid = productid;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	



	
}
