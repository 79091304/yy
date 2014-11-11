package com.ifeng.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.util.RandomValidateCode;

@Controller
@RequestMapping({"/image/"})
public class ImageController
{
  @RequestMapping({"out"})
  public void out(String uri, HttpServletResponse resp)
  {
    if (StringUtils.isNotEmpty(uri)) {
      File picture = new File(Instant.FILE_ROOT_PATH+uri);
      try
      {
        BufferedImage image = ImageIO.read(new FileInputStream(picture));
        resp.setContentType("image/jpeg");
        ImageIO.write(image, "JPEG", resp.getOutputStream());
      } catch (FileNotFoundException e) {
        e.printStackTrace();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
  
  /**
   * 随机验证码
   * @param request
   * @param response
   */
  @RequestMapping("randCode")
  public void randCode(HttpServletRequest request , HttpServletResponse response){
	  response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
      response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
      response.setHeader("Cache-Control", "no-cache");
      response.setDateHeader("Expire", 0);
      RandomValidateCode randomValidateCode = new RandomValidateCode();
      try {
          randomValidateCode.getRandcode(request, response);//输出图片方法
      } catch (Exception e) {
          e.printStackTrace();
      }
  }
}