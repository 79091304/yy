package com.ifeng.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 记录PVUV
 * @author zhang_zhanhui
 *
 */
public class PvUv implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6347486333133894456L;

	private long id;
	
	private int pv;
	
	private int uv;
	
	private int date;//20130202
	
	private Date createdAt;
	
	private Date changedAt;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getPv() {
		return pv;
	}

	public void setPv(int pv) {
		this.pv = pv;
	}

	public int getUv() {
		return uv;
	}

	public void setUv(int uv) {
		this.uv = uv;
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

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}
}
