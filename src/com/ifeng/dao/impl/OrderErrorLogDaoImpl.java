package com.ifeng.dao.impl;

import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.OrderErrorLogDao;
import com.ifeng.entity.OrderErrorLog;

@Repository("orderErrorLog")
public class OrderErrorLogDaoImpl extends BaseDaoImpl<OrderErrorLog> implements OrderErrorLogDao{

}
