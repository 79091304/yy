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
 * 六间房排名静态文件生成接口
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/cron/liu/")
public class LiuRankShowController {
	
	Logger log = Logger.getLogger(LiuRankShowController.class);
	
	private MemCachedManager1 cache = MemCachedManager1.getInstance();
	
	private static final String RANK = "randPH";
	
	private static final String DAY_FILE_PATH = "liu_html/rank_day.html";
	private static final String WEEK_FILE_PATH = "liu_html/rank_week.html";
	private static final String MONTH_FILE_PATH = "liu_html/rank_month.html";
	private static final String SUPER_FILE_PATH = "liu_html/rank_super.html";

	@RequestMapping("rankShowFileWriter")
	public void rankShowFileWriter(HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			log.info("生成排行榜rand_show.html");
			String rankStr =(String) cache.get(RANK);
			JSONObject jsonObject = JSONObject.fromObject(rankStr);
			JSONArray dayArr = (JSONArray)jsonObject.get("d");//日榜
			JSONArray weekArr = (JSONArray)jsonObject.get("w");//周邦
			JSONArray monthArr = (JSONArray)jsonObject.get("m");//月榜
			JSONArray superArr = (JSONArray)jsonObject.get("a");//超级棒
			
			HtmlFileWriter.writeHtml(convertJSONArray(dayArr), DAY_FILE_PATH);
			HtmlFileWriter.writeHtml(convertJSONArray(weekArr), WEEK_FILE_PATH);
			HtmlFileWriter.writeHtml(convertJSONArray(monthArr), MONTH_FILE_PATH);
			HtmlFileWriter.writeHtml(convertJSONArray(superArr), SUPER_FILE_PATH);
			
		}catch(Exception e){
			log.equals(e.getMessage());
			e.printStackTrace();
			writer.write("error:RankShowFileWriter.servlet,message:"+e.getMessage()+",time:"+DateUtils.getCurrentDate());
			return;
		}
		writer.write("success:RankShowFileWriter.servlet,time:"+DateUtils.getCurrentDate());
	}
	
	
	/**
	 * 将JSonArray转换成stringBuffer
	 * @param jsonArr
	 * @return
	 */
	private StringBuffer convertJSONArray(JSONArray jsonArr){
		StringBuffer daysb = new StringBuffer();
		for(int i=0; i<jsonArr.size(); i++){
			JSONObject dj = (JSONObject)jsonArr.get(i);
			Integer wealthrank = (Integer)dj.get("wealthrank");
			String rid = (String)dj.get("rid");
			String username = (String)dj.get("username");
			String pic = (String)dj.get("pic");
			String span;
			String ahref = "<a href='http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http://v.6.cn/"+rid+"' >";
			String picurl = "<img src='"+pic+"' width='62' height='62'/>";
			String aafter =  "</a></br><em><img src='http://vr0.6.cn/imges/live/levelIco_v4/";
			String bafter = "</a></br><em><u id='a";
			if(i<3){
				span = "<span class='NO_bg1'>"+(i+1)+"</span>";
			}else{
				span = "<span class='NO_bg2'>"+(i+1)+"</span>";
			}
			if(wealthrank.intValue() > 19){
				daysb.append("<li >").append(ahref).append(span).append(picurl).append(username).append(aafter).append(wealthrank-10).append(".gif' /></em></li>");
			}else{
				daysb.append("<li >").append(ahref).append(span).append(picurl).append(username).append(bafter).append(wealthrank).append("' ></u></em></li>");
			}
		}
		return daysb;
	}
	
}
