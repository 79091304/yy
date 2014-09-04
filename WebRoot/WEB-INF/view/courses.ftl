<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>众筹网-艺术众筹_传统工艺项目融资-众筹网</title>
<!--public js&css start-->
<!--public js&css end -->    
<link rel="stylesheet"  type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet"  type="text/css" href="${ctx}/css/list.css">
</head>

<body>
<!--header static-->
<#include "header.ftl">
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
				<li ><a title="全部分类"  href="/browse">全部</a></li>
													<li ><a href="/browse/id-12" title="科技">科技</a></li>
																		<li class="select"><a href="/browse/id-22" title="艺术">艺术</a></li>
																		<li ><a href="/browse/id-13" title="设计">设计</a></li>
																		<li ><a href="/browse/id-20" title="音乐">音乐</a></li>
																		<li ><a href="/browse/id-15" title="影视">影视</a></li>
																		<li ><a href="/browse/id-16" title="出版">出版</a></li>
																		<li ><a href="/browse/id-25" title="动漫游戏">动漫游戏</a></li>
																		<li ><a href="/browse/id-23" title="公益">公益</a></li>
																		<li ><a href="/browse/id-26" title="公开课">公开课</a></li>
																		<li ><a href="/browse/id-28" title="农业">农业</a></li>
																		<li ><a href="/browse/id-18" title="其他">其他</a></li>
												</ul>
		</div>
		<div class="filter-box clearfix">
			<div class="rel-key-rec">
				<a class="select" href="/browse/id-22">所有项目(95)</a>
				<a  href="/browse/id-22-r-di">众筹中(41)</a>
				<a  href="/browse/id-22-r-ds">已成功(54)</a>
			</div>
			<div class="range">
				<select name="deal_sort">
						<option value="/browse/id-22-s-df"  >默认排序</option>
                        <option value="/browse/id-22-s-sb"  >最新上线</option>
                        <option value="/browse/id-22-s-sm"  >最高目标金额</option>
                        <option value="/browse/id-22-s-si_c"  >最多支持人数</option>
                        <option value="/browse/id-22-s-si_m"  >最多支持金额</option>
                    </select>
			</div>
		</div>
		<div class="item-lists">
			<ul class="clearfix">
				
								<li>
					<!--Deal Card Module-->
	<div class="list-item">
		<a class="item-figure" href="/deal-show/id-16844" target="_blank">
			<img src="http://zrstatic.wangxingroup.com/attachment/201409/03/10/617a69775253bb10a96420987718f80155_223x168.jpg" alt="南红不再遥远，我们要与您一起分享南红。" title="南红不再遥远，我们要与您一起分享南红。" />
		</a>
		<div class="item-upvote">
			<a class="icons " href="javascript:void(0);" rel="9" onclick="like_deal_v2(16844, this)" >9</a>
		</div>
		<h3><a href="/deal-show/id-16844" target="_blank">让南红绽放真实的色彩</a></h3>
		<div class="item-caption">
					<span class="caption-title">目标：<em>20天</em> <em><i class="font-yen">&yen;</i>30000</em></span>
					<span class="btn-base btn-red-h20 common-sprite">
				<span class="common-sprite">众筹中</span>
			</span>
		</div>
		<div class="progress-bar">
			<span class="progress bg-red" style="width:2%;"></span>
		</div>
		<div class="item-rate clearfix">
						<span class="rate1">
 				<em>2%</em><br>已达
			</span>
			<span class="rate2">
 				<em>￥509</em><br>已筹资
			</span>
						<span class="rate3">
 				<em>19天</em><br>剩余时间			</span>
		</div>
	</div>
				</li>
							</ul>
			<div class="page tr">
				     &nbsp;<A class='select common-sprite'>1</a>&nbsp;<a class='common-sprite' href='/browse/id-22-p-2'>&nbsp;2&nbsp;</a>&nbsp;<a class='common-sprite' href='/browse/id-22-p-3'>&nbsp;3&nbsp;</a>&nbsp;<a class='common-sprite' href='/browse/id-22-p-4'>&nbsp;4&nbsp;</a>&nbsp;<a class='common-sprite' href='/browse/id-22-p-5'>&nbsp;5&nbsp;</a>    <a class='next' href='/browse/id-22-p-2'>下一页</a> 
			</div>
		</div>
	</div>
</div>
<!--footer static-->

<#include "footer.ftl">


     
</html> 
