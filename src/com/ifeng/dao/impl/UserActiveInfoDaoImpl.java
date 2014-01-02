package com.ifeng.dao.impl;


import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.UserActiveInfoDao;
import com.ifeng.entity.UserActiveInfo;

@Repository("userActiveInfoDao")
public class UserActiveInfoDaoImpl extends BaseDaoImpl<UserActiveInfo> implements UserActiveInfoDao {

	@Override
	public int saveUserInfoLogin(UserActiveInfo info) {
		return this.getSqlSession().insert(this.getClassName()+".addUserLogin", info);
	}

	@Override
	public int saveUserInfoLogout(UserActiveInfo info) {
		return this.getSqlSession().insert(this.getClassName()+".addUserLogout", info);
	}


}
