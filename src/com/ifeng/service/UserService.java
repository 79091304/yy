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
	
	/**
	 * 查询用户
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<User> queryOrderByDate(String startDate,String endDate);
	
	/**
	 * 检查手机是否已经注册
	 * @param phone
	 * @return
	 */
	public boolean checkPhoneIsLegal(String phone);
	
}
