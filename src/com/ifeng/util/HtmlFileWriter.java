package com.ifeng.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.log4j.Logger;

/**
 * 写文件
 * @author zhang_zhanhui
 *
 */
public class HtmlFileWriter {

	
	/**
	 * 写静态化文件
	 * @return
	 */
	public static String getRootPath(){
		String classpath = HtmlFileWriter.class.getResource("/").getPath();
		classpath = classpath.substring(0,classpath.indexOf("WEB-INF"));
		return classpath;
	}
	/**
	 * 写html文件
	 * @param str htmlBuffer
	 * @param absoluteFilePath 
	 */
	public static void writeHtml(StringBuffer str,String absoluteFilePath){
		Logger log = Logger.getLogger(HtmlFileWriter.class);
		String ranShowPath = getRootPath()+absoluteFilePath;
		log.info("生成文件:"+absoluteFilePath);
		File randShow = new File(ranShowPath);
		FileWriter fw = null;
		try {
			if(randShow.exists()){
				fw = new FileWriter(randShow,false);
				fw.write(str.toString());
				fw.flush();
			}else{
				randShow.createNewFile();
				fw = new FileWriter(randShow,false);
				fw.write(str.toString());
				fw.flush();
			}
			
		} catch (IOException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}finally{
			try {
				if(null != fw)
				fw.close();
			} catch (IOException e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
		}
	}
	
}
