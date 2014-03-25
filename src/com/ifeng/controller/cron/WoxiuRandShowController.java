package com.ifeng.controller.cron;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ifeng.util.DateUtils;
import com.ifeng.util.HtmlFileWriter;
import com.ifeng.util.MemCachedManager1;

/**
 * 我秀随机主播生成
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/cron/woxiu/")
public class WoxiuRandShowController {

	
	Logger log = Logger.getLogger(WoxiuRandShowController.class);

	private static final String absolutePath = "woxiu/rand_show.html";



	private MemCachedManager1 cache = MemCachedManager1.getInstance();

	private static final String ONE = "<li><div><a href='http://mm.yue.ifeng.com/woxiu/main.html?";

	private static final String TWO = "'><img src='";

	private static final String THREE = "' width='156' height='118' /></a></div><a href='http://mm.yue.ifeng.com/woxiu/main.html?roomid=";

	private static final String FORE = "</a><span class='textbg'></span> <span class='text'>";

	private static final String FIVE = "</span>";

	private static final String SIX = "<br/><span class='gray'>开播时间:";

	private static final String SEVERN = "</span> </li>";
	
	
	@RequestMapping("randShowFileWriter")
	public void randShowFileWriter(HttpServletResponse response){
		PrintWriter writer = null ;
		try{
			writer = response.getWriter();
			// 生成六间房编辑推荐的随机主播html
			StringBuilder sbt = new StringBuilder();
			String jstr = (String)cache.get("woxiuZhubo");
			JSONArray jsonArray = JSONArray.fromObject(jstr);
						for (int i = 0; i < 30; i++) {
							Object job = jsonArray.get(i);
							if (job instanceof JSONObject) {
								JSONObject jss = (JSONObject) job;
								String username = (String) jss.get("nickname");
								String roomid = (String) jss.get("roomid");
								String room_img = (String) jss.get("room_img");
								String starttime = (String) jss.get("starttime");
								String frameurl = "&"+URLEncoder.encode("frameurl=http://www.woxiu.com/coop/ifeng.php?roomid="+roomid);
								int audience = jss.getInt("audience");
									sbt.append(ONE).append("roomid=").append(roomid).append(frameurl).append(TWO).append(room_img)
											.append(THREE).append(roomid).append(frameurl).append("'>").append(username).append(FORE)
											.append(audience).append("人观看").append(FIVE)
											.append(SIX).append(starttime).append(SEVERN);
							}
						}
						HtmlFileWriter.writeHtml(sbt.toString(), absolutePath);
		} catch (Exception e) {
			log.equals(e.getMessage());
			e.printStackTrace();
			writer.write("error:woxiu Cache,message"
					+ e.getMessage() + ",time:" + DateUtils.getCurrentDate());
			return;
		}
		writer.write("success:woxiu Cache,time:"
				+ DateUtils.getCurrentDate());
	}
	
}
