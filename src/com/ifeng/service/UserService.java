package com.ifeng.service;


import java.util.List;

import com.ifeng.entity.User;
import com.ifeng.util.PageView;

public interface UserService{
	public PageView query(PageView pageView,User user);
	
	public int add(User user);
	
	public int delete(long id);
	
	public int modify(User user);
	
	public User getById(long id);
	
	public int countUser(String userName,String userPassword);
	
	public User querySingleUser(String userName);
	
	/**
	 * 查询用户
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<User> queryOrderByDate(String startDate,String endDate);
	
}
