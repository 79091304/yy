package com.ifeng.controller.cron;

import java.io.PrintWriter;

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

	private static final String ONE = "<li><a href='http://mm.yue.ifeng.com/woxiu/main.html?roomid=";

	private static final String TWO = "'><img src='";

	private static final String THREE = "' width='156' height='118' /><br /> ";

	private static final String FORE = "</a><br /><span class='textbg'></span> <span class='text'>";

	private static final String FIVE = "</span> <span class='pj'>";

	private static final String SIX = "</span> <span class='gray'>开播时间:";

	private static final String SEVERN = "</span> </li>";
	
	//
	//<li>
    //<div><a href="#"><img src="images/temp3.jpg" /></a></div>
    //<a href="#">小迷糊</a><span class="textbg"></span> <span class="text"><img src="images/icon2.png" alt="" /> 2451人观看</span></li>

	
	@RequestMapping("randShowFileWriter")
	public void randShowFileWriter(HttpServletResponse response){
		PrintWriter writer = null;
		try{
			response.getWriter();
			// 生成六间房编辑推荐的随机主播html
			StringBuilder sbt = new StringBuilder();
			String jstr = (String)cache.get("woxiuZhubo");
			JSONArray jsonArray = JSONArray.fromObject(jstr);
						for (int i = 0; i < 15; i++) {
							Object job = jsonArray.get(i);
							if (job instanceof JSONObject) {
								JSONObject jss = (JSONObject) job;
								String username = (String) jss.get("nickname");
								int grade = jss.getInt("grade");
								String roomid = (String) jss.get("roomid");
								String room_img = (String) jss.get("room_img");
								String starttime = (String) jss.get("starttime");
								int audience = jss.getInt("audience");
									sbt.append(ONE).append(roomid).append(TWO).append(room_img)
											.append(THREE).append(username).append(FORE)
											.append(audience).append("人观看").append(FIVE)
											.append(SIX).append(starttime).append(SEVERN);
							}
						}
						HtmlFileWriter.writeHtml(sbt.toString(), absolutePath);
		} catch (Exception e) {
			log.equals(e.getMessage());
			e.printStackTrace();
			writer.write("error:RandShowFileWriter.servlet,message"
					+ e.getMessage() + ",time:" + DateUtils.getCurrentDate());
			return;
		}
		writer.write("success:RandShowFileWriter.servlet,time:"
				+ DateUtils.getCurrentDate());
	}
	
}
