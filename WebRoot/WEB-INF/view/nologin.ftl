<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title></title>
<meta name="keywords" content="家教 教育 英语 健身 母婴">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<!--public js&css start-->
<!--public js&css end -->    

<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/nologin.css">
</head>

<body>
<!--header static-->


<div class="header">
		<div class="wrap clearfix" pbid="header">
			<div class="img-logo">
				<h1>
					<a alt="" class="ie6fixpic" title="" href="index"></a>
				</h1>
			</div>
			<!--menu start-->
			<div class="menu">
				<ul class="clearfix" id="headermenu">
					<li ><a href="${ctx}/index.html">首页 </a></li>
					<li ><a href="${ctx}/course/list.htm">课程</a></li>
					<li><a href="${ctx}/teacher/list.htm">教师 </a></li>
					<li><a href="${ctx}/teacher/list.htm">新人帮助</a></li>
					<li class="select"  ><a href="${ctx}/course/prepublish.htm">发布课程</a></li>
				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form autocomplete="off" action="/deals" method="post"
					id="header_new_search_form" wx-validator="">
					<input placeholder="搜索" name="k" wx-validator-placeholder="搜索"
						wx-validator-rule="required" class="search-key gray"
						wx-validator-notip="" type="text"> <input
						id="Js-search-submit" class="btn-search ie6fixpic" type="submit">
				</form>
			</div>
			<!--search end-->

			<!-- user menu start-->
			<div class="user-menu" id="jsddm">
				<div class="menu-hd tx">
					<a href="" class="tit"> <span class='avatar-box'>
							<img id="headeravatar"
							src="${ctx}/images/noavatar_small.gif" />
					</span> <span class="user-name word-break ie6fixpic">游客</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
							<li class="sup"><a class="ie6fixpic" href="/home/id-154415">支持的项目</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="/home-build_deal/id-154415">发起的项目</a></li>
							<li class="att"><a class="ie6fixpic"
								href="/home-focus/id-154415">喜欢的项目</a></li>
							<li class="msg"><a class="ie6fixpic" href="${ctx}/message/index.htm">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="${ctx}/settings/index.htm">个人设置</a></li>
							<li class="exit bn"><a  class="ie6fixpic" id="logout"
								href="${ctx}/log/logout.htm">退出</a></li>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

			<!--login start-->
			<div class="login-wrap">
				<span id="usertag"> <a rel="nofollow"
					href="${ctx}/log/toLogin.htm">登录</a> <em>|</em> <a rel="nofollow"
					href="${ctx}/register/toRegister.htm">注册</a>
				</span> 
			</div>
			<!--login end-->
		</div>
	</div>


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
				<h3>发布课程</h3>
			</div>
			<div class="project-start">
				<form action="${ctx}/course/publish.htm" name="fqform" method="post">
					<h3>你不是不努力，只是没有好老师。学渣变学霸就从这里开始</h3>
					<p></p>
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
 
</body>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
</script>

</html>