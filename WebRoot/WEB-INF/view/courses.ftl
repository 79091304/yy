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
<div class="header">
  <div class="wrap clearfix" pbid="header">
    <div class="img-logo">
      <h1>
        <a alt="众筹网" class="ie6fixpic" title="众筹网" href="/index">众筹网</a>
      </h1>
    </div>
    <!--menu start-->
    <div class="menu">
      <ul class="clearfix">
          <li><a href="/index">首页 </a></li>
          <li class="select"><a href="/browse">课程 </a></li>
          <li><a href="/open">教师</a></li>
          <li><a href="/partake">新手帮助 </a></li>
          <li><a href="/project">发起课程 </a></li>
      </ul>
    </div>
    <!--menu end-->
    <!--search start-->
    <div class="search common-sprite ie6fixpic sw">
      <form action="/deals" method="post" id="header_new_search_form" wx-validator>
      <input type="text" name="k" wx-validator-placeholder="搜索" wx-validator-rule="required" class="search-key gray" wx-validator-notip />
      <input id="Js-search-submit" type="submit" class="btn-search ie6fixpic" />
      </form>
    </div>
    <!--search end-->

    <!--login start-->
    <div class="login-wrap">
      <a href="/user-login">登录</a>
      <em>|</em>
      <a href="/user-register">注册</a>
    </div>
    <!--login end-->

  </div>
</div>
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
<div class="footer" pbid="footer">
  <!--footer section start-->
  <div class="footer-section clearfix">
    <div class="footer-wrap">
    <!--footer map start-->
    <div class="foot-map">
      <dl>
        <dt>众筹项目</dt>
        <dd>
                              </dd><dd>                    <a rel="nofollow" href="/browse/id-12" title="科技">科技</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-22" title="艺术">艺术</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-13" title="设计">设计</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-20" title="音乐">音乐</a><em>/</em>
                    </dd><dd>                    <a rel="nofollow" href="/browse/id-15" title="影视">影视</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-16" title="出版">出版</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-25" title="动漫游戏">动漫游戏</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-23" title="公益">公益</a><em>/</em>
                    </dd><dd>                    <a rel="nofollow" href="/browse/id-26" title="公开课">公开课</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-28" title="农业">农业</a><em>/</em>
                                        <a rel="nofollow" href="/browse/id-18" title="其他">其他</a><em>/</em>
                    
        </dd>
      </dl>
      <dl>
        <dt>关于</dt>
        <dd>
<a rel="nofollow" href="/help-about/id-1" alt="关于众筹" title="关于众筹">关于众筹</a><em>/</em><a rel="nofollow" href="/help-contact" alt="联系我们" title="联系我们">联系我们</a><em>/</em><a rel="nofollow" href="/help-center" alt="帮助中心" title="帮助中心">帮助中心</a><em>/</em></dd><dd><a rel="nofollow" href="/help-team" alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a rel="nofollow" href="/help-term" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a rel="nofollow" href="/help-specification" alt="项目发起规范" title="项目发起规范">项目发起规范</a><em>/</em></dd>
      </dl>
       <dl>
        <dt>关注我们</dt>
        <dd>
          <a rel="nofollow" target="_blank" href="http://tieba.baidu.com/f?ie=utf-8&kw=%E4%BC%97%E7%AD%B9%E7%BD%91" alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em>
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
          <a rel="nofollow" target="_blank" href="/help-tourongzi" alt="投融资服务" title="投融资服务">投融资服务</a>
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
    	    		<a href="http://www.36kr.com/   " target="_blank">36氪</a>
    	    		<a href="http://www.hao123.com/" target="_blank">hao123</a>
    	    		<a href="http://hao.360.cn/" target="_blank">360安全网址</a>
    	    		<a href="http://www.ynet.com/" target="_blank">北青网</a>
    	    		<a href="http://finance.ifeng.com/" target="_blank">凤凰网</a>
    	    		<a href="http://jrj.com.cn" target="_blank">金融界</a>
    	    		<a href="http://www.caixin.com/" target="_blank">财新网</a>
    	    		<a href="http://www.tmtpost.com/" target="_blank">钛媒体</a>
    	    		<a href="http://www.imgii.com?zhongchou" target="_blank">IMGII</a>
    	    		<a href="http://www.m1905.com/film/" target="_blank">电影网</a>
    	    		<a href="http://www.artron.net/" target="_blank">雅昌艺术网</a>
    	    		<a href="http://www.vmovier.com/" target="_blank">V电影</a>
    	    		<a href="http://www.eguan.cn" target="_blank">易观网</a>
    	    		<a href="http://www.pedaily.cn/" target="_blank">投资界          </a>
    	    		<a href="http://home.ebrun.com/" target="_blank">亿邦动力社区</a>
    	    		<a href="http://www.lagou.com/" target="_blank">拉勾网</a>
    	    		<a href="http://www.9888.cn" target="_blank">金融工场</a>
    	    		<a href="http://www.trchina.org/" target="_blank">投融中国联盟</a>
    	    		<a href="http://www.youcheng.org/" target="_blank">友成基金会</a>
    	    		<a href="http://life.renren.com" target="_blank">人人生活</a>
    	    		<a href="http://www.meng800.com/ " target="_blank">众筹导航</a>
    	    		<a href="http://www.diaochapai.com" target="_blank">调查派</a>
    	    		<a href="http://www.qidic.com" target="_blank">奇笛网</a>
    	    		<a href="http://www.rong360.com" target="_blank">融360</a>
    	    		<a href="http://www.66money.com/" target="_blank">联信财富</a>
    	    		<a href=" http://www.diyifangdai.com" target="_blank">第一房贷</a>
    	    		<a href="http://finance.ifeng.com/itfinance/index.shtml" target="_blank">凤凰互联网金融</a>
    			</p>
	</div>
      <p>&copy;2014  北京网信众筹网络科技有限公司   zhongchou.cn  版权所有   京ICP备14016844号 </p>
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
     
</html> 
