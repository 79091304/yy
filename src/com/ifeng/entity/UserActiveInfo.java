package com.ifeng.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户登录和退出信息
 * @author zhang_zhanhui
 *
 */
public class UserActiveInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9202766890947986695L;

	private long id;
	
	private String sid;
	
	private String ip;
	
	private Date time;
	
	private String guid;
	
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	
}
