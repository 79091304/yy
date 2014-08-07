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
	
	private Object data = null;

	public ResponseMessage(int code, String msg) {
		super();
		this.code = code;
		this.setMsg(msg);
	}
	
	public ResponseMessage(int code, String msg,Object data) {
		super();
		this.code = code;
		this.setMsg(msg);
		this.setData(data);
	}
	
	public ResponseMessage(Object data) {
		super();
		this.code = 1;
		this.setMsg(MSG_SUCCESS);
		this.setData(data);
	}
	
	
	
	public static final ResponseMessage SUCCESS = new ResponseMessage(1, "success");
	
	public static final ResponseMessage FAIL = new ResponseMessage(0, "fail");
	
	public static final ResponseMessage CODEFAIL = new ResponseMessage(-1, "验证码错误");

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
