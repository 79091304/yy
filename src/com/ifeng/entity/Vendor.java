package com.ifeng.entity;

import java.util.Date;

/**
 * 供应商信息
 * @author zhangzhanhui
 *
 */
public class Vendor {
	
	private long id;
	private String frname;//法人名称
	private String phone;
	private String bussinessLicenceImgUrl;//营业执照
	private String address;//办公地
	private Date createdAt;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFrname() {
		return frname;
	}
	public void setFrname(String frname) {
		this.frname = frname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBussinessLicenceImgUrl() {
		return bussinessLicenceImgUrl;
	}
	public void setBussinessLicenceImgUrl(String bussinessLicenceImgUrl) {
		this.bussinessLicenceImgUrl = bussinessLicenceImgUrl;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
