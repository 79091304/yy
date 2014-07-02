package com.ifeng.dao;


import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.User;


public interface UserDao extends BaseDao<User>{
	
	public int countUser(String userName,String userPassword);
	
	public User queryByUsername(String username);
	
	/**
	 * 查询用户
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<User> getUserByDate(String startDate,String endDate);
	
	/**
	 * 根据手机号获取用户信息
	 * @param phone
	 * @return
	 */
	public User queryByPhone(String phone);
}
