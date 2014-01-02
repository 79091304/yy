package com.ifeng.dao;


import java.util.List;

import com.ifeng.base.BaseDao;
import com.ifeng.entity.User;


public interface UserDao extends BaseDao<User>{
	public int countUser(String userName,String userPassword);
	
	public User querySingleUser(String userName);
	
	/**
	 * 查询用户
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<User> getUserByDate(String startDate,String endDate);
}
