package com.ifeng.controller.cron;

import java.util.Comparator;

import net.sf.json.JSONObject;
/**
 * 我秀主播级别比较器 按级别比较
 * @author zhang_zhanhui
 *
 */
public class JSONObjectComparetor  implements Comparator<JSONObject> {


	@Override
	public int compare(JSONObject o1, JSONObject o2) {
		int o1Grade = o1.getInt("grade");
		int o2Grade = o2.getInt("grade");
		if(o1Grade < o2Grade)
			return 1;
		else if(o1Grade == o2Grade)
			return 0;
		else 
			return -1;
	}

}
