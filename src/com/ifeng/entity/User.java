package com.ifeng.entity;

import java.util.Date;

/**
 * 用户实体表
 */
@SuppressWarnings("serial")
public class User implements java.io.Serializable {
	
	public static final int TYPE_VISITOR = 0;
	
	public static final int TYPE_TEACHER = 1;
	
	public static final int TYPE_PARENT = 2;
	
	private long id;
	
	private String username;
	
	private String password;
	
	private String email;
	
	private String phone;
	
	private int state; 
	
	private Date createdAt;
	
	private Date changedAt;
	
	private int type;
	
	private String verify;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
