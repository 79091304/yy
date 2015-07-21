package com.ifeng.entity;

import java.util.Date;
/**
 * 产品
 * @author zhangzhanhui
 *
 */
public class Product {

	private long id;
	
	private int status;
	
	private String name;
	
	private String attribute;//产品属性 长 宽 吨位
	
	private String detail;//描述

	private Date createdAt;
	
	private String vendorid;//供应商id
	
	private String imgurl;//产品图片用","分隔开 最多四张图

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getVendorid() {
		return vendorid;
	}

	public void setVendorid(String vendorid) {
		this.vendorid = vendorid;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
}
