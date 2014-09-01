<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>爱儿网-中国最具影响力的幼教园台</title>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/main.css">
<body>
	<!--header static-->
	<div class="header">
		<div class="wrap">
			<div class="img-logo">
				<h1>
					<a alt="" class="ie6fixpic" title="" href="/"></a>
				</h1>
			</div>
			
			<div class="menu">
				<ul class="clearfix">
					<li><a href="/">首页 </a></li>
					<li class="select"><a href="../course/list.htm">课程 </a></li>
					<li><a href="../teacher/list.htm">教师 </a></li>
				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form action="/deals" method="post" id="header_new_search_form"
					wx-validator="" autocomplete="off">
					<input type="text" name="k" wx-validator-placeholder="搜索"
						wx-validator-rule="required" class="search-key gray"
						wx-validator-notip="" placeholder="搜索"> <input
						id="Js-search-submit" type="submit" class="btn-search ie6fixpic">
				</form>
			</div>
			<!--search end-->

			<!-- user menu start-->
			<div class="user-menu " id="jsddm">
				<div class="menu-hd tx">
					<a href="" class="tit"> <img id="headeravatar"
						src="./display_files/noavatar_small.gif"> <span
						class="ie6fixpic">kkllk…</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
						<ul>
							<li class="sup"><a class="ie6fixpic" href="">支持的项目</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="">发起的项目</a></li>
							<li class="att"><a class="ie6fixpic"
								href="">喜欢的项目</a></li>
							<li class="msg"><a class="ie6fixpic" href="">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="">个人设置</a></li>
							<li class="exit bn"><a class="ie6fixpic"
								href="">退出</a></li>
						</ul>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

		</div>
	</div>
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
					<li class="select"><a title="全部分类" href="">全部</a></li>
					<li><a href="" title="科技">科技</a></li>
					<li><a href="" title="设计">设计</a></li>
					<li><a href="" title="活动">活动</a></li>
					<li><a href="" title="影视">影视</a></li>
					<li><a href="" title="出版">出版</a></li>
					<li><a href="" title="音乐">音乐</a></li>
					<li><a href="" title="其它">其它</a></li>
				</ul>
			</div>
			<div class="filter-box clearfix">
				<div class="rel-key-rec">
					<a class="select" href="javascript:changeStatus(this,-1);">所有项目(238)</a> <a
						href="javascript:changeStatus(this,1);">在进行(160)</a> <a href="javascript:changeStatus(this,2);">已结束(77)</a>
				</div>
				<div class="range">
					<select name="deal_sort">
						<option value="" selected="selected">最新上线</option>
						<option value="">最高目标金额</option>
						<option value="">最多支持人数</option>
						<option value="">最多支持金额</option>
					</select>
				</div>
			</div>
			<div class="item-lists">
				<ul class="clearfix">
					<#list courses as item >
						<li>
							<!--Deal Card Module-->
							<div class="list-item">
								<a class="item-figure" href="${ctx}/course/getInfo.htm?id=${item.id}" target="_blank">
									<img src="${ctx}/images/tt.jpg"
									alt="${item.name}">
								</a>
								<div class="item-upvote">
									<a class="icons " href="javascript:void(0);" rel="10"
										onclick="">10</a>
								</div>
								<h3>
									<a href="${ctx}/course/getInfo.htm?id=${item.id}" target="_blank">${item.name}</a>
								</h3>
								<div class="item-caption">
									<span class="caption-title">目标：<em>53天</em> <em><i
											class="font-yen">¥</i>1000</em></span> <span
										class="btn-base btn-red-h20 common-sprite"> <span
										class="common-sprite">众筹中</span>
									</span>
								</div>
								<div class="progress-bar">
									<span class="progress bg-red" style="width: 0%;"></span>
								</div>
								<div class="item-rate clearfix">
									<span class="rate1"> <em>0%</em><br>已达
									</span>
									<span class="rate3"> <em>47天</em><br>剩余时间
									</span>
								</div>
							</div>
						</li>
					</#list>
				</ul>
				<div class="page tr">
					<a class="prev" href="">上一页</a> &nbsp;<a
						class="common-sprite" href="">&nbsp;1&nbsp;</a>&nbsp;<a
						class="common-sprite" href="">&nbsp;2&nbsp;</a>&nbsp;<a
						class="select common-sprite">3</a>&nbsp;<a class="common-sprite"
						href="">&nbsp;4&nbsp;</a>&nbsp;<a class="common-sprite"
						href="">&nbsp;5&nbsp;</a> <a class="common-sprite"
						href="">. . .</a> <a class="common-sprite"
						href="">20</a> <a class="next" href="">下一页</a>
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
							<a href="" title="科技">科技</a><em>/</em> <a
								href="" title="设计">设计</a><em>/</em> <a
								href="" title="活动">活动</a><em>/</em> <a
								href="" title="影视">影视</a><em>/</em>
						</dd>
						<dd>
							<a href="" title="出版">出版</a><em>/</em> <a
								href="" title="音乐">音乐</a><em>/</em> <a
								href="" title="其它">其它</a><em>/</em>

						</dd>
					</dl>
					<dl>
						<dt>关于</dt>
						<dd>
							<a href="" alt="关于众筹" title="关于众筹">关于众筹</a><em>/</em><a
								href="" alt="联系我们" title="联系我们">联系我们</a><em>/</em><a
								href="" alt="帮助中心" title="帮助中心">帮助中心</a><em>/</em>
						</dd>
						<dd>
							<a href="" alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a
								href="" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a
								href="" alt="项目发起规范" title="项目发起规范">项目发起规范</a><em>/</em>
						</dd>
					</dl>
					<dl>
						<dt>服务</dt>
						<dd>
							<a target="_blank"
								href=""
								alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em> <a target="_blank"
								href="" alt="QQ空间"
								title="QQ空间">QQ空间</a><em>/</em> <a target="_blank"
								href="" alt="新浪微博"
								title="新浪微博">新浪微博</a>
						</dd>
						<dd>
							<a target="_blank"
								href="" alt="豆瓣小站"
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
	
	//初始化一些脚本
	$(function(){
		
	});
	
	function changeStatus(it , status){
		$(".rel-key-rec").children().removeClass();
		$(this).addClass("select");
	}
	
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