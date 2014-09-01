<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>有宝宝-中国最具影响力的幼儿园平台</title>
<meta name="keywords" content="幼儿园">
<meta name="description" content="为孩子寻找最好的幼儿园，给家长提供最好的建议">
<!--public js&css start-->
<!--public js&css end -->
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script >
$(function(){
	var uid = $.cookie('uid');
	if(null != uid && '' != uid){
		$.ajax({
			url : "./user/getInfo.htm?uid="+uid,
		    type : "POST", 
		    dataType:"text",
		    contentType:'text/html',
		    data:{},
		    success : function(data) {
		        $("#usertag").html(data.username);  
		    },
			error:function(e){
		    }  
		});
	}
})
</script>
</head>

<body>
	<!--header static-->
	<div class="header">
		<div class="wrap">
			<div class="img-logo">
				<h1>
					<a alt="好学党" class="ie6fixpic" title="好学党"
						href="">好学党</a>
				</h1>
			</div>
			<!--menu start-->
			<div class="menu">
				<ul class="clearfix">
					<li class="select"><a href="#">首页 </a></li>
					<li><a href="/browse"></a></li>
					<li><a href="./teacher/list.htm">教师 </a></li>
					<li><a href="./course/list.htm">课程</a></li>

				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form action="/deals" method="post"
					id="header_new_search_form" wx-validator="" autocomplete="off">
					<input type="text" name="k" wx-validator-placeholder="搜索"
						wx-validator-rule="required" class="search-key gray"
						wx-validator-notip="" placeholder="搜索"> <input
						id="Js-search-submit" type="submit" class="btn-search ie6fixpic">
				</form>
			</div>
			<!--search end-->

			<!--login start-->
			<div class="login-wrap">
				<span id="usertag">
				<a href="./login/toLogin.htm">登录</a> <em>|</em> 
				<a href="./register/toRegister.htm">注册</a></span>
				<em>|</em> <a href="cooperation.html">个人中心</a>
				<em>|</em> <a href="cooperation.html">商务合作</a>
			</div>
			<!--login end-->

		</div>
	</div>
	<!--header-end-->
	<link rel="stylesheet" type="text/css" href="css/a2.css">
	<div class="banner">
		<div class="wrap">
			<style>
#JS-banner_ul {
	position: relative;
}

#JS-banner_ul li {
	float: left
}
</style>
			<div class="wrap" style="overflow: hidden;">
				<ul id="JS-banner_ul" class="clearfix"
					style="height: 392px; width: 6720px; margin-left: 0px;">
					<li><a target="_blank"
						href="/deal-show/id-2654"> <img
							class="lz" width="960" height="392" src="images/u1.jpg">
					</a></li>
					<li><a target="_blank"
						href="/deal-show/id-2756"> <img
							class="lz" width="960" height="392" src="images/u2.jpg">
					</a></li>
					<li><a target="_blank"
						href="/deal-show/id-2025"> <img
							class="lz" width="960" height="392" src="images/u3.jpg">
					</a></li>
					<li><a target="_blank"
						href="/deal-show/id-2497"> <img
							class="lz" width="960" height="392" src="images/u4.jpg">
					</a></li>
					<li><a target="_blank"
						href="/deal-show/id-2732"> <img
							class="lz" width="960" height="392" src="images/u5.jpg">
					</a></li>
					<li><a target="_blank"
						href="/deal-show/id-2734"> <img
							src="images/u6.jpg" width="960" height="392">
					</a></li>
					<li><a target="_blank"
						href="/deal-show/id-2954"> <img
							class="lz" width="960" height="392" src="images/u7.jpg">
					</a></li>
				</ul>
			</div>
			<div class="focus-btn">
				<a id="JS-banner_pre" class="prev common-sprite ie6fixpic"
					href="javascript:void(0);">上一张</a> <a id="JS-banner_next"
					class="next common-sprite ie6fixpic" href="javascript:void(0);">下一张</a>
			</div>
		</div>
	</div>
	<script>
		(function(){
			var len = 7;
			var banner = $("#JS-banner_ul");
			banner.css("width", len * 960);
			var sindex = 0;
			var inanimate = false;
			var inHover = false;

			function moveByDirect(to_right) {
				if (inanimate) return;
				autoScroll();
				inanimate = true;
				var start = 0;
				var end = - 960;
				if (!to_right) {
					start = -960;
					end = 0;
					banner.children().last().insertBefore(banner.children().first());
				}
				banner.css("margin-left", start);
				banner.animate({"margin-left": end}, 500, function(){
					inanimate = false;
					if (to_right) {
						banner.children().first().insertAfter(banner.children().last());
					}
					banner.css("margin-left", 0);
			 	});
			}

			$("#JS-banner_pre").bind("click", function(){
				moveByDirect(false);
			});
			$("#JS-banner_next").bind("click", function(){
				moveByDirect(true);
			});
			$("#JS-banner_ul").bind("mouseover", function(){
				inHover = true;
			});
			$("#JS-banner_ul").bind("mouseout", function(){
				inHover = false;
			});

			var timer = null;
			function clearAutoScroll() {
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			}

			function autoScroll() {
				clearAutoScroll();
				timer = setTimeout(function() {
					if (!inHover) {
						moveByDirect(true);
					} else {
						autoScroll();
					}
				}, 5000);
			}
			autoScroll();
		})();
		$(function(){
			$("#JS-banner_ul img").each(function(){
				$(this).attr("src",$(this).attr("data-src"));
			});
		});
	</script>

	<div class="site-focus">
		<div class="wrap">
			<div class="mod-title clearfix">
				<h2>最热教师</h2>
				<div class="title-sub"></div>
			</div>
			<div class="focus-box" style="overflow: hidden;">
				<ul id="JS-recommend_ul" class="focus-con clearfix"
					style="width: 980px;">
					<#list courses as item>
						<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure"
								href="/deal-show/id-2954" target="_blank">
								<img src="images/tt.jpg" alt="汇源有机草莓，每一颗都珍贵">
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="27"
									onclick="like_deal_v2(2954, this)">27</a>
							</div>
							<h3>
								<a href="/deal-show/id-2954"
									target="_blank">汇源有机草莓，每一颗都珍贵</a>
							</h3>
							<div class="item-caption">
								<span class="btn-base btn-red-h20 common-sprite"> <span
									class="common-sprite">已认证</span>
								</span>
							</div>
							<div class="progress-bar">
								<span class="progress bg-red" style="width: 46%;"></span>
							</div>
							<div class="item-rate clearfix">
								<span class="rate1"> <em>46%</em><br>好评度
								</span> <span class="rate3"> <em>13</em><br>资历指数
								</span>
							</div>
						</div>
					</li>
					
					</#list>
					
				</ul>
				<ul id="JS-recommend_btns" class="focus-btn clearfix">
					<li id="JS-recommend_pre" class="prev"><span
						class="common-sprite">prev</span></li>
					<li dataindex="0" class="JS-recommend_btn select"><span
						class="common-sprite">1</span></li>
					<li id="JS-recommend_next" class="next"><span
						class="common-sprite">next</span></li>
				</ul>
			</div>
			<script>
			(function(){
				var len = parseInt(($("#JS-recommend_ul li").length + 3) / 4);
				var recommendUl = $("#JS-recommend_ul");
				recommendUl.css('width', len * 980);
	
				var spage = 0;
				var inanimate = false;
				var inHover = false;
				function moveToPage(page) {
					page = (page + len) % len;
					if (page < 0 || page >= len || spage == page || inanimate) return;
					autoScroll();
					spage = page;
					inanimate = true;
					recommendUl.animate({"margin-left": - spage * 980}, 500, function(){
						inanimate = false;
						$(".JS-recommend_btn.select").removeClass("select");
						$(".JS-recommend_btn").eq(spage).addClass("select");
				 	});
					
				}
	
				var btns = $("#JS-recommend_btns");
				for (var i = 0; i < len; i++) {
					var li = document.createElement('li');
					li.innerHTML = '<span class="common-sprite">' + (i + 1) + '</span>';
					$(li).attr('dataindex', i);
					li.className = 'JS-recommend_btn';
					$(li).insertBefore($("#JS-recommend_next"));
				}
				$("#JS-recommend_pre").bind("click", function() {
					moveToPage(spage - 1);
				});
				$("#JS-recommend_next").bind("click", function() {
					moveToPage(spage + 1);
				});
				$(".JS-recommend_btn").bind("click", function() {
					moveToPage(parseInt($(this).attr('dataindex'), 10));
				});
				$(".JS-recommend_btn").eq(0).addClass("select");
				$("#JS-recommend_ul").bind("mouseover", function(){
					inHover = true;
				});
				$("#JS-recommend_ul").bind("mouseout", function(){
					inHover = false;
				});

				var timer = null;
				function clearAutoScroll() {
					if (timer) {
						clearTimeout(timer);
						timer = null;
					}
				}

				function autoScroll() {
					clearAutoScroll();
					timer = setTimeout(function() {
						if (!inHover) {
							moveToPage(spage + 1);
						} else {
							autoScroll();
						}
					}, 7000);
				}
				autoScroll();
			})();
			</script>
		</div>
	</div>

	<div class="main wrap">
		<div class="hot-project-box">
			<!--mod tit start-->
			<div class="mod-title clearfix">
				<h2>最热课程</h2>
				<div class="title-sub"></div>
			</div>
			<!--mod tit end-->
			<div class="hot-project">
				<ul class="clearfix">
				
				<#list teachers as item>
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure"
								href="/deal-show/id-3032" target="_blank">
								<img src="images/tt.jpg" alt="雅顾光影照相师 您也能像苏菲玛索一样美！">
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="8"
									onclick="like_deal_v2(3032, this)">8</a>
							</div>
							<h3>
								<a href="/deal-show/id-3032"
									target="_blank">雅顾光影照相师 您也能像苏菲玛索一样美！</a>
							</h3>
							<div class="item-caption">
								<span class="caption-title">目标：<em>11天</em> <em><i
										class="font-yen">¥</i>3000</em></span> <span
									class="btn-base btn-red-h20 common-sprite"> <span
									class="common-sprite">众筹中</span>
								</span>
							</div>
							<div class="progress-bar">
								<span class="progress bg-red" style="width: 0%;"></span>
							</div>
							<div class="item-rate clearfix">
								<span class="rate1"> <em>0%</em><br>好评度
								</span> <span class="rate2"> <em><a>报名</a></em><br>
								</span> <span class="rate3"> <em>9天</em><br>剩余时间
								</span>
							</div>
						</div>
					</li>
					
					</#list>
					
					
				</ul>
				<div class="project-more">
					<a class="more-btn" href="/browse"
						alt="查看更多项目" ,title="查看更多项目">查看更多项目</a>
				</div>
			</div>
		</div>
	</div>

	<div class="support">
		<div class="wrap">
			<div class="mod-title clearfix">
				<h2>我们已经做到 ···</h2>
			</div>
			<div class="support-con clearfix">
				<ul class="support-big clearfix">
					<li><span class="icon-sup sup-sum"></span>
						<h3>
							6,270,680<em>人</em>
						</h3>
						<p>
							<a target="_blank"
								href="/deal-show/id-1199" alt="爱情保险"
								title="爱情保险">教师人数</a>
						</p></li>
					<li><span class="icon-sup sup-time"></span>
						<h3>
							28<em>小时</em>
						</h3>
						<p>
							<a target="_blank"
								href="/deal-show/id-1554"
								alt="资讯众筹：安卓手机垃圾泛滥问题微调查" title="资讯众筹：安卓手机垃圾泛滥问题微调查">资讯众筹：安卓手机垃圾…</a>
						</p></li>
					<li><span class="icon-sup sup-per"></span>
						<h3>
							39,563<em>人</em>
						</h3>
						<p>
							<a target="_blank"
								href="/deal-show/id-829"
								alt="2013快乐男声主题电影" title="2013快乐男声主题电影">2013快乐男声主题电…</a>
						</p></li>
				</ul>
				<ul class="support-sm clearfix">
					<li><span class="icon-sup pro-sum"></span>
						<h3>园总数</h3>
						<p class="red">
							315<em>个</em>
						</p></li>
					<li><span class="icon-sup pro-per"></span>
						<h3>家长数</h3>
						<p class="violet">
							59,645<em>人</em>
						</p></li>
					<li><span class="icon-sup pro-money"></span>
						<h3>教师数</h3>
						<p class="yellow">18,245,113</p></li>
				</ul>
			</div>
		</div>
	</div>
	<script>
    $("#Js-recommend").find("li").hover(function(){
    	$(this).find("span").not("[name='more']").show();
    },
    function(){
    	$(this).find("span").not("[name='more']").hide();
    });
    </script>
	<!--footer static-->
	<div class="footer">
		<!--footer section start-->
		<div class="footer-section clearfix">
			<div class="wrap">
				<!--footer map start-->
				<div class="foot-map">
					<dl>

					</dl>
					<dl>
						<dt>关于</dt>
						<dd>
							<a href="/help-about/id-1" alt="关于众筹"
								title="关于众筹">关于众筹</a><em>/</em><a
								href="/help-contact" alt="联系我们"
								title="联系我们">联系我们</a><em>/</em><a
								href="/help-center" alt="帮助中心"
								title="帮助中心">帮助中心</a><em>/</em>
						</dd>
						<dd>
							<a href="/help-team" alt="团队介绍"
								title="团队介绍">团队介绍</a><em>/</em><a
								href="/help-term" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a
								href="/help-specification" alt="项目发起规范"
								title="项目发起规范">项目发起规范</a><em>/</em>
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