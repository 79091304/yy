package com.ifeng.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.ifeng.base.impl.BaseDaoImpl;
import com.ifeng.dao.UserDao;
import com.ifeng.entity.User;
import com.ifeng.util.DateUtils;
import com.ifeng.util.Md5Tool;


@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao
{

	public int countUser(String username, String password) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("username", username);
		map.put("password", password);
		return (Integer)getSqlSession().selectOne(this.getClassName()+".countUser",map);
	}

	public User queryByUsername(String username) {
		return (User)getSqlSession().selectOne(this.getClassName()+".queryByUsername",username);
	}

	@Override
	public List<User> getUserByDate(String startDate, String endDate) {
		Map<String,String> data = new HashMap<String, String>();
		if(!StringUtils.isEmpty(startDate)){
			data.put("startDate",startDate);
		}
		else{
			data.put("startDate", DateUtils.getCurrentDate());
		}
		if(!StringUtils.isEmpty(endDate)){
			data.put("endDate", endDate);
		}else{
			data.put("endDate", DateUtils.getCurrentDate());
		}
		
		return getSqlSession().selectList(this.getClassName()+".getByDate",data);
	}

	@Override
	public User queryByPhone(String phone) {
		return getSqlSession().selectOne(this.getClassName()+".getByPhone",phone);
	}

	@Override
	public User queryByPassword(String username,String email ,String phone,String password) {
		Map<String,String> data = new HashMap<String, String>();
		if(StringUtils.isNotEmpty(username)){
			data.put("username",username);
		}
		if(StringUtils.isNotEmpty(email)){
			data.put("email", email);
		}
		if(StringUtils.isNotEmpty(phone)){
			data.put("phone", phone);
		}
		if(StringUtils.isNotEmpty(password)){
			data.put("password", Md5Tool.getMd5(password));
		}
		return getSqlSession().selectOne(this.getClassName()+".queryByPassword",data);
	}

	
}
