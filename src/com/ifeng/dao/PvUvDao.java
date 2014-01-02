package com.ifeng.dao;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.PvUv;

public interface PvUvDao extends BaseDao<PvUv>{

	/**
	 * 查询PVUV
	 * @param date 20120213
	 * @return
	 */
	public PvUv getByDate(int date);
}
