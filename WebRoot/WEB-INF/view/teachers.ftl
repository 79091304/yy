<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>爱儿网-中国最具影响力的幼教园台</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<body>
	<!--header static-->
	<#include "header.ftl">
	<!--header-end-->
	<script>
$(document).ready(function(){
    $("select[name='deal_sort']").bind('change',function(){
    	window.location.href=$(this).val();
    });
});
</script>
	<div class="main">
		<div class="wrap">
			<!--channel-nav static-->
			<div class="channel-nav">
				<ul class="clearfix">
					<li class="select"><a title="全部分类" href="/browse">全部</a></li>
					<li><a href="/browse/id-12" title="科技">科技</a></li>
					<li><a href="/browse/id-13" title="设计">设计</a></li>
					<li><a href="/browse/id-14" title="活动">活动</a></li>
					<li><a href="/browse/id-15" title="影视">影视</a></li>
					<li><a href="/browse/id-16" title="出版">出版</a></li>
					<li><a href="/browse/id-20" title="音乐">音乐</a></li>
					<li><a href="/browse/id-18" title="其它">其它</a></li>
				</ul>

			</div>
			<div class="filter-box clearfix">
				<div class="rel-key-rec">
					<a class="select" href="/browse">所有项目(238)</a> <a
						href="/browse/r-di">在进行(160)</a> <a href="/browse/r-ds">已结束(77)</a>
				</div>
				<div class="range">
					<select name="deal_sort">
						<option value="/browse/s-sb" selected="selected">最新上线</option>
						<option value="/browse/s-sm">最高目标金额</option>
						<option value="/browse/s-si_c">最多支持人数</option>
						<option value="/browse/s-si_m">最多支持金额</option>
					</select>
				</div>
			</div>
			<div class="item-lists">
				<ul class="clearfix">
					<#list teachers as item>
						<li>
							<div class="list-item">
								<a class="item-figure" href="" target="_blank">
									<img src="images/tt.jpg" alt="【-声演坊】Bang Gang2014年中国巡演·长沙站">
								</a>
								<div class="item-upvote">
									<a class="icons " href="javascript:void(0);" rel="10"
										onclick="like_deal_v2(2789, this)">10</a>
								</div>
								<h3>
									<a href="" target="_blank">【-声演坊】Bang
										Gang2014年中国巡演·长沙站</a>
								</h3>
								<div class="item-caption">
									<span
										class="btn-base btn-red-h20 common-sprite"> <span
										class="common-sprite">众筹中</span>
									</span>
								</div>
								<div class="progress-bar">
									<span class="progress bg-red" style="width: 0%;"></span>
								</div>
								<div class="item-rate clearfix">
									<span class="rate1"> <em>0%</em><br>已达
									</span> <span class="rate2"> <em>￥0</em><br>已筹资
									</span> <span class="rate3"> <em>47天</em><br>剩余时间
									</span>
								</div>
							</div>
						</li>
					</#list>
				</ul>
				<div class="page tr">
					<a class="prev" href="/browse/p-2">上一页</a> &nbsp;<a
						class="common-sprite" href="/browse/p-1">&nbsp;1&nbsp;</a>&nbsp;<a
						class="common-sprite" href="/browse/p-2">&nbsp;2&nbsp;</a>&nbsp;<a
						class="select common-sprite">3</a>&nbsp;<a class="common-sprite"
						href="/browse/p-4">&nbsp;4&nbsp;</a>&nbsp;<a class="common-sprite"
						href="/browse/p-5">&nbsp;5&nbsp;</a> <a class="common-sprite"
						href="/browse/p-8">. . .</a> <a class="common-sprite"
						href="/browse/p-20">20</a> <a class="next" href="/browse/p-4">下一页</a>
				</div>
			</div>
		</div>
	</div>
	<!--footer static-->
	
	<#include "footer.ftl" >


</body>
</html>