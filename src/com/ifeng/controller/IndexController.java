package com.ifeng.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.entity.Product;
import com.ifeng.entity.User;
import com.ifeng.service.ProductService;
import com.ifeng.service.UserService;
import com.ifeng.util.AesSec;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("index");
		Cookie[] cookies = request.getCookies();
		String value = null;
		User user = null;
		for(Cookie coo : cookies){
			String name = coo.getName();
			if(name.equals(Instant.COOKIE_USERID)){
				value = coo.getValue();
				break;
			}
			//缓存查询用户信息
			if(StringUtils.isNotEmpty(value)){
				String userid = AesSec.decrypt(value, Instant.AES_PASSWORD);
				user = userService.getById(Long.parseLong(userid));
			}
		}
		if(null != user){
			mv.addObject("user", user);	
		}
		List<Product> products = productService.listForIndex(4);
		mv.addObject("products", products);
		return mv;
	}
}
