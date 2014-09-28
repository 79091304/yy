package com.ifeng.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifeng.dao.CommentDao;
import com.ifeng.service.CommentService;

@Repository("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;


	
	
}
