package com.ifeng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifeng.service.CommentService;

@Controller
@RequestMapping("/comment/")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	/**
	 * 回复
	 * @param content 内容
	 * @param pid 父亲评论id
	 * @param uid
	 */
	public Object reply(String content,String pid,String uid){
		return null;
	}
}
