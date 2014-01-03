<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,org.apache.commons.lang.*"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/taglib.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计页面</title>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	$("#userDetail").click(function(){
		$("#selectType").val(1);
		$("#form").submit();
	});
	
	$("#orderDetail").click(function(){
		$("#selectType").val(2);
		$("#form").submit();
	});
});
</script>
</head>
<%
 PrintWriter write =  response.getWriter();
%>
<body>
<form id="form" name="form" action="<%=request.getContextPath() %>/statistics/index.htm" method="post">
<input id="selectType" type="hidden" value="" >
<table align="center">
	<tr>
		<td>
			开始时间：<input id="startTime" name="startTime" value="<%=request.getAttribute("startTime")==null ? "" : request.getAttribute("startTime") %>" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
		</td>
		<td>
			结束时间：<input id="endTime" name="endTime" value="<%=request.getAttribute("endTime")== null ?"" :request.getAttribute("endTime") %>" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
		</td>
	</tr>
	<tr>
		<td>
			注册用户数总数：
		</td>
		<td>
			<%=
			request.getAttribute("registerC")
			%>
		</td>
	</tr>
	<tr>
		<td>
			订单数总数：
		</td>
		<td>
			<%= request.getAttribute("order") %>
		</td>
	</tr>
	<tr>
		<td>
			成功订单数：
		</td>
		<td>
			<%=request.getAttribute("order_pay") %>
		</td>
	</tr>
	<tr>
		<td>
			订单总金额：
		</td>
		<td>
			
			<%= request.getAttribute("allOrderMoney")==null  ? "0" : request.getAttribute("allOrderMoney").toString() %>
		</td>
	</tr>
	<tr>
		<td>
			成功订单总金额：
		</td>
		<td>
			<%= request.getAttribute("payOrderMoney")==null  ? "0" : request.getAttribute("payOrderMoney").toString() %>
		</td>
	</tr>
	
	<tr>
		<td>
			<a id="userDetail" ><font color="red">查看用户详情</font></a>
		</td>
		<td>
			<a id="orderDetail"><font color="red">查看订单详情</font></a>
		</td>
		<td>
			<a href="http://mm.yue.ifeng.com/statistics/queryPvUv.htm">查看PVUV</a>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" value="查询">
		</td>
	</tr>
</table>
</form>

</body>
</html>