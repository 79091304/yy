package com.ifeng.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class DateUtils {

	/**
	 *获取当前时间
	 * @return
	 */
	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private static DateFormat dff = new SimpleDateFormat("yyyyMMdd");
	
	public static String  getCurrentDate(){
		return df.format(new Date());
	}
	
	/**
	 * 返回当前天
	 * @return 20121212
	 */
	public static int  getCurrentDay(){
		return Integer.parseInt(dff.format(new Date()));
	}
	
	
	/**
	 * 时间转换
	 * @param str
	 * @return
	 */
	public static Date parseStringToDate(String str){
		if(StringUtils.isNotEmpty(str)){
			Date date = null;
			try {
				date =  df.parse(str);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return date;
		}
		return null;
	}
}
