<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值</title>
<meta http-equiv="Refresh" content="5;URL=" />
<link href="../../../css/style.css" rel="stylesheet" type="text/css" />
<script src="../../../js/jquery.js" type="text/javascript"></script>
</head>
  
  <body>
    <div class="iBody">
  <h1 class="logo"><a href="http://mm.yue.ifeng.com"><img src="../../../images/logo.png" /></a></h1>
  <p class="headright"><a href="#" class="icon1">加入收藏</a><a href="#" class="icon2">下载客户端</a></p>
</div>
<div class="iBody">
  <h4 class="tit4">充值 &gt;</h4>
</div>
<div class="loginbg" style="margin-top:20px">
<%if(request.getParameter("trade_status").equals("TRADE_SUCCESS")){ %>
	<p class="green2">√  恭喜你，支付成功!</p>
<%}else if(request.getParameter("trade_status").equals("TRADE_WAIT_AFFIRM")){ %>
	<p class="green2">√  支付提交成功，等待确认!</p>
<%}else { %>
	<p class="green2">支付失败!</p>
<%} %>
   <p><span class="butmar3">
     <a href="http://mm.yue.ifeng.com" class="but2 "> 返回</a>
   </span></p>

</div>

<div class="footer mar-top40"> <span class="logo"><a href="http://mm.yue.ifeng.com"><img src="../../../images/logo.png" /></a></span>
  <p><a href="http://www.ifeng.com/corp/about/">关于凤凰新媒体</a> |<a href="http://mm.yue.ifeng.com
"> 秀场首页</a> | <a href="http://yue.ifeng.com">音乐首页</a> | <span style="color:#000">客服电话:4008109890 | 客服邮箱: wireless@ifeng.com</span><br />
    [京ICP证030609号] [文网文[2010]136号]<br />
    凤凰新媒体 版权所有<br />
  Copyright © 2013 Phoenix New Media Limited All Rights Reserved.</p>
</div>
 
  </body>
</html>