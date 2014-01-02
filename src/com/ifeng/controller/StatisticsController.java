package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String queryPvUv(String selectType,String type,String pv,String uv,String date,HttpServletRequest request,HttpServletResponse response){
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
			
			
			request.setAttribute("uc", users.size());
			request.setAttribute("oc", orders.size());
			request.setAttribute("ac", sumPrice);
			request.setAttribute("pc", payedPrice);
			request.setAttribute("pv", pvUv.getPv());
			request.setAttribute("uv", pvUv.getUv());
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
		return "/statistics/pvup_manage";
	}
}
