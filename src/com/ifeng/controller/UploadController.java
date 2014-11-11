package com.ifeng.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.ifeng.common.Instant;
import com.ifeng.common.ResponseMessage;
import com.ifeng.util.DateUtils;
import com.ifeng.util.RandCodeUtils;

@Controller
@RequestMapping("/file")
public class UploadController {

	private static Log log = LogFactory.getLog(UploadController.class);

	@ResponseBody
	@RequestMapping("/upload")
	public Object upload(HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException,
			IOException {
		ResponseMessage rm = null;
		log.info("文件开始上传了！！！");
		try {
			// 创建一个通用的多部分解析器
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			// 判断 request 是否有文件上传,即多部分请求
			if (multipartResolver.isMultipart(request)) {
				// 转换成多部分request
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 取得request中的所有文件名
				Iterator<String> iter = multiRequest.getFileNames();
				String newfileName = null;
				String filepath = null;
				int month = DateUtils.getCurrentMonth();
				while (iter.hasNext()) {
					// 记录上传过程起始时的时间，用来计算上传时间
					int pre = (int) System.currentTimeMillis();
					// 取得上传文件
					MultipartFile file = multiRequest.getFile(iter.next());
					if (file != null) {
						// 取得当前上传文件的文件名称
						String myFileName = file.getOriginalFilename();
						// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
						if (myFileName.trim() != "") {
							log.info("文件名称为：" + myFileName);
							// 重命名上传后的文件名
							String oldfileName = file.getOriginalFilename();
							String substr = oldfileName.substring(oldfileName.lastIndexOf("."));
							newfileName = RandCodeUtils.caculateSeq(System.currentTimeMillis())+substr;
							// 定义上传路径
							
							filepath = Instant.FILE_ROOT_PATH + month+"/";
							File dir = new File(filepath);
							File localFile = new File(filepath+newfileName);
							if(!dir.exists()){
								dir.mkdirs();
							}
							file.transferTo(localFile);
							log.info("新增文件名称是"+newfileName);
						}
					}
					// 记录上传该文件后的时间
					int finaltime = (int) System.currentTimeMillis();
					log.info("上传耗时为：" + (finaltime - pre));
				}
				rm = new ResponseMessage(month+"/"+newfileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
			rm = new ResponseMessage(e.getMessage());
		}
		return rm;
	}

}
