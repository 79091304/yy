<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>众筹网-中国最具影响力的众筹平台</title>
<meta name="keywords" content="众筹 创业 项目 投资 支持">
<meta name="description" content="在众筹网发布项目，获得投资支持，实现你的创业梦想">
<link rel="apple-touch-icon" href="">
<!--public js&css start-->
<!--public js&css end -->    

<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/user.css">
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
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
          <li><a href="${ctx}/course/list.htm">课程 </a></li>
          <li><a href="${ctx}/teacher/list.htm">教师 </a></li>
      </ul>
    </div>
    <!--menu end-->
    <!--search start-->
    <div class="search common-sprite ie6fixpic sw">
      <form autocomplete="off" action="/deals" method="post" id="header_new_search_form" wx-validator="">
      <input placeholder="搜索" name="k" wx-validator-placeholder="搜索" wx-validator-rule="required" class="search-key gray" wx-validator-notip="" type="text">
      <input id="Js-search-submit" class="btn-search ie6fixpic" type="submit">
      </form>
    </div>
    <!--search end-->

    <!-- user menu start-->
    <div class="user-menu" id="jsddm">
      <div class="menu-hd tx">
        <a href="/home/id-154415" class="tit">
          <span class="avatar-box">
            <img id="headeravatar" src="">
                      </span>
          <span class="user-name word-break ie6fixpic">kkllk…</span>
        </a>
      </div>
      <div style="display: none;" class="menu-bd JS-myinfo">
        <ul class="clearfix">
          <ul>
              <li class="sup"><a class="ie6fixpic" href="/home/id-154415">支持的项目</a></li>
              <li class="spo"><a class="ie6fixpic" href="/home-build_deal/id-154415">发起的项目</a></li>
              <li class="att"><a class="ie6fixpic" href="/home-focus/id-154415">喜欢的项目</a></li>
              <li class="msg"><a class="ie6fixpic" href="/message">消息中心</a></li>
              <li class="set"><a class="ie6fixpic" href="${ctx}/user/settings.htm">个人设置</a></li>
              <li class="exit bn"><a class="ie6fixpic" href="/user-loginout">退出</a></li>
          </ul>
        </ul>
      </div>
    </div>
    <!-- user menu end-->

  </div>
</div>
<!--header-end-->    
                                    
<!-- user_info begin-->
<div class="info-head">
	<div class="wrap">
		<!--mod head static-->
		<div class="mod-head clearfix">
			<div class="info-left">
				<div class="portrait">
					<img src="">
					<div class="change-img"><a href="/settings-avatar">更换头像</a></div>
				</div>
			</div>
			<div class="info-right">
				<div class="user-fun">
					<h2>kkllkkii</h2>
					<a href="/settings" class="btn-red-h20 btn-base common-sprite">
						<span class="common-sprite"><i class="common-sprite icon-set"></i>个人设置</span>
					</a>
					<a href="/message" class="btn-red-h20 btn-base common-sprite">
						<span class="common-sprite"><i class="common-sprite icon-info"></i>消息中心</span>
					</a>
				</div>
				<div class="user-info">
					<p>他很忙，忙的什么都没来得及留下。</p>
					<p>-</p>
					<p>加入时间：2014-01-23</p>
					<p>所在地区：暂无信息</p>
									</div>
			</div>
		</div>
		<!--mod head end-->
		<!--content-tab static-->
		<div class="content-tab">
			<ul class="clearfix">
				<li class="select">
					<a href="/home/id-154415">
						支持的项目
						<span class="btn-base btn-red-h20 common-sprite">
							<span class="common-sprite">0</span>
						</span>
					</a>
				</li>
				<li>
					<a href="/home-build_deal/id-154415">
						发起的项目
						<span class="btn-base btn-gray-h20 common-sprite">
							<span class="common-sprite">1</span>
						</span>
					</a>
				</li>
				<li>
					<a href="/home-focus/id-154415">
						喜欢的项目
						<span class="btn-base btn-gray-h20 common-sprite">
							<span class="common-sprite">2</span>
						</span>
					</a>
				</li>
			</ul>
		</div>
		<!--content-tab end-->
	</div>
</div><!-- user_info end -->
<!--products static-->
<div class="products">
	<div class="wrap">
				<div class="operating-tips clearfix">
			<div class="icon-message"></div>
			<h3>很抱歉......这儿是个荒地：（</h3>
			<p>您可以<a class="red" href="/browse" target="_blank">浏览更多项目</a>～～</p>
		</div>
			</div>
</div>

<script type="text/javascript">
	$(".Js-address").hover(function(){
		var $parent =$(this).parent();
		$parent.find(".Js-addr-content").css({"left":$(this).offset().left-230,"top":$(this).offset().top+25}).show();
	},function(){
		var $parent =$(this).parent();
		$parent.find(".Js-addr-content").hide();
	});
	$(".Js-reason").hover(function(){
		var $parent =$(this).parent();
		$parent.find(".Js-reason-content").css({"left":$(this).offset().left-230,"top":$(this).offset().top+$(this).height()+5}).show();
	},function(){
		var $parent =$(this).parent();
		$parent.find(".Js-reason-content").hide();
	});
	$(".Js-back").hover(function(){
		var $parent =$(this).parent();
		$parent.find(".Js-back-content").css({"left":$(this).offset().left-230,"top":$(this).offset().top+25}).show();
	},function(){
		var $parent =$(this).parent();
		$parent.find(".Js-back-content").hide();
	});
	var vierTimer;
	$(".Js-view").hover(function(){
		var $parent =$(this).parent();
		$parent.find(".Js-view-content").css({"left":$(this).offset().left-230,"top":$(this).offset().top+25}).show();
	},function(){
		var $parent =$(this).parent();
		vierTimer = setTimeout(function(){
			$parent.find(".Js-view-content").hide();
		},100);
	});
	$(".Js-view-content").hover(function(){
		clearTimeout(vierTimer);
	},function(){
		$(this).hide();
	});
	
    function confirm_delivery(order_id){
        wx.confirm("确认收货，确认后项目发起人会确认您已收到相应物品。",function(){
            var url = '/home-confirm_delivery';
            $.ajax({
                type : 'post',
                dataType : 'json',
                url : url,
                data : {
                    'order_id' : order_id
                },
                success : function (data){
                    if(data.status == 1) {
                        wx.alert('确认完成');
                        $('.Js-confirm_delivery_'+order_id).remove();
                        $('.Js-view_delivery_'+order_id).after('<a href="javascript:;">交易完成</a>');
                    }else{
                        wx.alert(data.info);
                    }
                }
            })
        })
    }
    
    function getCity(selectedProId,selectedCity){
		$("select[name='province']").change(function() {
			var id = selectedProId || $(this).find("option:selected").attr("data-id");
			wx.sendData("/settings-get_region","id="+id,function(data){
				var options = "<option data-id='-1' value='请选择'>请选择</option>";
				for(var i=0;i<data.length;i++){
					options += "<option data-id='"+data[i].id+"' value='"+data[i].name+"' "+(selectedCity==data[i].name?"selected":"")+">"+data[i].name+"</option>";
				}
				$("select[name='city']").empty().append(options);
			});
		});
		if(selectedProId || selectedCity){
			$("select[name='province']").trigger('change');
			$("#wx-validator-province-error").hide();
		}
		selectedProId = 0;
	}
    
    function getProvince(selectedPro,selectedCity){
		selectedPro = selectedPro||"";
		wx.sendData("/settings-get_region","id=0",function(data){
			var options = "";
			for(var i=0;i<data.length;i++){
				options += "<option data-id='"+data[i].id+"' value='"+data[i].name+"' "+(selectedPro==data[i].name?"selected":"")+">"+data[i].name+"</option>";
				if(selectedPro && selectedPro == data[i].name)
					getCity(data[i].id,selectedCity);
			}
			$("select[name='province']").append(options);
		});
	}
    
    function address(data){
		addr.close();
		if(data.status == 1){
			wx.alert("添加成功",function(){location.reload();});
		}
		else{
			wx.alert(data.info);
		}
	}
    
    template.openTag = "{{";
	template.closeTag = "}}";
</script>
<script id="Js-addrModify" type="text">
<div class="pop-box" >
	<div class="title">
		<h3 class="">{{=consignee?'修改地址':'添加新地址'}}</h3>
		<a class="btn-close common-sprite ie6fixpic Js-pop-close" href="javascript:;">×</a>
	</div> 
	<div class="pop-body">
		<form method="post" name="address" action="/settings-save_consignee" wx-validator wx-validator-ajax wx-validator-error-class="txt-err ie6fixpic">
			<div class="user-set-dialog">
				<div class="info">
					<div class="form-item clearfix">
						<label>收件人：</label>
						<input type="text" name="consignee" wx-validator-rule="required" value="{{= consignee?consignee:''}}">
					</div>
					<div class="form-item clearfix">
						<label>手机：</label>
						<input type="text" name="mobile" wx-validator-rule="required|mobile"  value="{{= mobile?mobile:''}}">
					</div>
					<div class="form-item clearfix">
						<label>所在地：</label>
						<div class="option-box">
							<select name="province" class="fl" wx-validator-error-value="请选择">
								<option data-id='-1' value='请选择'>请选择</option>
							</select>

							<select name="city" class="fl" wx-validator-error-value="请选择">
								<option data-id='-1' value='请选择'>请选择</option>
							</select>
        					<span id="wx-validator-province-error" class="txt-err ie6fixpic " style="display:none"></span>
        					<span id="wx-validator-city-error" class="txt-err ie6fixpic " style="display:none"></span>
						</div>
					</div>
					<div class="form-item clearfix">
						<label>详细地址：</label>
						<input type="text" class="ads-ipt" name="address" wx-validator-rule="required" value="{{= address?address:''}}">
					</div>
					<div class="form-item clearfix">
						<label>邮编：</label>
						<input type="text" name="zip" wx-validator-rule="post" value="{{= zip?zip:''}}">
						<input type="hidden" name="order_id" id='order_id' value="{{= order_id?order_id:''}}"/>
						{{= id?'<input name="id" style="display:none" value="'+id+'"/>':''}}
					</div>
				</div>
			</div>
			<div class="btn">
				<a type="submit" class="btn-base btn-red-h30 common-sprite">
					<span class="common-sprite">保存</span>
				</a>
				<a class="btn-base btn-gray-h30 common-sprite Js-pop-close">
					<span class="common-sprite">取消</span>
				</a>
			</div>
		</form>
	</div>
</div>
</script>
<!--products end-->
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