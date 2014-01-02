package com.ifeng.controller.cron;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.util.MemCachedManager1;
import com.ifeng.util.Util;

/**
 * 
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/cron/liu/")
public class CacheController {

	MemCachedManager1 cache = MemCachedManager1.getInstance();
	Logger log = Logger.getLogger(CacheController.class);
	
	@RequestMapping("updateCache")
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
}
