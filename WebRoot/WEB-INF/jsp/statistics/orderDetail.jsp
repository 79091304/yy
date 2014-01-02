<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
</head>
<body>
<table align="center" width="70%">
	<tr>
		<td colspan="6">
			<a href="<%=request.getContextPath() %>/StatisticsServlet?key=52468ddfsedf&selectType=0">返回统计首页</a>
		</td>
	</tr>
	<tr>
		<td width="20%">
			用户ID
		</td>
		<td width="10%">
			充值金额(元)
		</td>
		<td width="20%">
			订单号
		</td>
		<td width="20%">
			充值状态
		</td>
		<td  width="20%">
			充值方式
		</td>
		<td  width="10%">
			时间
		</td>
	</tr>
	<%
		List orderList = (List)request.getAttribute("orderList");
		if(null != orderList && orderList.size() > 0){
	%>
	<%
		for(int i=0; i< orderList.size(); i++){
			Map data = (Map)orderList.get(i);
	%>
	<tr>
		<td>
			<%=data.get("userkey") == null ? "" : data.get("userkey").toString()%>
		</td>
		<td>
			<%=data.get("chargemoney") == null ? "" : Double.parseDouble(data.get("chargemoney").toString())%>
		</td>
		<td>
			<%=data.get("orderid") == null ? "" : data.get("orderid").toString()%>
		</td>
		<td>
			<%=Integer.parseInt(data.get("states").toString()) == 0 ? "未支付" : "已支付"%>
		</td>
		<td>
			<%=(StringUtils.isEmpty(data.get("chargetype").toString())) ? "未进入支付流程" : 
				(Integer.parseInt(data.get("chargetype").toString()) == 1 ? "储蓄卡" : 
					(Integer.parseInt(data.get("chargetype").toString()) == 4 ? "电话卡" : 
						(Integer.parseInt(data.get("chargetype").toString()) == 0 ? "支付宝":"信用卡")))
			%>
		</td>
		<td>
		
			<%=data.get("starttime") == null ? "" : data.get("starttime").toString()%>
		</td>
	</tr>
	<%
			}
		}
	%>
</table>
</body>
</html>