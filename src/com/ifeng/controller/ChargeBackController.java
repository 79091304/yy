package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.entity.Order;
import com.ifeng.entity.OrderErrorLog;
import com.ifeng.service.OrderErrorLogService;
import com.ifeng.service.OrderService;
import com.ifeng.util.Util;

/**
 * 充值完成后回调接口
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/chargeBack/")
public class ChargeBackController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderErrorLogService orderErrorLogService;
	
	Logger log = Logger.getLogger(ChargeBackController.class);
	
	@RequestMapping("notice")
	public void payBackCall(String notify_id,String sign_type,String sign,
			String merchant,String bill_no,String trade_no,String bank_seq_no,
			String price,String product_id,String subject,String extra,String trade_status,HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
			log.info(e.getMessage());
		}
		/**
		 * 接收参数
		 */
		String userkey = null;
		if(trade_status.equals("TRADE_SUCCESS")){
			log.info("支付成功，发货订单号："+bill_no+" "+subject);
			int i = orderService.payForOrder(bill_no);
			if(i>0){//更新为支付成功
				log.info("订单号："+bill_no+",price:"+price+"支付状态更新为成功");
				//查询订单
				Order order = orderService.getByOrderid(bill_no);
				JSONObject obj = new JSONObject(); 
				obj.put("order_token", order.getId());     //我方订单号
				obj.put("order_m", price);    //订单价格
				obj.put("user_id", order.getUserkey());     //guid
				obj.put("orderid", bill_no);     //对方订单号
				sign=Util.Md5(obj+"ifeng#$dfd5*&6dfDSada6rooms");
				String params = Util._callHttp("http://pay.6.cn/gateva/iFengNotice", "?params="+obj+"&sign="+sign);
				log.info("调用六间房参数: "+obj);
				log.info("六间房返回参数:"+params);
				JSONObject jsb =  JSONObject.fromObject(params);
				if(0 == jsb.getInt("code")){
					orderService.sendForOrder(bill_no);
					log.info("六间房发货成功，订单号"+bill_no+",用户USERKEY"+userkey+"价格"+price);
				}else{//发货失败
					String	liumsg = (String)jsb.get("msg");
					String msg = liumsg + "，六间房发货失败，订单号"+bill_no+",order_m:"+price+",user_id:"+userkey;
					log.info(msg);
					orderService.sendFailForOrder(bill_no);
					OrderErrorLog oel = new OrderErrorLog();
					oel.setOrderid(bill_no);
					oel.setMessage(msg);
					oel.setCreatedAt(new Date());
					orderErrorLogService.saveOrderErrorLog(oel);
				}
			}else{
				String msg = "订单状态更新失败，订单号："+bill_no+",order_m:"+price+",user_id:"+userkey;
				log.info(msg);
				OrderErrorLog oel = new OrderErrorLog();
				oel.setOrderid(bill_no);
				oel.setMessage(msg);
				oel.setCreatedAt(new Date());
				orderErrorLogService.saveOrderErrorLog(oel);
			}
			writer.print("success");
		}else{
			log.info("支付回调失败，订单号："+bill_no+" "+subject);
			writer.print("fail:"+"订单号"+bill_no+" "+subject);
		}
	}
}
