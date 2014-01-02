package com.ifeng.dao.impl;


import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.PvUvDao;
import com.ifeng.entity.PvUv;

@Repository("pvUvDao")
public class PvUvDaoImpl extends BaseDaoImpl<PvUv> implements PvUvDao {

	@Override
	public PvUv getByDate(int date) {
		return this.getSqlSession().selectOne("pvUv.getByDate",date);
	}

	

}
