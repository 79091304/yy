<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>发起项目-众筹网-中国最具影响力的众筹平台</title>
<meta name="keywords" content="众筹 创业 项目 投资 支持">
<meta name="description" content="在众筹网发布项目，获得投资支持，实现你的创业梦想">

<link rel="stylesheet" type="text/css" src="${ctx}/css/a1.css">
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<body>
	<!--header static-->
	<div class="header">
		<div class="wrap">
			<div class="img-logo">
				<h1>
					<a alt="众筹网" class="ie6fixpic" title="众筹网"
						href="">众筹网</a>
				</h1>
			</div>
			<!--menu start-->
			<div class="menu">
				<ul class="clearfix">
					<li><a href="">首页 </a></li>
					<li><a href="browse">幼儿园</a></li>
					<li><a href="open">教师</a></li>
					<li><a href="partake">优秀课程</a></li>
				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form action="deals" method="post"
					id="header_new_search_form" wx-validator="" autocomplete="off">
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
					<a href="home/id-154415" class="tit"> <img
						id="headeravatar" src="./shenqing_files/noavatar_small.gif">
						<span class="ie6fixpic">用户名</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo" style="display: none;">
					<ul class="clearfix">
						<ul>
							<li class="sup"><a class="ie6fixpic"
								href="home/id-154415">支持的项目</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="home-build_deal/id-154415">发起的项目</a></li>
							<li class="att"><a class="ie6fixpic"
								href="home-focus/id-154415">喜欢的项目</a></li>
							<li class="msg"><a class="ie6fixpic"
								href="message">消息中心</a></li>
							<li class="set"><a class="ie6fixpic"
								href="settings">个人设置</a></li>
							<li class="exit bn"><a class="ie6fixpic"
								href="user-loginout">退出</a></li>
						</ul>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

		</div>
	</div>
	<!--header-end-->
	<script type="text/javascript">
	var ROOT = '/keupload.php';
</script>
	<link rel="stylesheet" type="text/css"
		href="./shenqing_files/69e7ed92f0fd667e9b2322d1be599241.css">
	<script type="text/javascript"
		src="./shenqing_files/30dc5690baa4a2f6c372f7bed0a25958.js"></script>

	<!--main static-->
	<div class="main clearfix">
		<div class="wrap clearfix">
			<!--flow step static-->
			<div class="project-edit-nav">
				<h3 class="steps-1">课程信息</h3>
			</div>
			<!--flow step end-->
			<!--content static-->
			<div class="content fl">

				<!--project start-->
				<div class="project-box">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w705"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd project-con w713">

						<form wx-validator="" wx-validator-ajax=""
							action="project-save" method="post"
							name="HwForm" autocomplete="off">

							<div class="tit-wrap">
								<h3>课程信息</h3>
							</div>
							<div class="project-edit">
								<div class="form-item clearfix">
									<label>课程名称：</label> <input name="name" type="text"
										class="inp-w310" wx-validator-rule="required|maxLength"
										wx-validator-param="|40" wx-validator-placeholder="名称不可超过40个字"
										wx-validator-name-maxlength="名称不可超过40个字" value=""
										maxlength="40" placeholder="名称不可超过40个字">
								</div>
								<div class="form-item clearfix">
									<label>课时：</label> <input name="deal_days" type="text"
										wx-validator-rule="required|digits|range"
										wx-validator-param="||10-90" wx-validator-placeholder="10~90天"
										value="" placeholder="10~90天"><span
										class="input-notes" style="margin-left: 5px">天</span><span
										id="wx-validator-deal_days-required" class="error-text hidden">不能为空</span><span
										id="wx-validator-deal_days-digits" class="error-text hidden">请填写数字</span><span
										id="wx-validator-deal_days-range" class="error-text hidden">10~90天</span>
								</div>
								<div class="form-item clearfix">
									<label>类别：</label>
									<div id="Js-select-cate" class="option-sort">
										<span data-id="12">科技</span> <span data-id="13">设计</span> <span
											data-id="14">活动</span> <span data-id="15">影视</span> <span
											data-id="16">出版</span> <span data-id="20">音乐</span> <span
											data-id="18">其它</span>
									</div>
									<input id="Js-cate" class="hidden" name="cate_id" value="">
								</div>
								<div class="form-item clearfix">
									<label>授课地点：</label>
									<div class="option-box">
										<select name="province" class="fl"
											wx-validator-error-value="请选择省份">
											<option>请选择省份</option>
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
										</select> <select name="city" class="fl"
											wx-validator-error-value="请选择城市">
											<option>请选择城市</option>
										</select> <span id="wx-validator-province-error" class="error-text"
											style="display: none">请选择省份</span> <span
											id="wx-validator-city-error" class="error-text"
											style="display: none">请选择城市</span> <input name="name"
											type="text" class="inp-w310"
											wx-validator-rule="required|maxLength"
											wx-validator-param="|40" wx-validator-placeholder="街道、门牌号"
											wx-validator-name-maxlength="街道、门牌号" value="" maxlength="40"
											placeholder="街道、门牌号">
									</div>
								</div>
								<div class="form-item clearfix">
									<label>课程展示封面：</label>
									<div class="up-btn">
										<div class="ipt-file">
											<input
												onclick="javascript:upd_file(this,&#39;image_file&#39;);"
												type="file" id="image_file" name="image_file" value="">
											<a class="btn-base common-sprite btn-red-h30"> <span
												class="common-sprite">上传封面</span>
											</a>

										</div>
										<span class="gray">支持jpg、jpeg、png、gif格式，大小不超过5M。建议尺寸：223
											x 168px</span>
									</div>
								</div>
								<div class="form-item clearfix">
									<label>视频：</label> <input type="text" name="vedio"
										class="inp-w310" maxlength="200"
										wx-validator-placeholder="请输入优酷视频的播放页地址" value=""
										placeholder="请输入优酷视频的播放页地址">
								</div>
								<div class="form-item clearfix">
									<label>课程简介：</label>
									<textarea style="width: 60%; height: 30px" name="brief"
										wx-validator-rule="required|maxLength"
										wx-validator-param="|75" wx-validator-placeholder="不超过75个字"
										maxlength="75" placeholder="不超过75个字"></textarea>
									<span id="wx-validator-brief-required" class="error-text">不能为空</span>
									<span id="wx-validator-brief-maxLength"
										class="error-text hidden" style="display: none;">不能超过75个汉字</span>
								</div>

								<div class="form-item clearfix">
									<label>标签：</label> <input type="text" id="Js-tag" name="tags"
										class="inp-w310" wx-validator-placeholder="请使用空格或逗号分隔不同标签"
										value="" placeholder="请使用空格或逗号分隔不同标签">
								</div>

								<input type="hidden" name="image" value=""> <input
									type="hidden" name="savenext" value="1"> <input
									type="hidden" name="id" value="">

								<div class="action tr">
									<a type="submit" href="javascript:void(0);"
										wx-validator-submit-error="您填写的部分内容不符合规范" id="savenext"
										class="btn-base btn-red-h48 common-sprite"> <span
										class="common-sprite">下一步</span>
									</a>
								</div>
							</div>
						</form>
					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w705"></div>
						<div class="radius-fr common-sprite"></div>
					</div>
				</div>

				<!--project end-->

			</div>
			<!--content end-->
			<!--side static-->
		</div>
		<script>
	function HwForm_before(){
		if(!$("#Js-cate").val()){
			wx.alert("请选择类别");
			return false;
		}
		return true;
	}
	function HwForm(data){
		if(data.status == 1){
			wx.alert("保存成功",function(){
				location.href = data.jump;
			})
		}
		else{
			wx.alert(data.info);
		}
	}
	$("input[name='name']").blur(function(){
		$("#Js-name").text($(this).val());

		wx.sendData("/project-gettag","name="+$("#Js-name").text(),function(data){
			$("#Js-tag").val(data.tags);
		});
	});
	$("input[name='limit_price']").blur(function(){
		$("#Js-price").text("￥"+$(this).val());
	});
	$("input[name='deal_days']").blur(function(){
		$("#Js-days").text($(this).val()+"天");
	});
	
	$("#Js-select-cate").delegate('span', 'click', function(event) {
		$(this).addClass('select').siblings().removeClass('select');
		$("#Js-cate").val($(this).attr("data-id"));
	});

	/* KE.setting.skinsPath = "/static/zhongchou/kindeditor/skins/";
	KE.setting.pluginsPath = "/static/zhongchou/kindeditor/plugins/";
	KE.show({urlType:'domain', id:'Js-description', items : ['title',' | ','fimage',' | ','link','removeformat',' | '], skinType: 'tinymce',allowFileManager : false,resizeMode : 0, newlineTag:'nl',height:500}); */
	window['HwForm_before'] = function() {
		KE.util.setData('Js-description');
		return true;
	}
</script>
		<!--main end-->
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
								<a href="browse/id-12" title="科技">科技</a><em>/</em>
								<a href="browse/id-13" title="设计">设计</a><em>/</em>
								<a href="browse/id-14" title="活动">活动</a><em>/</em>
								<a href="browse/id-15" title="影视">影视</a><em>/</em>
							</dd>
							<dd>
								<a href="browse/id-16" title="出版">出版</a><em>/</em>
								<a href="browse/id-20" title="音乐">音乐</a><em>/</em>
								<a href="browse/id-18" title="其它">其它</a><em>/</em>

							</dd>
						</dl>
						<dl>
							<dt>关于</dt>
							<dd>
								<a href="help-about/id-1" alt="关于众筹"
									title="关于众筹">关于众筹</a><em>/</em><a
									href="help-contact" alt="联系我们"
									title="联系我们">联系我们</a><em>/</em><a
									href="help-center" alt="帮助中心"
									title="帮助中心">帮助中心</a><em>/</em>
							</dd>
							<dd>
								<a href="help-team" alt="团队介绍"
									title="团队介绍">团队介绍</a><em>/</em><a
									href="help-term" alt="服务协议"
									title="服务协议">服务协议</a><em>/</em><a
									href="help-specification" alt="项目发起规范"
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
		<!--footer end-->
		<!-- <div style="display:none;">
    <script type="text/javascript">
      var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
      document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe89e365e0d0438aa7f6d6eab7960962c' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div> -->
		<script type="text/javascript">
    var _agt=_agt||[];
    _agt.push(['_atscu','AG_524833_SVCU']);
    _agt.push(['_atsdomain','zhongchou.cn']);
    (function(){
    var ag=document.createElement('script'); 
     ag.type='text/javascript'; 
     ag.async = true;
    ag.src=(document.location.protocol=='https:'?'https':'http')+'://'+'t.agrantsem.com/js/ag.js';
    var s=document.getElementsByTagName('script')[0]; 
     s.parentNode.insertBefore(ag,s);})();
  </script>

		<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-43592515-1', 'zhongchou.cn');
    ga('send', 'pageview');
    
    var _ncf={"prd":"zhongchou","pstr":"","pfunc":null,"pcon":"","pck":{"auto_login":"au","zcid":"zcid"}};
    (function(p,h,s){var o=document.createElement(h);o.src=s;p.appendChild(o)})(document.getElementsByTagName("HEAD")[0],"script","http://zcs1.ncfstatic.com/js/ncfpb.1.1.min.js");
  </script>
		<!--[if IE 6]>
<script src="/static/zhongchou/js/DD_belatedPNG_0.0.8a.js"></script>
<![endif]-->

		<img src="./shenqing_files/pv"
			style="display: none; width: 0px; height: 0px;">
		<div style="display: none;"></div>
		<div class="ke-mask" style="opacity: 0.5; display: none;"></div>
</body>
</html>