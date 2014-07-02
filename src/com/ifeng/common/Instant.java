package com.ifeng.common;

public class Instant {
  
	public static final String GUID_EMPTY = "-1";
	
	public static final int USER_STATE_NOMAL = 1;//正常用户
	
	public static final int USER_TYPE_EMPTYP = 0;//缺省值。应该是用户导入来源六间房、YY等
	
	public static final int ORDER_EMPTY= 0;//默认订单状态
	
	public static final int ORDER_PAYED = 1;//已支付
	
	public static final int ORDER_SENDED = 2;//已发货
	
	public static final int ORDER_SEND_FAILD = 3;//发货失败
	
	public static final int CHARGE_TYPE_EMPTY = -1;//默认充值类型
	
	public static final int CHARGE_TYPE_ZHIFUBAO = 0;//支付宝
	
	public static final int CHARGE_TYPE_IPOHONCARD = 4;//电话卡
	
	public static final int CHARGE_TYPE_BANKCARD = 1;//储蓄卡
	
	public static final int CHARGE_TYPE_CREDIT = 3;//信用卡
	
	public static final String CHARGE_GOOGPAY_URL = "http://211.151.175.47/interface/pay.php?";
	
	public static final int CHARGE_SOURCE_LIU = 1;//	六间房
	
	public static final int CHARGE_SOURCE_WOXIU = 2;//	我秀
}
