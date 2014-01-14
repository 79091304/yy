package com.ifeng.controller.cron;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Collections;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.util.MemCachedManager1;
import com.ifeng.util.Util;

/**
 * 
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/cron/")
public class CacheController {

	MemCachedManager1 cache = MemCachedManager1.getInstance();
	Logger log = Logger.getLogger(CacheController.class);
	
	@RequestMapping("liu/updateCache")
	public void updateCache(HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			log.info("更新本地六间房缓存");
			String rand = "";
			rand = Util._callHttp("http://v.6.cn/coop/pub/getRand.php?", "num=30");
			boolean b = cache.replace("randZB", rand);
			log.info("随机主播更新: "+b);
			rand = Util._callHttp("http://v.6.cn/coop/pub/getTop.php", "");
			b = cache.replace("randPH", rand);
			log.info("排行榜更新: "+b);
		}catch(Exception e){
			writer.write("更新本地六间房缓存错误:"+e.getMessage());
		}
		writer.write("cache update success");
	}
	
	@RequestMapping("woxiu/updateCache")
	public void updateWoxiuCache(HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			String time = System.currentTimeMillis()+"";
			time = time.substring(0,10);
			log.info("更新本地我秀主播缓存");
			String token =Util.Md5("ifeng."+time+".4.[]."+Util.getKeyBySource(Instant.CHARGE_SOURCE_WOXIU));
			String param = "tag=ifeng&ts="+time+"&method=4&params="+URLEncoder.encode("[]")+"&sign="+token;
			String zhubo = Util._callHttp("http://www.woxiu.com/coop/api.php?", param);
			JSONObject job = JSONObject.fromObject(zhubo);
			int code = job.getInt("code");
			if(0 == code){
				Object data = job.get("data");
				JSONArray jsa = JSONArray.fromObject(data);
				//按grade排序取前20个主播
				Collections.sort(jsa,new JSONObjectComparetor());
				boolean t;
				if(null == cache.get("woxiuZhubo")){
					 t = cache.add("woxiuZhubo", jsa.subList(0, 21).toString());
				}else{
					 t = cache.replace("woxiuZhubo", jsa.subList(0, 21).toString());
				}
				log.info("更新我秀主播: "+t);
			}
		}catch(Exception e){
			writer.write("更新我秀缓存错误:"+e.getMessage());
		}
		writer.write("cache update success");
	}

	
	
}
