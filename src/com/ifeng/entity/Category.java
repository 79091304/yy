package com.ifeng.entity;

import java.io.Serializable;

/**
 * 课程类别
 * @author zhang_zhanhui
 *
 */
public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5992790926253710015L;

	private long id;
	
	private String name;
	
	private int status;
	
	private String no;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	
}
