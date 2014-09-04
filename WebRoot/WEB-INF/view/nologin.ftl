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
<script src="${ctx}/js/jquery.js"></script>
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
		wx.alert('您还没有同意众筹网服务协议。');
		return false;
	}else{
		var uid = $.cookie("uid");
		if(uid != null || "" != uid){
			window.location.href="${ctx}/course/publish.htm";
		}else{
			window.location.href="${ctx}/log/toLogin.htm";
		}
	}

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
					<p>众筹网是一家可以帮助您实现梦想的网站，在这里您可以发布您的梦想、创意和创业计划，并通过网络平台面对公众集资，让有创造力的人可能获得他们所需要的资金，以便使他们的梦想有可能实现。</p>
					<div class="pro-agr-chk">
						<input id="flag" name="flag" checked="checked" type="checkbox">
						阅读并同意众筹网的<a class="red" href="help-term" target="_blank">《服务协议》</a>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="help-announcement" target="_bank"><span class="red">《众筹公告》</span></a>
					</div>
					<div class="pro-agr-btn">
						<a class="btn-base btn-red-h37 common-sprite" href="javascript:void(0);" onclick="dosubmit();"><span class="common-sprite">立即发布课程</span></a>
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
<div class="footer" pbid="footer">
  <!--footer section start-->
  <div class="footer-section clearfix">
    <div class="footer-wrap">
    <!--footer map start-->
    <div class="foot-map">
      <dl>
        <dt>众筹项目</dt>
        <dd>
                              </dd><dd>                    <a rel="nofollow" href="browse/id-12" title="科技">科技</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-22" title="艺术">艺术</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-13" title="设计">设计</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-20" title="音乐">音乐</a><em>/</em>
                    </dd><dd>                    <a rel="nofollow" href="browse/id-15" title="影视">影视</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-16" title="出版">出版</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-25" title="动漫游戏">动漫游戏</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-23" title="公益">公益</a><em>/</em>
                    </dd><dd>                    <a rel="nofollow" href="browse/id-26" title="公开课">公开课</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-28" title="农业">农业</a><em>/</em>
                                        <a rel="nofollow" href="browse/id-18" title="其他">其他</a><em>/</em>
                    
        </dd>
      </dl>
      <dl>
        <dt>关于</dt>
        <dd>
<a rel="nofollow" href="help-about/id-1" alt="关于众筹" title="关于众筹">关于众筹</a><em>/</em><a rel="nofollow" href="help-contact" alt="联系我们" title="联系我们">联系我们</a><em>/</em><a rel="nofollow" href="help-center" alt="帮助中心" title="帮助中心">帮助中心</a><em>/</em></dd><dd><a rel="nofollow" href="help-team" alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a rel="nofollow" href="help-term" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a rel="nofollow" href="help-specification" alt="项目发起规范" title="项目发起规范">项目发起规范</a><em>/</em></dd>
      </dl>
       <dl>
        <dt>关注我们</dt>
        <dd>
          <a rel="nofollow" target="_blank" href="http://tieba.baidu.com/f?ie=utf-8&amp;kw=%E4%BC%97%E7%AD%B9%E7%BD%91" alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em>
          <a rel="nofollow" target="_blank" href="http://user.qzone.qq.com/2357291729" alt="QQ空间" title="QQ空间">QQ空间</a><em>/</em>
          <a rel="nofollow" target="_blank" href="http://e.weibo.com/zhongchouwang2013" alt="新浪微博" title="新浪微博">新浪微博</a>
        </dd> 
        <dd>
          <a rel="nofollow" target="_blank" href="http://www.douban.com/people/zhongchou_cn/" alt="豆瓣小站" title="豆瓣小站">豆瓣小站</a><em>/</em>
        </dd>
      </dl>
      <dl class="last">
        <dt>服务</dt>
        <dd>
          <a rel="nofollow" target="_blank" href="help-tourongzi" alt="投融资服务" title="投融资服务">投融资服务</a>
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
    <div class="footer-wrap">
    <div class="ft-links">
		<div class="links-arrow">友情链接：</div>
		<p>
    	    		<a href="http://iof.hexun.com/zhongchou/index.html" target="_blank">和讯网</a>
    	    		<a href="http://www.leiphone.com/" target="_blank">雷锋网</a>
    	    		<a href="http://www.36kr.com/" target="_blank">36氪</a>
    	    		<a href="http://www.hao123.com/" target="_blank">hao123</a>
    	    		<a href="http://hao.360.cn/" target="_blank">360安全网址</a>
    	    		<a href="http://www.ynet.com/" target="_blank">北青网</a>
    	    		<a href="http://finance.ifeng.com/" target="_blank">凤凰网</a>
    	    		<a href="http://jrj.com.cn/" target="_blank">金融界</a>
    	    		<a href="http://www.caixin.com/" target="_blank">财新网</a>
    	    		<a href="http://www.tmtpost.com/" target="_blank">钛媒体</a>
    	    		<a href="http://www.imgii.com/?zhongchou" target="_blank">IMGII</a>
    	    		<a href="http://www.m1905.com/film/" target="_blank">电影网</a>
    	    		<a href="http://www.artron.net/" target="_blank">雅昌艺术网</a>
    	    		<a href="http://www.vmovier.com/" target="_blank">V电影</a>
    	    		<a href="http://www.eguan.cn/" target="_blank">易观网</a>
    	    		<a href="http://www.pedaily.cn/" target="_blank">投资界          </a>
    	    		<a href="http://home.ebrun.com/" target="_blank">亿邦动力社区</a>
    	    		<a href="http://www.lagou.com/" target="_blank">拉勾网</a>
    	    		<a href="http://www.9888.cn/" target="_blank">金融工场</a>
    	    		<a href="http://www.trchina.org/" target="_blank">投融中国联盟</a>
    	    		<a href="http://www.youcheng.org/" target="_blank">友成基金会</a>
    	    		<a href="http://life.renren.com/" target="_blank">人人生活</a>
    	    		<a href="http://www.meng800.com/" target="_blank">众筹导航</a>
    	    		<a href="http://www.diaochapai.com/" target="_blank">调查派</a>
    	    		<a href="http://www.qidic.com/" target="_blank">奇笛网</a>
    	    		<a href="http://www.rong360.com/" target="_blank">融360</a>
    	    		<a href="http://www.66money.com/" target="_blank">联信财富</a>
    	    		<a href="http://www.diyifangdai.com/" target="_blank">第一房贷</a>
    	    		<a href="http://finance.ifeng.com/itfinance/index.shtml" target="_blank">凤凰互联网金融</a>
    			</p>
	</div>
      <p>©2014  北京网信众筹网络科技有限公司   zhongchou.cn  版权所有   京ICP备14016844号 </p>
    </div>
  </div>
</div>
<div id="code"></div>
<div id="code_img"></div>
<div id="gotop"></div>
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
</body></html>