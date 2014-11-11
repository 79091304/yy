<html>
<head>
<title>课程审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body leftmargin=5 topmargin=5 marginwidth=0 marginheight=0>
<form name="frmSearch" method="post" action="./queryCall.htm">
<table width='100%' border='0' cellspacing='0' cellpadding='3' align='center'>
  <tr>
   
  </tr>
</table>
</form>
<table width='100%' border='0' cellpadding="3" cellspacing="0">
  <tr align=center>
    <td>
    <table width='100%' border='0' cellpadding="3" cellspacing="1" >
      <tr align=center bgcolor=#999999  height=25 >
        <td ><b>课程名</b></td>
        <td ><b>课程ID</b></td>
        <td ><b>课程状态</b></td>
        <td ><b>发布时间</b></td>
        <td ><b>操作</b></td>
      </tr>
      
      <#list courses as item >
      	<tr>
      		 	<td ><b>${item.name}</b></td>
		        <td ><b><a href='${ctx}/course/getInfo.htm?id=${item.id}' >${item.id}</b></td>
		        <td>${item.status}</td>
		        <td ><b>${item.createdAt?string("yyyy-MM-dd HH:mm:ss")}</b></td>
		        <td ><b><a href='${ctx}/admin/auditCourse.htm?id=${item.id}&state=1'>审核通过</a></b></td>
      	</tr>
      </#list>
    </table>
    </td>
  </tr>
</table>
 
</body>
</html>
    