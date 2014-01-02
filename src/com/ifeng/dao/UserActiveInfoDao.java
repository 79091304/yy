package com.ifeng.dao;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.UserActiveInfo;

public interface UserActiveInfoDao extends BaseDao<UserActiveInfo>{

	/**
	 * 保存用户登录信息
	 * @param info
	 * @return
	 */
	public int saveUserInfoLogin(UserActiveInfo info);
	
	/**
	 * 保存用户退出信息
	 * @param info
	 * @return
	 */
	public int saveUserInfoLogout(UserActiveInfo info);
}
