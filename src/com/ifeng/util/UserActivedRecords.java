package com.ifeng.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.ifeng.common.Instant;
import com.ifeng.dao.UserActiveInfoDao;
import com.ifeng.dao.impl.UserActiveInfoDaoImpl;
import com.ifeng.entity.UserActiveInfo;
/*
 * 用户登录退出信息缓存
 */
public  class UserActivedRecords {
	
	
	public static List<UserActiveInfo> LoginUserInfo = new ArrayList<UserActiveInfo>();
	
	public static List<UserActiveInfo> LogoutUserInfo = new ArrayList<UserActiveInfo>();
	
	private static BlockingQueue<UserActiveInfo> loginQueue = new ArrayBlockingQueue<UserActiveInfo>(50);
	
	private static BlockingQueue<UserActiveInfo> logoutQueue = new ArrayBlockingQueue<UserActiveInfo>(50);
	
	
	private  UserActiveInfoDao userActiveInfoDao;
	
	public UserActivedRecords(UserActiveInfoDao userActiveInfoDao ){
		this.userActiveInfoDao = userActiveInfoDao;
	}
	
	/**
	 * 将登录信息持久化到DB
	 * @param data
	 * @param flag 
	 */
	public void flushLoginToBlockQueue(){
		Logger log = Logger.getLogger(UserActivedRecords.class);
		List<UserActiveInfo> delList = new ArrayList<UserActiveInfo>();
		if(!LoginUserInfo.isEmpty()){
			log.info("将登录信息推送到队列");
			int size = LoginUserInfo.size();
			for(int i=0; i<size; i++){
				UserActiveInfo udi = LoginUserInfo.get(i);
				if(loginQueue.offer(udi)){
					delList.add(udi);
				}else{
					break;
				}
			}
			LoginUserInfo.removeAll(delList);
			
			while(loginQueue.iterator().hasNext()){
				log.info("将登录信息持久化到DB");
				UserActiveInfo qud = loginQueue.poll();
				if(null != qud)
					userActiveInfoDao.saveUserInfoLogin(qud);
			}
		}
	}
	
	/**
	 * 将用户退出信息持久化到DB
	 * @param data
	 * @param flag 
	 */
	public  void flushLogoutToBlockQueue(){
		Logger log = Logger.getLogger(UserActivedRecords.class);
		List<UserActiveInfo> delList = new ArrayList<UserActiveInfo>();
		if(!LogoutUserInfo.isEmpty()){
			log.info("将用户退出信息推送到队列");
			int size = LogoutUserInfo.size();
			for(int i=0; i<size; i++){
				UserActiveInfo udi = LogoutUserInfo.get(i);
				if(logoutQueue.offer(udi)){
					delList.add(udi);
				}else{
					break;
				}
			}
			
			LogoutUserInfo.removeAll(delList);
			
			while(logoutQueue.iterator().hasNext()){
				log.info("将用户退出信息持久化到DB");
				UserActiveInfo qud = logoutQueue.poll();
				if(null != qud){
					userActiveInfoDao.saveUserInfoLogout(qud);
				}
			}
		}
	}
	
	/**
	 * 将用户信息封装成实体
	 * @param sid 
	 * @param guid
	 * @param ip
	 * @param true 登录用户 false 退出用户
	 */
	public static void pushUserCache(String sid,String guid,String ip,boolean flag){
		if(StringUtils.isEmpty(sid)){
			return;
		}
		UserActiveInfo udi = new UserActiveInfo();
		udi.setSid(sid);
		if(StringUtils.isNotEmpty(guid)){
			udi.setGuid(guid);
		}else{
			udi.setGuid(Instant.GUID_EMPTY);
		}
		udi.setTime(new Date());
		udi.setIp(ip);
		if(flag)
			LoginUserInfo.add(udi);
		else
			LogoutUserInfo.add(udi);
	}
}
