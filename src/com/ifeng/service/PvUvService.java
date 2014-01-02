package com.ifeng.service;

import com.ifeng.entity.PvUv;

public interface PvUvService {

	public int savePvUv(PvUv pvUv);
	
	/**
	 * 查询PVUV
	 * @param date日期
	 * @return
	 */
	public PvUv queryByDate(int date);
	
	/**
	 * 
	 * @param pvuv
	 * @return
	 */
	public int modifyPvUv(PvUv pvuv);
}
