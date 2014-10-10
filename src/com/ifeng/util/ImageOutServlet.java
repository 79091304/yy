package com.ifeng.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 输出图片
 * @author zhangzhanhui
 *
 */
public class ImageOutServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			String url = req.getParameter("url");
			File picture = new File(url);  
		    BufferedImage image =ImageIO.read(new FileInputStream(picture));  
		    resp.setContentType("image/jpeg");  
		  //告诉浏览器不要缓存  
		    resp.setHeader("Pragma", "no-cache");  
		    resp.setHeader("Cache-Control", "no-cache");  
		    resp.setIntHeader("Expires",-1);  
		    ImageIO.write(image,"JPEG",resp.getOutputStream());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	

}
