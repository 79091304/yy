<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title></title>
<meta name="keywords" content="">
<meta name="description" content="">
<!--public js&css start-->
<!--public js&css end -->    

<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/nologin.css">
</head>

<body>
<!--header static-->
<#include "header.ftl">

<script type="text/javascript">
$(function() {
	var flag = '';  
});
	
function dosubmit(){
	if(!$("#flag").attr("checked")){
		wx.alert('您还没有同意服务协议。');
		return false;
	}
	window.fqform.submit();
}

</script>
<!--main static-->
<div class="main clearfix">
	<div class="wrap clearfix">		
		<!--content static-->
		<div class="radius-hd">
			<div class="radius-hl common-sprite"></div>
			<div class="radius-hc w950"></div>
			<div class="radius-hr common-sprite"></div>
		</div>
		<div class="radius-bd project-con w958">
			<div class="tit-wrap">
				<h3>发起项目</h3>
			</div>
			<div class="project-start">
				<form action="${ctx}/course/publish.htm" name="fqform" method="post">
					<h3>如果你有一颗真诚的心那么请在这里发起你的梦想</h3>
					<p>我们是一家可以帮助您实现梦想的网站，在这里您可以发布您的梦想、创意和创业计划，并通过网络平台面对公众集资，让有创造力的人可能获得他们所需要的资金，以便使他们的梦想有可能实现。</p>
					<div class="pro-agr-chk">
						<input id="flag" name="flag" checked="checked" type="checkbox">
						阅读并同意<a class="red" href="help-term" target="_blank">《服务协议》</a>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="pro-agr-btn">
						<a class="btn-base btn-red-h37 common-sprite" href="#" onclick="dosubmit();"><span class="common-sprite">立即发布课程</span></a>
					</div>
				</form>
			</div>
		</div>
		<div class="radius-ft">
			<div class="radius-fl common-sprite"></div>
			<div class="radius-fc w950"></div>
			<div class="radius-fr common-sprite"></div>
		</div>
		<!--content end-->		
	</div>
</div>
<!--main end-->
<!--footer static-->

<#include "footer.ftl">
 
</body></html>