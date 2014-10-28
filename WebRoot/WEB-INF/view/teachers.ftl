<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>教师页面--中国最具权威的教育平台</title>
<meta name="keywords" content="家教 教育 英语 健身 母婴">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/list.css">
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
					<li ><a href="${ctx}/index.shtml">首页 </a></li>
					<li ><a href="${ctx}/course/list.htm">课程</a></li>
					<li class="select" ><a href="${ctx}/teacher/list.htm">教师 </a></li>
					<li><a href="${ctx}/teacher/list.htm">新人帮助</a></li>
					<li><a href="${ctx}/course/prepublish.htm">发布课程</a></li>
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
					</span> <span id="uanme" class="user-name word-break ie6fixpic">游客</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
							<li class="spo"><a class="ie6fixpic"
								href="#">报名的课程</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="#">发布的课程</a></li>
							<li class="att"><a class="ie6fixpic"
								href="#">喜欢的课程</a></li>
							<li class="msg"><a class="ie6fixpic" href="${ctx}/message/index.htm">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="${ctx}/settings/index.htm">个人设置</a></li>
							<li class="exit bn"><a  class="ie6fixpic" id="logout" href="${ctx}/log/logout.htm"
								>退出</a></li>
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
	
	<div class="main">
		<div class="wrap">
			<!--channel-nav static-->
			<div class="channel-nav">
				<ul class="clearfix">
					<li><a title="全部分类" href="/browse">全部</a></li> 
					<#list categories as item>
					<li><a href="${ctx}/course/list.htm?cid=${item.id}"
						title="${item.name}">${item.name}</a></li> 
					</#list>
				</ul>
			</div>
			<div class="filter-box clearfix">
				<div class="range">
					<select name="deal_sort">
						<option value="">默认排序</option>
						<option value="">最新教师</option>
						<option value="">最受欢迎</option>
					</select>
				</div>
			</div>
			<div class="item-lists">
				<ul class="clearfix">
				<#list page.records as item>
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure" href="${ctx}/teacher/getInfo.htm?id=${item.id}" target="_blank">
								<img src="${item.imgUrl!'www.lanrenyuan.com/images/teacher.jpg'}" alt="${item.name}" title="${item.name}" />
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="9"
									onclick="like_deal_v2(16844, this)">9</a>
							</div>
							<h3>
								<a href="${ctx}/teacher/getInfo.htm?id=${item.id}" target="_blank">${item.name}</a>
							</h3>
							<div class="item-caption">
								<span class="caption-title">五朵花</span>
							</div>
						</div>
					</li>
					</#list>
				</ul>
				<div class="page tr">
					&nbsp;<A class='select common-sprite'>1</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-2'>&nbsp;2&nbsp;</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-3'>&nbsp;3&nbsp;</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-4'>&nbsp;4&nbsp;</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-5'>&nbsp;5&nbsp;</a> <a
						class='next' href='/browse/id-22-p-2'>下一页</a>
				</div>
			</div>
		</div>
	</div>
	<!--footer static-->

	<#include "footer.ftl">
	<script type="text/javascript">
		$(document).ready(function() {
			$("select[name='deal_sort']").bind('change', function() {
				window.location.href = $(this).val();
			});
		});
	</script>
	<script type="text/javascript">
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
	</script>

</body>
</html>
