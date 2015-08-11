package com.ifeng.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


import com.ifeng.common.Instant;
import com.ifeng.entity.Category;
import com.ifeng.util.MemCachedManager;
import com.ifeng.util.PropertiesUtils;

public class InitListener implements  ServletContextListener{
	
	private MemCachedManager manager = new MemCachedManager();
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		context.setAttribute("ctx", context.getRealPath(""));
		//加载品类
		List<Category> categories = (List<Category>)manager.get(Instant.CATEGORY_KEY);
		if(null == categories){
			String cidJson = PropertiesUtils.findPropertiesKey("category");
		}
		context.setAttribute("category", MemCachedManager.getInstance().get(Instant.CATEGORY_KEY));
	}

}
