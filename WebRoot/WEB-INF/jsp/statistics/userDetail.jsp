<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详情</title>
</head>
<body>
<table align="center" width="80%">
	<tr >
		<td colspan="4">
			<a href="<%=request.getContextPath() %>/StatisticsServlet?key=52468ddfsedf&selectType=0">返回统计首页</a>
		</td>
	</tr>
	<tr>
		<td width="20%">
			用户ID
		</td>
		<td width="10%">
			EMAIL
		</td>
		<td width="20%">
			来源
		</td>
		
		<td  width="10%">
			创建时间
		</td>
	</tr>
	<%
		List userList = (List)request.getAttribute("userList");
		if(null != userList && userList.size() > 0){
	%>
	<%
		for(int i=0; i< userList.size(); i++){
			Map data = (Map)userList.get(i);
	%>
	<tr>
		<td>
			<%=data.get("id") == null ? "" : data.get("id").toString()%>
		</td>
		<td>
			<%=data.get("email") == null ? "" : data.get("email").toString()%>
		</td>
		<td>
			<%=data.get("type") == null ? "六间房" : 
				(Integer.parseInt(data.get("type").toString()) == 1 ? "六间房" : 
					(Integer.parseInt(data.get("type").toString()) == 4 ? "六间房" : 
						(Integer.parseInt(data.get("type").toString()) == 0 ? "六间房":"六间房")))
			%>
		</td>
		<td>
			<%=data.get("createdtime") == null ? "" : data.get("createdtime").toString()%>
		</td>
	</tr>
	<%
			}
		}
	%>
</table>
</body>
</html>