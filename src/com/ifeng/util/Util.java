package com.ifeng.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;




public class Util {
	private static Logger log = Logger.getLogger(Util.class);

	public static String rand(){
		String res="";
		char[] chars = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','y','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
		for(int i=0;i<8;i++){
			int id=(int) Math.ceil(Math.random()*61);
			res+=chars[id];
		}
		return res;
	}
    public static String httpPost(String urlpath, String postStr, String outcharset, int times, boolean needTime, String incharset){
	   	long starttime = System.currentTimeMillis();
		String s = "Errors";
		String message = "";
		int Loop = 0;
		while(Loop < times){
			URL url = null;
			HttpURLConnection urlconn = null;
			try {
				url = new URL(urlpath);
				urlconn = (HttpURLConnection) url.openConnection();    //����һ�� URLConnection �������ʾ�� URL �����õ�Զ�̶����l�ӡ�
				urlconn.setRequestProperty("content-type",	"text/plain; charset="+outcharset);//outcharset ����          //����һ����������
				urlconn.setRequestMethod("POST");        //��������ʽ
				urlconn.setReadTimeout(10000);            //���s�ʱ����Ϊָ���ĳ�ʱֵ���Ժ���Ϊ��λ��
				urlconn.setDoInput(true);
				urlconn.setDoOutput(true);
				OutputStream out = urlconn.getOutputStream();
				out.write(postStr.getBytes(outcharset));              //postStrΪҪ����Ĳ���ֵ
				out.flush();
				out.close();

				BufferedReader rd = null;
				if(incharset == null ){
					rd = new BufferedReader(new InputStreamReader(urlconn.getInputStream())); //��ȡ����ֵ
				}else{
					rd = new BufferedReader(new InputStreamReader(urlconn.getInputStream(), incharset));
				}

				StringBuffer sb = new StringBuffer();
				int ch = -1;
				while ((ch = rd.read()) > -1) {
					sb.append((char) ch);
				}
				rd.close();
				urlconn.disconnect();
				s = sb.toString();
				Loop++;
			} catch (Exception e) {
				++Loop;
				try{
					message = urlconn.getResponseCode()+":"+urlconn.getResponseMessage();
				}catch(Exception ex){
					message = null;
				}
				log.warn(new StringBuffer("try ").append(Loop).append("->").append(message==null?e.getMessage():message).append(" ").append(urlpath).toString());
				s = "ERROR";
				if(urlconn != null){
					try{
						urlconn.disconnect();
					}catch(Throwable ex){}
				}
				try	{
					Thread.sleep(1000);
				}catch(InterruptedException ex){}
			}
		}
		s = s.replaceAll("\n","").replaceAll("\t","");
		if(needTime)
			return (System.currentTimeMillis() - starttime)+"ms "+s;
		else
			return s;
    }
    

    public static String doPost(String url, String queryString){
		
		String response = null;
        HttpClient client = new HttpClient();
        HttpMethod method = new PostMethod(url);
        log.info("-->"+url+"?"+queryString);
        try {
                if (StringUtils.isNotBlank(queryString))
              	  method.setQueryString(queryString);
                client.executeMethod(method);
                if (method.getStatusCode() == HttpStatus.SC_OK) {
                        response = method.getResponseBodyAsString();
                }
        } catch (URIException e) {
        	log.error("ִ��HTTP Get����ʱ�������ѯ�ַ�"+ queryString + "�������쳣��");
        } catch (IOException e) {
        	log.error("ִ��HTTP Get����" + url + "ʱ�������쳣��");
        } finally {
                method.releaseConnection();
        }
        return response;
	}
    
	public static String _callHttp(String callurl, String str)
	{
		log.info("start--"+str);
		String param = "";
		try{
			
			HttpClient httpClient = new HttpClient();
            httpClient.setConnectionTimeout(2000);
            GetMethod getMethod = new GetMethod(callurl+str);
            httpClient.executeMethod(getMethod);
 			byte[] resultArray = getMethod.getResponseBody();//getResponseBodyAsString();
			param = new String(resultArray,"UTF-8");
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return param.trim();
	}
	
	public static String Md5(String plainText ) {
		System.err.println(plainText);
		char[] a = plainText.toCharArray();
		StringBuffer buf = new StringBuffer(""); 
		try { 
			MessageDigest md = MessageDigest.getInstance("MD5"); 
			md.update(plainText.getBytes()); 
			byte b[] = md.digest(); 

			int i; 

			for (int offset = 0; offset < b.length; offset++) { 
				i = b[offset]; 
				if(i<0) i+= 256; 
				if(i<16) 
					buf.append("0"); 
				buf.append(Integer.toHexString(i)); 
			} 
		} catch (NoSuchAlgorithmException e) { 
			e.printStackTrace(); 
		}
		System.err.println(buf.toString());
		return buf.toString();
	} 
	/**
	 * ��ѯ�û���guid
	 * @param request
	 * @return
	 */
	public static String getGuid(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		MemCachedManager1 cache = MemCachedManager1.getInstance();
		String guid = null;
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (StringUtils.isNotEmpty(c.getValue()) && "cookie".equals(c.getName())) {
						guid = (String)cache.get("gui"+c.getValue());
						break;
				}
			}
		}
		return guid;
	} 
}
