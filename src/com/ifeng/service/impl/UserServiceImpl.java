package com.ifeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ifeng.dao.UserDao;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;
import com.ifeng.util.PageView;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public PageView query(PageView pageView, User user) {
		List<User> list = userDao.query(pageView, user);
		pageView.setRecords(list);
		return pageView;
	}

	public int add(User user) {
		return userDao.add(user);
	}

	public int  delete(long id) {
		return userDao.delete(id);
		
	}

	public User getById(long id) {
		return userDao.getById(id);
	}

	public int modify(User user) {
		return userDao.modify(user);
	}

	public int countUser(String userName, String userPassword) {
		return userDao.countUser(userName, userPassword);
	}

	

	@Override
	public List<User> queryOrderByDate(String startDate, String endDate) {
		return userDao.getUserByDate(startDate, endDate);	
	}

	@Override
	public boolean checkPhoneIsLegal(String phone) {
		User user = userDao.queryByPhone(phone);
		if(null == user)
			return true;
		return false;
	}


}
