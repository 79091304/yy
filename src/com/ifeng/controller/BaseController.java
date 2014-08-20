package com.ifeng.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;

@Controller
public class BaseController {

	protected String getContextPath(HttpServletRequest request){
		ServletContext servletContext=request.getSession().getServletContext();
		WebApplicationContext webApplicationContext = (WebApplicationContext)servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		return null;
	}
}
