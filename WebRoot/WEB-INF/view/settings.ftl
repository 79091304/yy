<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>-中国最具影响力的众筹平台</title>
<meta name="keywords" content="众筹 创业 项目 投资 支持">
<meta name="description" content="在发布项目，获得投资支持，实现你的创业梦想">
<!--public js&css start-->
<!--public js&css end -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/setting.css">
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
</head>

<body>
	<!--header static-->
	<#include "header.ftl">
	<!--header-end-->
	
	<!--main static-->
	<div class="main clearfix">
		<div class="setting wrap">
			<div class="setting-title clearfix">
				<h3>个人设置</h3>
				<a href="/home/id-154415">返回个人中心</a>
			</div>
			<div class="setting-content clearfix">
				<div class="setting-menu">
					<ul class="clearfix">
						<li class="select"><a class="icons info ie6fixpic"
							href="/settings">资料修改</a></li>
						<li class=""><a class="icons password ie6fixpic"
							href="/settings-password">密码修改</a></li>
						<li><a class="icons portrait ie6fixpic"
							href="/settings-avatar">头像修改</a></li>
						<li><a class="icons address ie6fixpic"
							href="/settings-consignee">收件地址管理</a></li>
						<li><a class="icon-yhj-gray ie6fixpic"
							href="/coupon">我的优惠劵</a></li>
					</ul>
				</div>
				<div class="setting-detail">
					<!--setting-form static-->
					<form autocomplete="off" class="setting-form" name="modify"
						action="/settings-save_index" wx-validator=""
						wx-validator-error-class="error-text" wx-validator-ajax="">
						<input name="user_id" value="154415" type="hidden">

						<div class="form-item clearfix">
							<label class="red">邮箱：</label>
							<p class="form-msg red">79091304@qq.com</p>
						</div>

						<div class="form-item clearfix">
							<label class="red">用户名：</label> <input value="kkllkkii"
								name="user_name" wx-validator-rule="required|byteRangeLength"
								wx-validator-param="|4-24"
								wx-validator-user_name-byterangelength="2到12个汉字或4到24个字符"
								type="text">
						</div>

						<div class="form-item clearfix">
							<label>性别：</label>
							<div class="sex-box">
								<input name="sex" value="1/" type="radio"> <span>男</span>
								<input checked="checked" name="sex" value="0/" type="radio">
								<span>女</span> <input name="sex" value="-1" type="radio">
								<span>保密</span>
							</div>
						</div>

						<div class="form-item clearfix">
							<label>所在地：</label>
							<div class="option-box">
								<select name="province" wx-validator-error-value="选择省份">
									<option selected="selected">选择省份</option>
									<option value="安徽" rel="3">安徽</option>
									<option value="澳门" rel="396">澳门</option>
									<option value="北京" rel="52">北京</option>
									<option value="福建" rel="4">福建</option>
									<option value="甘肃" rel="5">甘肃</option>
									<option value="广东" rel="6">广东</option>
									<option value="广西" rel="7">广西</option>
									<option value="贵州" rel="8">贵州</option>
									<option value="海南" rel="9">海南</option>
									<option value="河北" rel="10">河北</option>
									<option value="黑龙江" rel="12">黑龙江</option>
									<option value="河南" rel="11">河南</option>
									<option value="湖北" rel="13">湖北</option>
									<option value="湖南" rel="14">湖南</option>
									<option value="江苏" rel="16">江苏</option>
									<option value="江西" rel="17">江西</option>
									<option value="吉林" rel="15">吉林</option>
									<option value="辽宁" rel="18">辽宁</option>
									<option value="内蒙古" rel="19">内蒙古</option>
									<option value="宁夏" rel="20">宁夏</option>
									<option value="青海" rel="21">青海</option>
									<option value="山东" rel="22">山东</option>
									<option value="上海" rel="321">上海</option>
									<option value="山西" rel="23">山西</option>
									<option value="陕西" rel="24">陕西</option>
									<option value="四川" rel="26">四川</option>
									<option value="台湾" rel="397">台湾</option>
									<option value="天津" rel="343">天津</option>
									<option value="香港" rel="395">香港</option>
									<option value="西藏" rel="28">西藏</option>
									<option value="新疆" rel="29">新疆</option>
									<option value="云南" rel="30">云南</option>
									<option value="浙江" rel="31">浙江</option>
									<option value="重庆" rel="394">重庆</option>
								</select> <select name="city" wx-validator-error-value="请选择城市">
									<option selected="selected">请选择城市</option>
								</select> <span id="wx-validator-province-error"
									class="error-text hidden">请选择省份</span> <span
									id="wx-validator-city-error" class="error-text hidden">请选择城市</span>
							</div>
						</div>

						<div class="form-item clearfix">
							<label>网址：</label> <input name="weibo_url"
								wx-validator-rule="url" type="text">
						</div>

						<div class="form-item clearfix">
							<label>个人说明：</label>
							<textarea name="intro" id="intro"
								placeholder="您的介绍可更有效的帮助支持者了解您和了解项目的背景"></textarea>
						</div>

						<div class="setting-submit">
							<a type="submit" class="btn-base btn-red-h30 common-sprite"
								href="javascript:;"><span class="common-sprite">保存</span></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function modify(data){
		if(data.status==1){
			wx.alert("保存成功",function(){
				location.reload();
			});
		}
		if(data.status==0){
			wx.alert(data.info);
			
		}
	}

</script>
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
						<dd></dd>
						<dd>
							<a rel="nofollow" href="/browse/id-12"
								title="科技">科技</a><em>/</em> <a rel="nofollow"
								href="/browse/id-22" title="艺术">艺术</a><em>/</em>
							<a rel="nofollow" href="/browse/id-13"
								title="设计">设计</a><em>/</em> <a rel="nofollow"
								href="/browse/id-20" title="音乐">音乐</a><em>/</em>
						</dd>
						<dd>
							<a rel="nofollow" href="/browse/id-15"
								title="影视">影视</a><em>/</em> <a rel="nofollow"
								href="/browse/id-16" title="出版">出版</a><em>/</em>
							<a rel="nofollow" href="/browse/id-25"
								title="动漫游戏">动漫游戏</a><em>/</em> <a rel="nofollow"
								href="/browse/id-23" title="公益">公益</a><em>/</em>
						</dd>
						<dd>
							<a rel="nofollow" href="/browse/id-26"
								title="公开课">公开课</a><em>/</em> <a rel="nofollow"
								href="/browse/id-28" title="农业">农业</a><em>/</em>
							<a rel="nofollow" href="/browse/id-18"
								title="其他">其他</a><em>/</em>

						</dd>
					</dl>
					<dl>
						<dt>关于</dt>
						<dd>
							<a rel="nofollow" href="/help-about/id-1"
								alt="关于众筹" title="关于众筹">关于众筹</a><em>/</em><a rel="nofollow"
								href="/help-contact" alt="联系我们"
								title="联系我们">联系我们</a><em>/</em><a rel="nofollow"
								href="/help-center" alt="帮助中心"
								title="帮助中心">帮助中心</a><em>/</em>
						</dd>
						<dd>
							<a rel="nofollow" href="/help-team"
								alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a rel="nofollow"
								href="/help-term" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a
								rel="nofollow" href="/help-specification"
								alt="项目发起规范" title="项目发起规范">项目发起规范</a><em>/</em>
						</dd>
					</dl>
					<dl>
						<dt>关注我们</dt>
						<dd>
							<a rel="nofollow" target="_blank"
								href="http://tieba.baidu.com/f?ie=utf-8&amp;kw=%E4%BC%97%E7%AD%B9%E7%BD%91"
								alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em> <a rel="nofollow"
								target="_blank" href="http://user.qzone.qq.com/2357291729"
								alt="QQ空间" title="QQ空间">QQ空间</a><em>/</em> <a rel="nofollow"
								target="_blank" href="http://e.weibo.com/zhongchouwang2013"
								alt="新浪微博" title="新浪微博">新浪微博</a>
						</dd>
						<dd>
							<a rel="nofollow" target="_blank"
								href="http://www.douban.com/people/zhongchou_cn/" alt="豆瓣小站"
								title="豆瓣小站">豆瓣小站</a><em>/</em>
						</dd>
					</dl>
					<dl class="last">
						<dt>服务</dt>
						<dd>
							<a rel="nofollow" target="_blank"
								href="/help-tourongzi" alt="投融资服务"
								title="投融资服务">投融资服务</a>
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
							target="_blank">钛媒体</a> <a href="http://www.imgii.com/?zhongchou"
							target="_blank">IMGII</a> <a href="http://www.m1905.com/film/"
							target="_blank">电影网</a> <a href="http://www.artron.net/"
							target="_blank">雅昌艺术网</a> <a href="http://www.vmovier.com/"
							target="_blank">V电影</a> <a href="http://www.eguan.cn/"
							target="_blank">易观网</a> <a href="http://www.pedaily.cn/"
							target="_blank">投资界 </a> <a href="http://home.ebrun.com/"
							target="_blank">亿邦动力社区</a> <a href="http://www.lagou.com/"
							target="_blank">拉勾网</a> <a href="http://www.9888.cn/"
							target="_blank">金融工场</a> <a href="http://www.trchina.org/"
							target="_blank">投融中国联盟</a> <a href="http://www.youcheng.org/"
							target="_blank">友成基金会</a> <a href="http://life.renren.com/"
							target="_blank">人人生活</a> <a href="http://www.meng800.com/"
							target="_blank">众筹导航</a> <a href="http://www.diaochapai.com/"
							target="_blank">调查派</a> <a href="http://www.qidic.com/"
							target="_blank">奇笛网</a> <a href="http://www.rong360.com/"
							target="_blank">融360</a> <a href="http://www.66money.com/"
							target="_blank">联信财富</a> <a href="http://www.diyifangdai.com/"
							target="_blank">第一房贷</a>
					</p>
				</div>
				<p>©2014 北京网信络科技有限公司 zhongchou.cn 版权所有 京ICP备14016844号</p>
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
</body>
</html>