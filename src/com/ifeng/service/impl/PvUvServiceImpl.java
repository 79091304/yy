package com.ifeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifeng.dao.PvUvDao;
import com.ifeng.entity.PvUv;
import com.ifeng.service.PvUvService;

@Service("pvUvService")
public class PvUvServiceImpl implements PvUvService{

	@Autowired
	private PvUvDao pvUvDao;
	
	@Override
	public int savePvUv(PvUv pvUv) {
		return pvUvDao.add(pvUv);
	}

	@Override
	public PvUv queryByDate(int date) {
		return pvUvDao.getByDate(date);
	}

	@Override
	public int modifyPvUv(PvUv pvuv) {
		return pvUvDao.modify(pvuv);
	}

}
