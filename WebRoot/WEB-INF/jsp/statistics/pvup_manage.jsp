<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户PV、UV统计</title>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.4.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<%
	String uc = (String)request.getAttribute("uc");
	String oc = (String)request.getAttribute("oc");
	String ac = (String)request.getAttribute("ac");
	String pc = (String)request.getAttribute("pc");
	String pv = (String)request.getAttribute("pv");
	String uv = (String)request.getAttribute("uv");
	int uci = 0;
	int oci = 0;
	int aci = 0;
	int pci = 0;
	int pvi = 0;
	int uvi = 0;
	if(StringUtils.isNotEmpty(uc)){
		uci = Integer.parseInt(uc);
	}
	if(StringUtils.isNotEmpty(oc)){
		oci= Integer.parseInt(oc);
	}
	if(StringUtils.isNotEmpty(ac)){
		 aci= Integer.parseInt(ac);
	}
	if(StringUtils.isNotEmpty(pc)){
	 	pci = Integer.parseInt(pc);
	}
	if(StringUtils.isNotEmpty(pv)){
		pvi = Integer.parseInt(pv);
	}
	if(StringUtils.isNotEmpty(uv)){
	 	uvi = Integer.parseInt(uv);
	}
%>
<table align="center">
	<tr align="center">
		<td>
			昨日新增注册用户数：<%=uc%>
		</td>
		<td>
			昨日新增订单数：<%=oc %>
		</td>
		<td>
			昨日新增订单数金额：<%=ac %>
		</td>
		<td>
			昨日新增支付金额：<%=pc %>
		</td>
	</tr>
	<%
		if(pvi !=0 && uvi != 0){
	%>
	<tr align="center">
		<td>
			新增用户与PV、UV比值：<%=String.format("%10.2f%%", uci / (Math.round(pvi*100)/100.0))  %>、<%= String.format("%10.2f%%", uci / (Math.round(uvi*100)/100.0))%>
		</td>
		<td>
			新增订单与 PV、UV比值：<%=String.format("%10.2f%%", oci / (Math.round(pvi*100)/100.0))%>、<%=String.format("%10.2f%%", oci / (Math.round(uvi*100)/100.0)) %>
		</td>
		<td>
			新增订单数金额与PV、UV比值：<%=String.format("%10.2f%%", aci / (Math.round(pvi*100)/100.0)) %>、<%=String.format("%10.2f%%", aci / (Math.round(uvi*100)/100.0))%>
		</td>
		<td>
			新增支付金额与PV、UV比值：<%=String.format("%10.2f%%", pci / (Math.round(pvi*100)/100.0))%>、<%=String.format("%10.2f%%", pci / (Math.round(uvi*100)/100.0)) %>
		</td>
	</tr>
	<%
		}else{
	%>
	<tr align="center">
		<td colspan="4">
			<label><font color="red" size="10px">  请填写昨天的PV、UV值</font></label>
		</td>
	</tr>
	<%
		}
	%>
	<tr align="center">
		<td colspan="2">日期：<input id="date" name="date" readonly="readonly"  class="Wdate" type="text" onClick="WdatePicker()"></td>
		<td>PU数：<input id="pv" name="pv" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" ></td>
		<td>UV数：<input id="uv" name="uv" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" ></td>
	</tr>
	<tr align="center">
		<td>
			<input id="selectBtn"  type="button" value="查看历史PVUV">
		</td>
		<td colspan="2">
			<input id="submitBtn"  type="button" value="提交数据">
		</td>
		
	</tr>
</table>
</body>
<script type="text/javascript">
	$(function(){
		$('#submitBtn').click(function(){
			var pv = $('#pv').val();
			var uv = $('#uv').val();
			var date = $('#date').val();
			$.ajax({
				type:'post',
				dataType:'text',
				url:'<%=request.getContextPath() %>/PvUvServlet?selectType=add&pv='+pv+'&uv='+uv+'&date='+date,
				success:function(data){
					alert(data);
					window.location.reload();
				}
			});
		});
		
		$('#selectBtn').click(function(){
			$.ajax({
				type:'post',
				dataType:'text',
				url:'<%=request.getContextPath() %>/PvUvServlet?selectType=select',
				success:function(data){
					alert(data);
					window.location.reload();
				}
			});
		});
	})
</script>
</html>