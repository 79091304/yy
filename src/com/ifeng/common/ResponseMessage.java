package com.ifeng.common;

/**
 * 请求返回信息
 * @author zhang_zhanhui
 *
 */
public class ResponseMessage {

	public static final String CODE = "code";
	public static final String MESSAGE = "message";
	public static final int CODE_EMPTY = -1;
	public static final String MSG_EMPTY = "参数为空，或者不完整";

	public static final int CODE_SUCCESS= 1;
	public static final String MSG_SUCCESS = "成功";
	
	
	public static final int CODE_TOKEN_ERROR = 2;
	public static final String MSG_TOKEN_ERROR = "token验证错误";
	
	private int code = -1;
	
	private String msg = "fail";

	public ResponseMessage(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}
	
	
	public static final ResponseMessage SUCCESS = new ResponseMessage(1, "success");
	
	public static final ResponseMessage FAIL = new ResponseMessage(0, "fail");
}
