package com.ifeng.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.entity.User;
import com.ifeng.service.UserService;
import com.ifeng.util.AesSec;

@Controller
@RequestMapping("/")
public class IndexController {

	private UserService userService;
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		String value = null;
		for(Cookie coo : cookies){
			String name = coo.getName();
			if(name.equals(Instant.COOKIE_USERID)){
				value = coo.getValue();
				break;
			}
			//缓存查询用户信息
			if(StringUtils.isNotEmpty(value)){
				String userid = AesSec.decrypt(value, Instant.AES_PASSWORD);
				User user = userService.getById(Long.parseLong(userid));
			}
		}
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
}
