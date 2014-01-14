package com.ifeng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

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
			//更新订单为已支付状态
			int i = orderService.payForOrder(bill_no);
			if(i>0){
				//更新为支付成功
				log.info("订单号："+bill_no+",price:"+price+"支付状态更新为成功");
				//查询订单
				Order order = orderService.getByOrderid(bill_no);
				if(null != order){
					JSONObject jsb = null;
					String result = null;
					if(Instant.CHARGE_SOURCE_LIU == order.getSource()){
						result = sendByLiu(order,price ,bill_no);
						log.info("六间房发货返回结果:"+result);
					}else if(Instant.CHARGE_SOURCE_WOXIU == order.getSource()){
						result = this.sendByWoxiu(order.getUserkey(), order.getOrderid(), price);
						log.info("我秀发货返回结果:"+result);
					}
					//调用发货接口发回值不为空
					if(StringUtils.isNotEmpty(result)){
						jsb =  JSONObject.fromObject(result);
						if(0 == jsb.getInt("code")){
							orderService.sendForOrder(bill_no);
							log.info("发货成功，订单号"+bill_no+",用户USERKEY"+userkey+"价格"+price);
						}else{//发货失败
							String	liumsg = (String)jsb.get("msg");
							String msg = liumsg + "，发货失败，订单号"+bill_no+",order_m:"+price+",user_id:"+userkey;
							log.info(msg);
							orderService.sendFailForOrder(bill_no);
							saveOrderErrorMsg(msg,bill_no);
						}
					}else{
						String msg = "调用发货接口返回值为空"+bill_no+",order_m:"+price+",user_id:"+userkey;
						saveOrderErrorMsg(msg,bill_no);
					}
				}else{
					String msg = "订单查询失败，订单号："+bill_no+",order_m:"+price+",user_id:"+userkey;
					saveOrderErrorMsg(msg,bill_no);
				}
			}else{
				String msg = "订单状态更新失败，订单号："+bill_no+",order_m:"+price+",user_id:"+userkey;
				saveOrderErrorMsg(msg,bill_no);
			}
			writer.print("success");
		}else{
			log.info("支付回调失败，订单号："+bill_no+" "+subject);
			writer.print("fail:"+"订单号"+bill_no+" "+subject);
		}
	}
	
	@RequestMapping("getChargeResult")
	public String getChargeResult(String trade_status,HttpServletRequest request){
		request.setAttribute("trade_status", trade_status);
		return "charge/back";
	}
	
	/**
	 * 保存订单错误信息
	 * @param msg
	 * @param bill_no
	 */
	private void saveOrderErrorMsg(String msg,String orderid){
		log.info(msg);
		OrderErrorLog oel = new OrderErrorLog();
		oel.setOrderid(orderid);
		oel.setMessage(msg);
		oel.setCreatedAt(new Date());
		orderErrorLogService.saveOrderErrorLog(oel);
	}
	
	/**
	 * 请求六间房发货
	 * @param order
	 * @param price
	 * @param bill_no
	 * @return
	 */
	private String sendByLiu(Order order,String price,String orderid){
		JSONObject obj = new JSONObject(); 
		obj.put("order_token", order.getId());     //我方订单号
		obj.put("order_m", price);    //订单价格
		obj.put("user_id", order.getUserkey());     //guid
		obj.put("orderid", orderid);     //对方订单号
		String sign=Util.Md5(obj+"ifeng#$dfd5*&6dfDSada6rooms");
		log.info("调用六间房发货参数: "+obj);
		String result = Util._callHttp("http://pay.6.cn/gateva/iFengNotice", "?params="+obj+"&sign="+sign);
		return result;
	}
	
	/**
	 * 请求我秀发货
	 * @param uid
	 * @param orderid
	 * @param rmb
	 * @return
	 */
	private String sendByWoxiu(String uid,String orderid,String rmb){
		String time = System.currentTimeMillis()+"";
		time = time.substring(0, 10);
		int price = (int)Double.parseDouble(rmb);
		String token = Util.Md5(uid+orderid+price+time+Util.getPayKeyBySource(Instant.CHARGE_SOURCE_WOXIU));
		StringBuffer params = new StringBuffer();
		params.append("?uid=").append(uid).append("&orderid=").append(orderid)
		.append("&rmb=").append(price).append("&time=").append(time).append("&token=").append(token);
		log.info("我秀发货参数："+params.toString());
		String result = Util._callHttp("http://www.woxiu.com/coop/ifeng_pay.php", params.toString());
		return result;
	}
	
	
}
