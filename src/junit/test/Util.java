package junit.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

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
	
	public static String _postCallHttp(String callurl, String str)
	{
		log.info("start--"+str);
		String param = "";
		try{
			
			HttpClient httpClient = new HttpClient();
            httpClient.setConnectionTimeout(2000);
            PostMethod postMethod = new PostMethod(callurl+str);
            httpClient.executeMethod(postMethod);
 			byte[] resultArray = postMethod.getResponseBody();//getResponseBodyAsString();
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
	 * 加密key
	 * @param source
	 * @return
	 */
	public static String getKeyBySource(int source){
		String key = null;
		switch (source) {
		case 1: 
			key = "$@EE$R$dsdee*&46rooms&ifeng_coop";//六间房
			break;
		case 2:
			key = "ifeng-key-57s83@#h3";//我秀
			break;
		case 3:
			//key = "14yif&cp";//yy
			key = "14yif&cpo*2n^2dy";
			break;
		case 4:
			key = "KG#&^ifeng*GOU2014!";//酷狗繁星
			break;
		default:
			break;
		}
		return key;
	}
	
	/**
	 * 支付时用的加密key
	 * @param source
	 * @return
	 */
	public static String getPayKeyBySource(int source){
		String key = null;
		switch (source) {
		case 1: 
			key = "$@EE$R$dsdee*&46rooms&ifeng_coop";
			break;
		case 2:
			key = "ifeng-paykey-5d38f#93";
			break;
		case 3:
			key = "14yif&cpo*6n^2dy";
			//key = "14yif&cp";//yy
			break;
		case 4:
			key = "fx@@ifeng1420";//酷狗繁星
			break;
		default:
			break;
		}
		return key;
	}
	
	/**
	 * 凤凰支付主题
	 * @param source
	 * @return
	 */
	public static String getPaySubject(int source){
		String strSource = null;//充值
		switch (source) {
		case 1:
			strSource = "六币";
			break;
		case 2:
			strSource = "秀豆";
			break;
		default:
			break;
		}
		return strSource;
	}
	
	/**
	 * 产生用户otp token的key 
	 * @param source
	 * @return
	 */
	public static String getUserToken(int source){
		String key = null;
		switch (source) {
		case 1: 
			break;
		case 2:
			break;
		case 3:
			key = "B2374TNIQ3HKC446";
			break;
		case 4:
			break;
		default:
			break;
		}
		return key;
	}
}
