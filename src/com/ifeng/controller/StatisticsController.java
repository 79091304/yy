package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifeng.common.Instant;
import com.ifeng.entity.Order;
import com.ifeng.entity.PvUv;
import com.ifeng.entity.User;
import com.ifeng.service.OrderService;
import com.ifeng.service.PvUvService;
import com.ifeng.service.UserService;
import com.ifeng.util.DateUtils;


@Controller
@RequestMapping("/statistics/")
public class StatisticsController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PvUvService pvUvService;
	
	
	@RequestMapping("queryPvUv")
	public ModelAndView queryPvUv(String selectType,String type,String pv,String uv,String date,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(StringUtils.isEmpty(type)){
			List<User> users = userService.queryOrderByDate(null, null);
			
			List<Order> orders = orderService.queryOrderByDate(null, null);
			double sumPrice = 0;
			double payedPrice = 0;
			for(Order od : orders){
				sumPrice = od.getPrice()+sumPrice;
				if(Instant.ORDER_PAYED == od.getState()){
					payedPrice = od.getPrice() + payedPrice;
				}
			}
			PvUv pvUv = pvUvService.queryByDate(DateUtils.getCurrentDay());
			
			mv.addObject("uc", users.size());
			mv.addObject("oc", orders.size());
			mv.addObject("ac", sumPrice);
			mv.addObject("pc", payedPrice);
			mv.addObject("pv", pvUv.getPv());
			mv.addObject("uv", pvUv.getUv());
		}else{
			
			if(StringUtils.isNotEmpty(date)){
				int dated = Integer.parseInt(date.substring(0, 6));
				PvUv pvUv = pvUvService.queryByDate(dated);
				if(null != pvUv){
					pvUv.setChangedAt(new Date());
					pvUv.setDate(dated);
					pvUv.setPv(Integer.parseInt(pv));
					pvUv.setUv(Integer.parseInt(uv));
					pvUvService.modifyPvUv(pvUv);
					writer.write("修改PVUV");
				}else if(null == pvUv){
					pvUv = new PvUv();
					pvUv.setDate(dated);
					pvUv.setPv(Integer.parseInt(pv));
					pvUv.setUv(Integer.parseInt(uv));
					pvUvService.savePvUv(pvUv);
					writer.write("新增加PVUV");
				}
			}
		}
		mv.setViewName("/statistics/pvup_manage");
		return mv;
	}
	
	
	@RequestMapping("index")
	public ModelAndView index(String key,String startTime,String endTime,String selectType){
			ModelAndView mv = new ModelAndView();
			if(StringUtils.isEmpty(startTime)){
				startTime = "2000-01-01 00:00:00";
			}else{
				mv.addObject("startTime", startTime);
			}
			if(StringUtils.isEmpty(endTime)){
				endTime = "2999-12-31 00:00:00";
			}else{
				mv.addObject("endTime", endTime);
			}
			
			if(StringUtils.isNotEmpty(selectType)){
				if("1".equals(selectType)){
					List<User> userlist = userService.queryOrderByDate(startTime, endTime);
					mv.addObject("userList", userlist);
					mv.setViewName("/statistics/userDetail");
				}
				else if("2".equals(selectType)){
					List<Order> orderList = orderService.queryOrderByDate(startTime, endTime);
					mv.addObject("orderList", orderList);
					mv.setViewName("/statistics/orderDetail");
				}
				
			}else{
				List<User> userlist = userService.queryOrderByDate(startTime, endTime);
				List<Order> orderList = orderService.queryOrderByDate(startTime, endTime);
				double sumPrice = 0;
				double payedPrice = 0;
				int payedCount = 0;
				for(Order od : orderList){
					sumPrice = od.getPrice()+sumPrice;
					if(Instant.ORDER_PAYED == od.getState()){
						payedPrice = od.getPrice() + payedPrice;
						payedCount++;
					}
				}
				mv.addObject("registerC", userlist.size());
				mv.addObject("order", orderList.size());
				mv.addObject("order_pay", payedCount);
				mv.addObject("allOrderMoney", sumPrice);
				mv.addObject("payOrderMoney", payedPrice);
				mv.setViewName("/statistics/index");
			}
			return mv;
		}
}
