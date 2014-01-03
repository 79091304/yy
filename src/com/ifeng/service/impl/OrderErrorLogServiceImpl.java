package com.ifeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifeng.dao.OrderErrorLogDao;
import com.ifeng.entity.OrderErrorLog;
import com.ifeng.service.OrderErrorLogService;

@Service("orderErrorLogService")
public class OrderErrorLogServiceImpl implements OrderErrorLogService {

	@Autowired
	private OrderErrorLogDao orderErrorLogDao;
	
	@Override
	public int saveOrderErrorLog(OrderErrorLog oel) {
		return orderErrorLogDao.add(oel);
	}

}
