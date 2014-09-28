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
	<#include "header.ftl">
	<script>
		$(document).ready(function() {
			$("select[name='deal_sort']").bind('change', function() {
				window.location.href = $(this).val();
			});
		});
	</script>
	<div class="main">
		<div class="wrap">
			<!--channel-nav static-->
			<div class="channel-nav">
				<ul class="clearfix">
					<li><a title="全部分类" href="/browse">全部</a></li> <#list categories
					as item>
					<li><a href="${ctx}/course/list.htm?cid=${item.id}"
						title="${item.name}">${item.name}</a></li> </#list>
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
				<#list teachers as item>
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure" href="/deal-show/id-16844" target="_blank">
								<img src="" alt="${item.name}" title="${item.name}" />
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="9"
									onclick="like_deal_v2(16844, this)">9</a>
							</div>
							<h3>
								<a href="${ctx}/teacher/getInfo.htm?id=${item.id}" target="_blank">让南红绽放真实的色彩</a>
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
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
	</script>

</body>
</html>
