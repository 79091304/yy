package com.ifeng.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/image/"})
public class ImageController
{
  @RequestMapping({"out"})
  public void out(String uri, HttpServletResponse resp)
  {
    if (StringUtils.isNotEmpty(uri)) {
      File picture = new File(uri);
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
}