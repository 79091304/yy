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
 * 六间房随机主播生成静态文件
 * @author zhang_zhanhui
 *
 */
@Controller
@RequestMapping("/cron/liu/")
public class LiuRandShowController {
	
	Logger log = Logger.getLogger(LiuRandShowController.class);

	private static final String absolutePath = "liu_html/rand_show.html";


	private static final String RANDZB = "randZB";

	private MemCachedManager1 cache = MemCachedManager1.getInstance();

	private static final String ONE = "<li><a href='http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http://v.6.cn/";

	private static final String TWO = "'><img src='";

	private static final String THREE = "' width='156' height='118' /><br /> ";

	private static final String FORE = "</a><br /><span class='textbg'></span> <span class='text'>";

	private static final String FIVE = "</span> <span class='pj'><img src='http://vr0.6.cn/imges/live/levelIco_v4/";

	private static final String FIVE01 = "</span> <span class='pj'><u id='a";

	private static final String SIX = ".gif' /></span> <span class='gray'>开播时间:";

	private static final String SIX01 = "'></u></span> <span class='gray'>";

	private static final String SEVERN = "</span> </li>";

	@RequestMapping("randShowFileWriter")
	public void randShowFileWriter(HttpServletResponse response) {
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try {
			log.info("从缓存中获取html");
			String zbStr = (String) cache.get(RANDZB);
			JSONArray jsonArray = JSONArray.fromObject(zbStr);
			StringBuffer sbf = new StringBuffer();

			log.info("生成随机主播HTML");
			// 生成六间房上面的随机主播html
			for (int i = 0; i < 24; i++) {
				Object job = jsonArray.get(i);
				if (job instanceof JSONObject) {
					JSONObject jss = (JSONObject) job;
					String username = (String) jss.get("username");
					Integer wealthrank = (Integer) jss.get("wealthrank");
					String rid = (String) jss.get("rid");
					String pospic = (String) jss.get("pospic");
					String count = (String) jss.get("count");
					String starttime = (String) jss.get("starttime");
					if (wealthrank.intValue() > 19) {
						sbf.append(ONE).append(rid).append(TWO).append(pospic)
								.append(THREE).append(username).append(FORE)
								.append(count).append(FIVE)
								.append(wealthrank.intValue() - 10).append(SIX)
								.append(starttime).append(SEVERN);
					} else {
						sbf.append(ONE).append(rid).append(TWO).append(pospic)
								.append(THREE).append(username).append(FORE)
								.append(count).append(FIVE01)
								.append(wealthrank.intValue()).append(SIX01)
								.append(SEVERN);
					}
				}
			}
			HtmlFileWriter.writeHtml(sbf.toString(), absolutePath);

			
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
