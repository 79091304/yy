package com.ifeng.controller.cron;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.util.DateUtils;
import com.ifeng.util.HtmlFileWriter;
import com.ifeng.util.MemCachedManager1;

/**
 * 六间房推送主播静态文件
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/cron/liu/")
public class LiuTuiShowController {

	Logger log = Logger.getLogger(LiuTuiShowController.class);
	
	private static final String RANDZB = "randZB";

	private MemCachedManager1 cache = MemCachedManager1.getInstance();
	
	private static final String ONE = "<li><a href='http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http://v.6.cn/";
	
	private static final String TWO = "'><img width='61' height='50' src='";
	
	private static final String THREE =  "'/></a></li>";
	
	private static final String aboserlutFilePath = "liu_html/tui_show.html"; 
	
	@RequestMapping("tuiShowFileWriter")
	public void tuiShowFileWriter(HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			log.info("定时任务写tui_show.html");
			String zbStr = (String)cache.get(RANDZB);//
			JSONArray jsonArray = JSONArray.fromObject(zbStr);
			StringBuffer sbf = new StringBuffer();//
			for(int i=jsonArray.size()-8; i<jsonArray.size(); i++){
				Object job =jsonArray.get(i);
				if(job instanceof JSONObject){
					JSONObject jss = (JSONObject)job;
					String rid = (String)jss.get("rid");
					String pospic = (String)jss.get("pospic");
					sbf.append(ONE).append(rid).append(TWO).append(pospic).append(THREE);
				}
			}
			HtmlFileWriter.writeHtml(sbf.toString(), aboserlutFilePath);
		}catch(Exception e){
			log.equals(e.getMessage());
			e.printStackTrace();
			writer.write("error:TuiShowFileWriter.servlet,message:"+e.getMessage()+",time:"+DateUtils.getCurrentDate());
			return;
		}
		writer.write("success:TuiShowFileWriter.servlet,time:"+DateUtils.getCurrentDate());
	}
}
