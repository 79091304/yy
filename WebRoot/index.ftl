<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>-中国最具影响力的众筹平台</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/promotuser.js"></script>
<script type="text/javascript">
$(function(){
	var uid = $.cookie('uid');
	if(undefined != uid && '' != uid){
		$.ajax({
			url : "./user/getInfo.htm?uid="+uid,
		    type : "POST", 
		    dataType:"text",
		    contentType:'text/html',
		    data:{},
		    success : function(data) {
		        $(".user-name word-break ie6fixpic").html(data.username);
		        $("#jsddm").show();
		    },
			error:function(e){
		    }  
		});
		
	}else{
		$("#jsddm").hide();
	}
})
</script>
<!--public js&css start-->
<!--public js&css end -->
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
					<li class="select"><a href="index.html">首页 </a></li>
					<li><a href="./course/list.htm">课程</a></li>
					<li><a href="./teacher/list.htm">教师 </a></li>
					<li><a href="./teacher/list.htm">新人帮助</a></li>
					<li><a href="./course/prepublish.htm">发布课程</a></li>
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
							src="./images/noavatar_small.gif" />
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
							<li class="msg"><a class="ie6fixpic" href="/message">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="/settings">个人设置</a></li>
							<li class="exit bn"><a class="ie6fixpic"
								href="/user-loginout">退出</a></li>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

			<!--login start-->
			<div class="login-wrap">
				<span id="usertag"> <a rel="nofollow"
					href="./log/toLogin.htm">登录</a> <em>|</em> <a rel="nofollow"
					href="./register/toRegister.htm">注册</a>
				</span> 
			</div>
			<!--login end-->

		</div>
		
		<div class="subnav">
			<div class="nav clearfix">
				<ul>
					<li class="select"><a title="浏览全部" href="browse">浏览全部</a></li>
					<#list category as item >
					<li><a href="${ctx}/course/list.htm?cid=${item.id}" alt="${item.name}">${item.name}</a></li>
					</#list>
				</ul>

			</div>
		</div>
	</div>
	<!--header-end-->
	<div class="banner" pbid="banner">
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
					style="height: 392px; width: 7680px; margin-left: 0px;">
					<li><a target="_blank" href=""> <img class="lz"
							width="960" height="392" src="./images/u1.jpg">
					</a></li>
					<li><a target="_blank" href=""> <img class="lz"
							width="960" height="392" src="./images/u2.jpg">
					</a></li>
					<li><a target="_blank" href=""> <img class="lz"
							width="960" height="392" src="./images/u3.jpg">
					</a></li>
					<li><a target="_blank" href=""> <img class="lz"
							width="960" height="392" src="./images/u4.jpg">
					</a></li>
					<li><a target="_blank" href=""> <img class="lz"
							width="960" height="392" src="./images/u5.jpg">
					</a></li>
					<li><a target="_blank" href=""> <img src="images/u6.jpg"
							width="960" height="392">
					</a></li>
					<li><a target="_blank" href=""> <img class="lz"
							width="960" height="392" src="./images/u7.jpg">
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
			var len = 8;
			var banner = $("#JS-banner_ul");
			banner.css("width", len * 960);
			var sindex = 0;
			var inanimate = false;
			var inHover = false;

			function moveByDirect(to_right) {
				if (inanimate) return;
				inanimate = true;
				var start = 0;
				var end = - 960;
				if (!to_right) {
					start = -960;
					end = 0;
					loadBannerImg(banner.children().last().prev());
					banner.children().last().insertBefore(banner.children().first());
				} else {
					loadBannerImg(banner.children().first().next());
				}
				banner.css("margin-left", start);
				banner.animate({"margin-left": end}, 500, function(){
					inanimate = false;
					if (to_right) {
						banner.children().first().insertAfter(banner.children().last());
					}
					banner.css("margin-left", 0);
					autoScroll();
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
			$("#JS-banner_ul img").bind("load", function(){
				$(this).attr("data-load","ok");
			});

			var timer = null;
			function clearAutoScroll() {
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			}
			window.loadBannerImg = function(p){
				var o = p.children().children("img");
				if (o.attr("data-init")!="ok"){
					o.attr({"src":o.data("src"),"data-init":"ok"});
				}
			}

			function autoScroll(init) {
				clearAutoScroll();
				timer = setTimeout(function() {
					if (inHover || banner.children().first().next().children().children("img").attr("data-load")!="ok") {
						autoScroll();
					} else {
						moveByDirect(true);
					}
				}, 5000);
				if (!init){
					loadBannerImg(banner.children().first().next());
				}
			}
			autoScroll(1);
		})();
		$(function(){
			loadBannerImg($("#JS-banner_ul").children().first().next());
			$("#JS-banner_ul img").each(function(){
				//$(this).attr("src",$(this).attr("data-src"));
			});
		});
	</script>

	<div class="site-focus" pbid="热门课程">
		<div class="wrap">
			<div class="mod-title clearfix">
				<h2>热门课程</h2>
				<div class="title-sub">
					<a href="browse/id-12" title="瑜伽" pbtag="hangye,hangye_12">瑜伽</a> <a
						href="browse/id-22" title="托福" pbtag="hangye,hangye_22">托福</a> <a
						href="browse/id-13" title="健身" pbtag="hangye,hangye_13">健身</a> <a
						href="browse/id-20" title="音乐" pbtag="hangye,hangye_20">音乐</a> <a
						href="browse/id-15" title="户外" pbtag="hangye,hangye_15">户外</a> <a
						href="browse/id-16" title="心理" pbtag="hangye,hangye_16">心理</a> <a
						href="browse/id-25" title="游泳" pbtag="hangye,hangye_25">游泳</a>
					<a href="browse/id-23" title="公益" pbtag="hangye,hangye_23">公益</a> <a
						href="browse/id-18" title="其他" pbtag="hangye,hangye_18">其他</a>
				</div>
			</div>
			<div class="focus-box" style="overflow: hidden;">
				<ul id="JS-recommend_ul" class="focus-con clearfix"
					style="width: 980px;">
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure" href="/deal-show/id-2954" target="_blank">
								<img src="images/tt.jpg" alt="汇源有机草莓，每一颗都珍贵">
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="27"
									onclick="like_deal_v2(2954, this)">27</a>
							</div>
							<h3>
								<a href="/deal-show/id-2954" target="_blank">汇源有机草莓，每一颗都珍贵</a>
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
				</ul>
				<ul style="display: none;" id="JS-recommend_btns"
					class="focus-btn clearfix">
					<li id="JS-recommend_pre" class="prev"><span
						class="common-sprite">prev</span></li>
					<li class="JS-recommend_btn select" dataindex="0"><span
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
				if (len < 2) $("#JS-recommend_btns").hide();
				autoScroll();
			})();
			</script>
		</div>
	</div>

	<div class="main wrap" pbid="优秀教师">
		<div class="hot-project-box">
			<!--mod tit start-->
			<div class="mod-title clearfix">
				<h2>热门项目</h2>
				<div class="title-sub"></div>
			</div>
			<!--mod tit end-->
			<div class="hot-project">
				<ul class="clearfix">
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure" href="/deal-show/id-2954" target="_blank">
								<img src="images/tt.jpg" alt="汇源有机草莓，每一颗都珍贵">
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="27"
									onclick="like_deal_v2(2954, this)">27</a>
							</div>
							<h3>
								<a href="/deal-show/id-2954" target="_blank">汇源有机草莓，每一颗都珍贵</a>
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
				</ul>
				<div class="project-more">
					<a class="more-btn" href="browse" alt="查看更多项目" ,title="查看更多项目">查看更多项目</a>
				</div>
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

;(function($,window){$.fn.lately=function(options){options=$.extend({},{container:window,gapX:0,gapY:0},options);var $win=$(options.container),self=this;this.one("lately",function(){var src=this.getAttribute("data-src");this.setAttribute("src",src);this.removeAttribute("data-src")});function lately(){var inview=self.filter(function(){var el=$(this),elW=el.outerWidth()+options.gapX,elH=el.outerHeight()+options.gapY,scroll={y:$win.scrollTop(),x:$win.scrollLeft()},viewport={x:$win.width()+options.gapX,y:$win.height()+options.gapY};return(el.offset().top<(scroll.y+viewport.y)&&el.offset().left<(scroll.x+viewport.x)&&(el.offset().top+elH)>scroll.y&&(el.offset().left+elW)>scroll.x)});var loaded=inview.trigger("lately");self=self.not(loaded)};$win.on('resize scroll',lately);lately();return this}}(jQuery,window));

$(function(){
	$("img.lzload").show().lately({"gapX":400});
});
    </script>
	<!--footer static-->
	<#include  "footer.ftl" >
</body>
</html>