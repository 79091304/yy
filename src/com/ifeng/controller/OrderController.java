package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
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
			//查询用户支付记录
			List<Order> orders = orderService.queryOrderByUser(userkey);
			request.setAttribute("orders", orders);
			
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
			order.setUserkey(userkey);
			order.setSource(Instant.CHARGE_SOURCE_LIU);
			int i = orderService.createOrder(order);
			request.setAttribute("userkey", userkey);
			request.setAttribute("price", chargecount);
			request.setAttribute("orderid", orderid);
			request.setAttribute("source", "六币");
			
			if (i > 0) {
				log.info("下单，订单号是： " + orderid);
			}
		}
		return "charge/chongzhi";
	}
	
	
	
	@RequestMapping("liu/checkOrder")
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
	
	@RequestMapping(value = "queryOrder")
	public void queryOrder(String orderid,String source,String token,HttpServletResponse response){
		JSONObject obj = new JSONObject();
		if(StringUtils.isNotEmpty(orderid)&&StringUtils.isNotEmpty(source)&&StringUtils.isNotEmpty(token)){
			log.info("查询订单信息，订单号："+orderid+"，来源："+source+"，token:"+token);
			String tk = Util.Md5(orderid+source+Util.getPayKeyBySource(Integer.parseInt(source)));
				if(token.equals(tk)){
					Order order = orderService.getByOrderid(orderid,Integer.parseInt(source));
					if(null != order){
						obj.put(ResponseMessage.CODE, ResponseMessage.CODE_SUCCESS);
						obj.put("order", order);
					}
				}else{
					obj.put(ResponseMessage.CODE, ResponseMessage.CODE_TOKEN_ERROR);
					obj.put(ResponseMessage.MESSAGE,ResponseMessage.MSG_TOKEN_ERROR);
				}
		}else{
			obj.put(ResponseMessage.CODE, ResponseMessage.CODE_EMPTY);
			obj.put(ResponseMessage.MESSAGE,ResponseMessage.MSG_EMPTY);
		}
		try {
			response.getWriter().print(obj);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("createOrder")
	public void createOrder(String uid, String price,
			String orderid,String source,String token, HttpServletRequest request,HttpServletResponse response
			) {
		JSONObject jb = new JSONObject();
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(price)&&StringUtils.isNotEmpty(orderid)
			&&StringUtils.isNotEmpty(source)&&StringUtils.isNotEmpty(token)) {
			try{
				//根据source判断token
				String pre_token = orderid+price+uid+source+Util.getPayKeyBySource(Integer.parseInt(source));
				String mytoken = Util.Md5(pre_token);
				//验证token
				if(mytoken.equals(token)){
					//查询用户支付记录
					int insource = Integer.parseInt(source);
					List<Order> orders = orderService.queryOrderByUser(uid);
					request.setAttribute("orders", orders);
					String guid = Util.getGuid(request);
					log.info("创建订单， uid:" + uid + ",price:"
							+ price + ",orderid:" + orderid);
					Order order = new Order();
					order.setGuid(uid);
					order.setPrice(Double.parseDouble(price));
					order.setOrderid(orderid);
					order.setCreatedAt(new Date());
					order.setType(Instant.CHARGE_TYPE_EMPTY);
					order.setState(Instant.ORDER_EMPTY);
					order.setGuid(guid);
					order.setUserkey(uid);
					order.setSource(insource);
					int i = orderService.createOrder(order);
					request.setAttribute("userkey", uid);
					request.setAttribute("price", price);
					request.setAttribute("orderid", orderid);
					request.setAttribute("source", Util.getPaySubject(insource));
					if (i > 0) {
						log.info("下单成功，订单号是： " + orderid);
					}
					jb.put(ResponseMessage.CODE, ResponseMessage.CODE_SUCCESS);
					jb.put(ResponseMessage.MESSAGE, ResponseMessage.MSG_SUCCESS);
					request.getRequestDispatcher("/WEB-INF/jsp/charge/chongzhi.jsp").forward(request, response);
				}else{
					jb.put(ResponseMessage.CODE, ResponseMessage.CODE_TOKEN_ERROR);
					jb.put(ResponseMessage.MESSAGE,ResponseMessage.MSG_TOKEN_ERROR);
					writer.print(jb);
				}
			}catch(Exception e){
				log.info(e.getMessage());
				request.setAttribute("exception", e.getMessage());
				writer.print(jb);
			}
		}else{
			jb.put(ResponseMessage.CODE, ResponseMessage.CODE_EMPTY);
			jb.put(ResponseMessage.MESSAGE, ResponseMessage.MSG_EMPTY);
			writer.print(jb);
		}
	}
}
