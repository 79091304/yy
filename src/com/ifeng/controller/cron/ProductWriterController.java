package com.ifeng.controller.cron;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.common.Instant;
import com.ifeng.entity.Product;
import com.ifeng.service.ProductService;
import com.ifeng.util.HtmlFileWriter;

@Controller
@RequestMapping("/cron/product/")
public class ProductWriterController {

	private static final String COURSE_FOR_INDEX = "product.html";//首页课程信息
	
	
	
	private static final int COUNT = 4; 
	
	@Autowired
	private ProductService productService;

	private static final String ONE = "<li><div class='list-item'><a class='item-figure' href='"+Instant.WEBSITE+"/product/getInfo.htm?id=";
	private static final String TWO = "' target='_blank'><img src='"+Instant.WEBSITE+"/image/out.htm?uri=";
	private static final String WHREE = "' alt='";
	private static final String FORE = "'>";
	private static final String FIVE01 = "</a><div class='item-upvote'><a class='icons ' href='javascript:void(0);' rel='";
	private static final String FIVE02 = "' onclick='like_deal_v2(";
	private static final String FIVE03 =", this)'>8</a>";
	private static final String SIX = "</div><h3><a href='"+Instant.WEBSITE+"/product/getInfo.htm?id=";
	private static final String SEVEN = "' target='_blank'>";
	private static final String EIGHT = "</a></h3><div class='item-caption'><span class='btn-base btn-red-h20 common-sprite'><span class='common-sprite'>已认证</span></span></div><div class='progress-bar'><span class='progress bg-red' style='width: 46%;'></span></div>";
	private static final String NIGHT = "<div class='item-rate clearfix'><span class='rate1'> <em>";
	private static final String TEN = 	"46%</em><br>好评度</span> <span class='rate3'> <em>";
	private static final String EVLEVEN = "</em><br>报名人数</span></div></div></li>";
		
	
	@RequestMapping("write")
	public void writeCouresForIndex(){
		StringBuilder productStr = new StringBuilder();
		List<Product> products = productService.listForIndex(COUNT);
		for(int i=0; i< products.size(); i++){
			Product product = products.get(i);
			productStr.append(ONE).append(product.getId()).append(TWO).append(product.getImgurl()).append(WHREE).append(product.getName())
			.append(FORE).append(FIVE01).append(FIVE02).append(FIVE03).append(SIX).append(product.getId())
			.append(SEVEN).append(product.getName()).append(EIGHT).append(NIGHT).append(TEN).append(EVLEVEN);
		}
		HtmlFileWriter.writeHtml(productStr.toString(), COURSE_FOR_INDEX);
	}
	
	
}
