package com.ifeng.util;
import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
public class PaySubmitByUser
{

    public static String pay2(String bill_no,String login_name,String product_id,String subject,String body,String price,String payment_method,String return_url,String notify_url,String extra,String mobile,String sign_type,String sign) throws UnsupportedEncodingException{
    	String r = "0";
    	String url = "http://pay.ifeng.com/payment";
    	if(bill_no==null||bill_no.equals("")||login_name==null||login_name.equals("")||subject==null||subject.equals("")||price==null||price.equals("")||payment_method==null||payment_method.equals("")||return_url==null||return_url.equals("")||notify_url==null||notify_url.equals("")||sign==null||sign.equals("")){
    		r = "错误信息：参数不完整";
    	}else{
	    	StringBuffer ax = new StringBuffer("");
	    	ax.append("bill_no=");
			ax.append(bill_no);
			if(body!=null&&!body.endsWith("")){
				ax.append("&body=");
				ax.append(body);
			}
			ax.append("&charset=UTF-8");
			if(extra!=null&&!extra.endsWith("")){
				ax.append("&extra=");
				ax.append(extra);
			}
			ax.append("&login_name=");
			ax.append(login_name);
			ax.append("&merchant=100008");
			if(mobile!=null&&!mobile.endsWith("")){
				ax.append("&mobile=");
				ax.append(mobile);
			}
			ax.append("&notify_url=");
		    ax.append(java.net.URLEncoder.encode(notify_url,"utf-8"));
			//ax.append(notify_url);
			ax.append("&payment_method=");
			ax.append(payment_method);
			ax.append("&price=");
			ax.append(price);
			ax.append("&product_id=");
			ax.append(product_id);
			ax.append("&return_url=");
			//ax.append(notify_url);
			ax.append(java.net.URLEncoder.encode(return_url,"utf-8"));
	        ax.append("&service=direct_pay_by_user");  
	        ax.append("&subject=");
			ax.append(subject);
			String str = ax.toString()+sign;
			String strSign="";
			try {
				strSign = SecMD5.getMD5(str.getBytes("UTF-8"));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			System.out.println("str="+str);
			System.out.println("strSign="+strSign);
			ax.append("&sign_type=");
			ax.append(sign_type);
			ax.append("&sign=");
			ax.append(strSign);      
	        url = url+"?"+ax.toString();
	        System.out.println("FH Pay Info---"+url);
	        HttpClient client = new HttpClient();
	        //client.getHostConfiguration().setHost("pay.ifeng.com", 80, "http");
	        client.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
	        GetMethod getMethod =  new  GetMethod(url);   
	         // 设置 get 请求超时为 5 秒   
	        getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT,5000);
	        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new  DefaultHttpMethodRetryHandler());   
	    	try
	        {
	    		int  statusCode = client.executeMethod(getMethod);
	    		if  (statusCode != HttpStatus.SC_OK) {   
	                r = "1";  
	            }
	    		//读取内容 
	    		//byte[] responseBody = getMethod.getResponseBody();
	    		String rpb = getMethod.getResponseBodyAsString().toString();
	    		//处理内容
	    		int begin = rpb.indexOf("error_message");
	    		int lo = rpb.indexOf("</span>");
	    		if(rpb.indexOf("<span id=\"error_message\">")>-1){
	    			r=rpb.substring((begin+15), lo);
	    		}
	    		System.out.println("返回结果"+r);
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }finally{
	        	getMethod.releaseConnection();
	        }
    	}
    	System.err.println(r+url);
    	return r+url;
    }
    public static String cardPay(String bill_no,String login_name,String product_id,String subject,String body,String price,String payment_method,String card_price,String card_no,String card_pwd,String return_url,String notify_url,String extra,String mobile,String sign_type,String sign) throws UnsupportedEncodingException{
    	String r = "0";
    	String url = "http://pay.ifeng.com/payment";
    	//String url = "http://wb.ifeng.com/fhy/CheckPay";
    	if(bill_no==null||bill_no.equals("")||login_name==null||login_name.equals("")||subject==null||subject.equals("")||price==null||price.equals("")||payment_method==null||payment_method.equals("")||return_url==null||return_url.equals("")||notify_url==null||notify_url.equals("")||sign==null||sign.equals("")){
    		r = "错误信息：参数不完整";
    	}else{
	    	StringBuffer ax = new StringBuffer("");
	    	ax.append("bill_no=");
			ax.append(bill_no);
			if(body!=null&&!body.endsWith("")){
				ax.append("&body=");
				ax.append(body);
			}
			if(card_no!=null&&!card_no.endsWith("")){
				ax.append("&card_no=");
				ax.append(card_no);
			}
			if(card_price!=null&&!card_price.endsWith("")){
				ax.append("&card_price=");
				ax.append(card_price);
			}
			ax.append("&charset=UTF-8");
			if(card_pwd!=null&&!card_pwd.endsWith("")){
				ax.append("&card_pwd=");
				ax.append(card_pwd);
			}
			if(extra!=null&&!extra.endsWith("")){
				ax.append("&extra=");
				ax.append(extra);
			}
			ax.append("&login_name=");
			ax.append(login_name);
			ax.append("&merchant=100008");
			if(mobile!=null&&!mobile.endsWith("")){
				ax.append("&mobile=");
				ax.append(mobile);
			}
			ax.append("&notify_url=");
		    ax.append(java.net.URLEncoder.encode(notify_url,"utf-8"));
			ax.append("&payment_method=");
			ax.append(payment_method);
			ax.append("&price=");
			ax.append(price);
			ax.append("&product_id=");
			ax.append(product_id);
			ax.append("&return_url=");
			ax.append(java.net.URLEncoder.encode(notify_url,"utf-8"));
	        ax.append("&service=direct_pay_by_user");
	        ax.append("&subject=");
			ax.append(subject);
			String str = ax.toString()+sign;
			String strSign="";
			try {
				strSign = SecMD5.getMD5(str.getBytes("UTF-8"));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			System.out.println("str="+str);
			System.out.println("strSign="+strSign);
			ax.append("&sign_type=");
			ax.append(sign_type);
			ax.append("&sign=");
			ax.append(strSign);      
	        url = url+"?"+ax.toString();
	        System.out.println("FH Pay Info---"+url);
	        HttpClient client = new HttpClient();
	        client.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
	        GetMethod getMethod =  new  GetMethod(url);   
	         // 设置 get 请求超时为 5 秒   
	        getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT,5000);
	        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new  DefaultHttpMethodRetryHandler());   
	    	try
	        {
	    		int  statusCode = client.executeMethod(getMethod);
	    		if  (statusCode != HttpStatus.SC_OK) {   
	                r = "1";  
	            }else{
		    		//读取内容 
		    		//byte[] responseBody = getMethod.getResponseBody();
		    		String rpb = getMethod.getResponseBodyAsString().toString();
		    		//处理内容
		    		if(rpb.indexOf("error_message")>-1){
			    		int begin = rpb.indexOf("error_message");
			    		int lo = rpb.indexOf("</span>");
			    		if(rpb.indexOf("<span id=\"error_message\">")>-1){
			    			r=rpb.substring((begin+15), lo);
			    		}
		    		}else{
		    			r = rpb;
		    		}
		    		System.out.println("返回结果"+rpb);
	            }
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }finally{
	        	getMethod.releaseConnection();
	        }
    	}
    	return r;
    }
    public static void main(String s[]) throws UnsupportedEncodingException
    {
    	//PaySubmitByUser.pay2("131031", "xuhf", "20131031001", "6room", "6roompay", "0.01", "22", "http://wb.ifeng.com/fhy/notify.jsp","http://wb.ifeng.com/fhy/notify","ceshi","13911111111","MD5","u7h39cn62");
    	PaySubmitByUser.cardPay("131101", "xuhf", "20131031001", "6room", "6roompay", "0.01", "23", "","","","http://wb.ifeng.com/fhy/notify.jsp","http://wb.ifeng.com/fhy/notify","ceshi","15817096792","MD5","u7h39cn62");
    }

}
