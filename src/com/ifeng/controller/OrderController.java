package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.entity.Order;
import com.ifeng.service.OrderService;
import com.ifeng.util.Util;

@Controller
@RequestMapping("/order/")
public class OrderController {

	Logger log = Logger.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;

	@RequestMapping("liu/createOrder")
	public String createOrder(String userkey, String chargeccount,
			String orderid, HttpServletRequest request,
			HttpServletResponse response) {
		// 缺少token验证
		// 加密规则是 substr(md5(userkey+金额*100+加密key),20)
		// 也就是这几个值MD5以后截取前20个字符
		// 加密key我就不用告诉你了吧
		String chargecount = null;
		int price = 0;
		if (StringUtils.isNotEmpty(userkey)) {
			if (StringUtils.isNotEmpty(chargeccount)) {
				price = Integer.parseInt(chargeccount) / 100;
				chargecount = String.valueOf(price);
			}
			String guid = Util.getGuid(request);
			log.info("准备充值，下单 userkey:" + userkey + ",chargecount:"
					+ chargecount + ",orderid:" + orderid);
			Order order = new Order();
			order.setGuid(userkey);
			order.setPrice(price);
			order.setOrderid(orderid);
			order.setCreatedAt(new Date());
			order.setType(Instant.CHARGE_TYPE_EMPTY);
			order.setState(Instant.ORDER_EMPTY);
			order.setGuid(guid);
			int i = orderService.createOrder(order);
			request.setAttribute("userkey", userkey);
			request.setAttribute("chargecount", chargecount);
			request.setAttribute("orderid", orderid);
			if (i > 0) {
				log.info("下单，订单号是： " + orderid);
			}
		}
		return "charge/chongzhi";
	}
	
	@RequestMapping("queryOrderByUserkey")
	public void queryOrder(String name,HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		log.info("查询用户充值记录，userkey"+name);
		if(StringUtils.isNotEmpty(name)){
			List<Order> orders = orderService.queryOrderByUser(name);
			JSONObject json = new JSONObject();
			json.put("date", orders);
			writer.print(json);
		}
	
	}
	
	@RequestMapping("liu/CheckOrder")
	public void checkOrder(String orderid,HttpServletRequest requset,HttpServletResponse response){
		log.info("六间房发货订单验证...");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(StringUtils.isNotEmpty(orderid)){
			Order order = orderService.getByOrderid(orderid);
			if(null != order){
				JSONObject obj = new JSONObject();
				obj.put("price", order.getPrice());
				obj.put("userkey", order.getUserkey());
				obj.put("status", order.getState());
				out.print(obj);            //根据查询结果给对方返回值
				log.info("response info "+obj);
			}else{
				log.info("fail orderid:"+orderid);
				out.print("fail");
			}
		}else{
			out.print("parameter orderid is empty");
		}
			
	}
}
