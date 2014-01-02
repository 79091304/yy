package com.ifeng.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.entity.Order;
import com.ifeng.service.OrderService;
import com.ifeng.util.PaySubmitByUser;
import com.ifeng.util.Util;

@Controller
@RequestMapping("/charge/")
public class ChargeController {

	@Autowired
	private OrderService orderService;

	Logger log = Logger.getLogger(ChargeController.class);

	/**
	 * 嗲用支付宝、手机卡支付接口
	 * @param bill_no
	 * @param login_name
	 * @param body
	 * @param transAmt
	 * @param payment_method
	 * @param extra
	 * @param mobile
	 * @param chargeType
	 * @param response
	 */
	@RequestMapping("chargeIfeng")
	public void chargeByIfeng(String bill_no, String login_name, String body,
			String transAmt, String payment_method, String extra,
			String mobile, String chargeType, HttpServletResponse response) {
		String product_id = "1";
		String subject = "liubi";
		String return_url = "http://mm.yue.ifeng.com/liu_html/back.jsp"; // 返回页面
		String notify_url = "http://mm.yue.ifeng.com/chargeBack/notice.htm"; // 回调接口
		String sign_type = "MD5";
		String sign = "u7h39cn62";
		String result = null;
		try {
			result = PaySubmitByUser.pay2(bill_no, login_name, product_id,
					subject, body, transAmt, payment_method, return_url,
					notify_url, extra, mobile, sign_type, sign);
			if (result.startsWith("0")) {
				response.sendRedirect(result.substring(1));
				int i = orderService.modifyChargeType(bill_no,
						Integer.parseInt(chargeType));
				if (i > 0) {
					log.info("调用凤凰支付接口 ，订单号: " + bill_no
							+ ",price : " + transAmt);
				}
			} else {
				log.info("调用凤凰支付接口失败 : " + bill_no + ",price : "
						+ transAmt + ",login_name:" + login_name);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 储蓄卡 和信用卡支付接口
	 * @param userkey
	 * @param orderid
	 * @param cardNo
	 * @param usrName
	 * @param mobile
	 * @param transAmt
	 * @param authCode
	 * @param typeId
	 * @param accountId
	 * @param input
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping("chargeByGoodPay")
	public void chargeByGoodPay(String userkey,String orderid,String cardNo,String usrName,
			String mobile,String transAmt,String authCode,String typeId,
			String accountId,String input,String period,String cvvCode,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			log.info("into ChargeServlet ...");
			usrName = URLEncoder.encode(usrName,"UTF-8");
			String randnum=Util.rand();
			String param="";
			if((StringUtils.isNotEmpty(userkey))&&(StringUtils.isNotEmpty(orderid))&&(StringUtils.isNotEmpty(cardNo))&&(
					StringUtils.isNotEmpty((usrName))&&(StringUtils.isNotEmpty(mobile))&&(StringUtils.isNotEmpty(transAmt))&&(
							StringUtils.isNotEmpty(authCode))&&(StringUtils.isNotEmpty(accountId))&&(StringUtils.isNotEmpty(randnum)))){
				String sign="";
				//调用充值
				if(typeId.equals("2")){//充值类型
					if((StringUtils.isNotEmpty(period))&&(StringUtils.isNotEmpty(cvvCode))){
						sign=Util.Md5("channelId=7&accountId="+accountId+"&categoryId=01&transAmt="+transAmt+"&randnum="+randnum+"||u9Y%)!a1z");
						param = Util._callHttp("http://211.151.175.47/interface/pay.php?", "typeId="+typeId+"&channelId=7&accountId="+accountId+"&categoryId=01&cardNo="+cardNo+"&usrName="+usrName+"&mobile="+mobile+"&transAmt="+transAmt+"&authCode="+authCode+"&randnum="+randnum+"&cvvCode="+cvvCode+"&period="+period+"&sign="+sign);
					}
				}else if(typeId.equals("1")){//
					sign=Util.Md5("channelId=7&accountId="+accountId+"&categoryId=01&transAmt="+transAmt+"&randnum="+randnum+"||u9Y%)!a1z");
					param = Util._callHttp("http://211.151.175.47/interface/pay.php?", "typeId="+typeId+"&channelId=7&accountId="+accountId+"&categoryId=01&cardNo="+cardNo+"&usrName="+usrName+"&mobile="+mobile+"&transAmt="+transAmt+"&authCode="+authCode+"&randnum="+randnum+"&sign="+sign);
				}
				
				if(param.contains("0000")){//充值成功
					int i = orderService.payForOrder(orderid);
					if(i > 0){
						log.info("更新订单状态，订单号"+orderid+"已支付");
						sendByLiu(transAmt, orderid, userkey, sign, request, response);
					}
				}else{//充值失败
					//
					log.info("充值失败 orderid is  "+orderid+",order_m:"+transAmt+",user_id:"+userkey+",param:"+param);
					Cookie cookie = new Cookie("fail", URLEncoder.encode(param,"UTF-8"));
					response.addCookie(cookie);
					request.getRequestDispatcher("liu_html/chongzhi3.html").forward(request, response);
				}
				}else{
					log.info("参数不完整 user is : "+userkey);
					Cookie cookie = new Cookie("fail", "1");
					response.addCookie(cookie);
					request.getRequestDispatcher("liu_html/chongzhi3.html").forward(request, response);
				}
	}
	
	/**
	 * 六间房发货
	 * @param transAmt
	 * @param orderid
	 * @param userkey
	 * @param sign
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void sendByLiu(String transAmt, String orderid , String userkey ,String sign,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
			int price = Integer.parseInt(transAmt)/100;
			transAmt = String.valueOf(price);
			Order order = orderService.getByOrderid(orderid);
			JSONObject obj = new JSONObject(); 
			obj.put("order_token", order.getId());     //
			obj.put("order_m", transAmt);    //
			obj.put("user_id", userkey);     //
			obj.put("orderid", orderid);     //
			sign=Util.Md5(obj+"ifeng#$dfd5*&6dfDSada6rooms");
			String params = Util._callHttp("http://pay.6.cn/gateva/iFengNotice", "?params="+obj+"&sign="+sign);
			log.info("response info : "+obj);
			log.info("charge params:"+params);
			if(params.contains("0")){//发货成功
				orderService.sendForOrder(orderid);
				log.info("六间房发货成功 orderid is : "+orderid+",login_name is : "+userkey);
				request.getRequestDispatcher("liu_html/chongzhi2.html").forward(request, response);
			}else{//发货失败
				int d = orderService.sendFailForOrder(orderid);
				log.info("订单发货失败，订单号："+orderid);
				if(d>0){//
					log.info("支付成功、发货失败 orderid is "+orderid+",order_m:"+transAmt+",user_id:"+userkey);
				}
				request.getRequestDispatcher("liu_html/chongzhi2.html").forward(request, response);
			}
	}
	
	@RequestMapping("getCode")
	public void getCode(String mobile,String randnum,String accountId){
		String categoryId="01";
		String sign = Util.Md5("channelId=7&accountId="+accountId+"&categoryId=01&mobile="+mobile+"||u9Y%)!a1z");
		String param=Util._callHttp("http://211.151.175.47/interface/authCode.php?", "channelId=7&accountId="+accountId+"&categoryId="+categoryId+"&mobile="+mobile+"&sign="+sign);
		if(param.contains("0000")){//调用成功
			log.info("AuthCodeServlet success mobile is "+mobile);
		}else{
			log.info("AuthCodeServlet fail mobile is "+mobile);
		}
	}
	
}
