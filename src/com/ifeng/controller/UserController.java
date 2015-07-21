package com.ifeng.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.entity.Order;
import com.ifeng.entity.User;
import com.ifeng.service.OrderService;
import com.ifeng.service.UserService;
import com.ifeng.util.AesSec;
import com.ifeng.util.MD5Sec;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * 用户中心
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("user");
		return mv;
	}

	@ResponseBody
	@RequestMapping("getInfo")
	public Object getInfo(String uid){
		String userid = AesSec.decrypt(uid, Instant.AES_PASSWORD);
		User user = userService.getById(Long.parseLong(userid));
		return user;
	}
	
	/**
	 * 检查用户的联系方式是否完成 并报名
	 * @param uid 用户id串
	 * @param cid 课程id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("checkInfo")
	public Object checkInfoIsCompleted(String uid,String cid){
		String userid = AesSec.decrypt(uid, Instant.AES_PASSWORD);
		User user = userService.getById(Long.parseLong(userid));
		String phone = user.getPhone();
		if(StringUtils.isNotEmpty(phone)){
			Order order = new Order();
			order.setCreatedAt(new Date());
			order.setCid(cid);
			order.setUserid(userid);
			int result = orderService.createOrder(order);
			if(result > 0)
				return ResponseMessage.SUCCESS;
			else 
				return ResponseMessage.FAIL;
		}else{
			return ResponseMessage.FAIL;
		}
	}
	
	@RequestMapping("activateAccount")
	public ModelAndView activateAccount(String uid,String checkcode,HttpServletResponse response){
		ModelAndView mv = new ModelAndView("index");
		if(StringUtils.isNotEmpty(uid) && StringUtils.isNotEmpty(checkcode)){
			User user = userService.getById(Long.parseLong(uid));
			user.setStatus(User.STATE_NOMAL);
			int result = userService.modify(user);
			String md5code = MD5Sec.md5(checkcode);
			if(md5code.equals(user.getVerify()) && result > 0){
				String encryptStr = AesSec.encrypt(user.getId()+"", Instant.AES_PASSWORD);
				Cookie cookie = new Cookie(Instant.COOKIE_USERID, encryptStr);
				cookie.setMaxAge(Instant.COOKIE_EXPIRE);
				response.addCookie(cookie);
			}
		}
		return mv;
	}
	
	/**
	 * 修改用户信息
	 * @param uid
	 * @param username
	 * @param password
	 * @param website
	 * @param desc
	 * @return
	 */
	@ResponseBody
	@RequestMapping("modify")
	public Object modify(String uid,String username,String password,String website,String desc){
		User user = new User();
		if(StringUtils.isNotEmpty(username))
			user.setUsername(username);
		if(StringUtils.isNotEmpty(password))
			user.setPassword(password);
		
		int result = userService.modify(user);
		if(result > 0)
			return ResponseMessage.SUCCESS;
		return ResponseMessage.FAIL;
	}
}
