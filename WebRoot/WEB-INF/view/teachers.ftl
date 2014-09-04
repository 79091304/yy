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
	<div class="footer">
		<!--footer section start-->
		<div class="footer-section clearfix">
			<div class="wrap">
				<!--footer map start-->
				<div class="foot-map">
					<dl>
						<dt>众筹项目</dt>
						<dd></dd>
						<dd>
							<a href="/browse/id-12" title="科技">科技</a><em>/</em> <a
								href="/browse/id-13" title="设计">设计</a><em>/</em> <a
								href="/browse/id-14" title="活动">活动</a><em>/</em> <a
								href="/browse/id-15" title="影视">影视</a><em>/</em>
						</dd>
						<dd>
							<a href="/browse/id-16" title="出版">出版</a><em>/</em> <a
								href="/browse/id-20" title="音乐">音乐</a><em>/</em> <a
								href="/browse/id-18" title="其它">其它</a><em>/</em>

						</dd>
					</dl>
					<dl>
						<dt>关于</dt>
						<dd>
							<a href="/help-about/id-1" alt="关于众筹" title="关于众筹">关于众筹</a><em>/</em><a
								href="/help-contact" alt="联系我们" title="联系我们">联系我们</a><em>/</em><a
								href="/help-center" alt="帮助中心" title="帮助中心">帮助中心</a><em>/</em>
						</dd>
						<dd>
							<a href="/help-team" alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a
								href="/help-term" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a
								href="/help-specification" alt="项目发起规范" title="项目发起规范">项目发起规范</a><em>/</em>
						</dd>
					</dl>
					<dl>
						<dt>服务</dt>
						<dd>
							<a target="_blank"
								href="http://tieba.baidu.com/f?ie=utf-8&kw=%E4%BC%97%E7%AD%B9%E7%BD%91"
								alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em> <a target="_blank"
								href="http://user.qzone.qq.com/2357291729" alt="QQ空间"
								title="QQ空间">QQ空间</a><em>/</em> <a target="_blank"
								href="http://e.weibo.com/zhongchouwang2013" alt="新浪微博"
								title="新浪微博">新浪微博</a>
						</dd>
						<dd>
							<a target="_blank"
								href="http://www.douban.com/people/zhongchou_cn/" alt="豆瓣小站"
								title="豆瓣小站">豆瓣小站</a><em>/</em>
						</dd>
					</dl>

				</div>
				<!--foot map end-->
				<div class="foot-logo">
					<h1></h1>
				</div>
			</div>
		</div>
		<!--footer section start-->
		<div class="footer-copy">
			<div class="wrap">
				<div class="ft-links">
					<div class="links-arrow">友情链接：</div>
					<p>
						<a href="http://iof.hexun.com/zhongchou/index.html"
							target="_blank">和讯网</a> <a href="http://www.leiphone.com/"
							target="_blank">雷锋网</a> <a href="http://www.36kr.com/"
							target="_blank">36氪</a> <a href="http://www.hao123.com/"
							target="_blank">hao123</a> <a href="http://hao.360.cn/"
							target="_blank">360安全网址</a> <a href="http://www.ynet.com/"
							target="_blank">北青网</a> <a href="http://finance.ifeng.com/"
							target="_blank">凤凰网</a> <a href="http://jrj.com.cn/"
							target="_blank">金融界</a> <a href="http://www.caixin.com/"
							target="_blank">财新网</a> <a href="http://www.tmtpost.com/"
							target="_blank">钛媒体</a>
					</p>
				</div>
				<p>©2013 北京东方联合投资管理有限公司 zhongchou.cn 版权所有 京ICP备11027068号</p>
			</div>
		</div>
	</div>

	<div id="code"></div>
	<div id="code_img"></div>
	<div id="gotop" style="display: none;"></div>
	<script>
    $('#code').hover(function(){
      $(this).attr('id','code_hover');
      $('#code_img').show();
    },function(){
      $(this).attr('id','code');
      $('#code_img').hide();
    });
    
$(window).scroll(function(){
		
		var s_top = $(document).scrollTop()+$(window).height()-70;
		if($.browser.msie && $.browser.version =="6.0")
		{
			$("#gotop").css("top",s_top);
			if($(document).scrollTop()>0)
			{				
				$("#gotop").css("visibility","visible");	
			}
			else
			{
				$("#gotop").css("visibility","hidden");	
			}
		}	
		else
		{
			if($(document).scrollTop()>0)
			{
				if($("#gotop").css("display")=="none")
				$("#gotop").fadeIn();	
			}
			else
			{
				if($("#gotop").css("display")!="none")
				$("#gotop").fadeOut();
			}
		}
		
		
	});		
	
	$("#gotop").bind("click",function(){		
		$("html,body").animate({scrollTop:0},"fast","swing",function(){});		
	});
	var top = $(document).scrollTop()+$(window).height()-70;
	if($.browser.msie && $.browser.version =="6.0")
	{
		$("#gotop").css("top",top);
		if($(document).scrollTop()>0)
		{	
			$("#gotop").css("visibility","visible");
		}
		else
		{
			$("#gotop").css("visibility","hidden");
		}
	}
	else
	{
		if($(document).scrollTop()>0)
		{	
			if($("#gotop").css("display")=="none")
			$("#gotop").show();	
		}
		else
		{
			if($("#gotop").css("display")!="none")
			$("#gotop").hide();
		}
	}

</script>



</body>
</html>