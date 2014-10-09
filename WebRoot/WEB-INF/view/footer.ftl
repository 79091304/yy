<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/util.js"></script>
<script type="text/javascript" src="${ctx}/js/promotuser.js"></script>

	
 <div class="footer" pbid="footer">
  <!--footer section start-->
  <div class="footer-section clearfix">
    <div class="footer-wrap">
    <!--footer map start-->
    <div class="foot-map">
      <dl>
        <dt>在线课程</dt>
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
<a rel="nofollow" href="help-about/id-1" alt="关于懒人" title="关于懒人">关于懒人</a><em>/</em><a rel="nofollow" href="help-contact" alt="联系我们" title="联系我们">联系我们</a><em>/</em><a rel="nofollow" href="help-center" alt="帮助中心" title="帮助中心">帮助中心</a><em>/</em></dd><dd><a rel="nofollow" href="help-team" alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a rel="nofollow" href="help-term" alt="服务协议" title="服务协议">服务协议</a><em>/</em><a rel="nofollow" href="help-specification" alt="项目发起规范" title="项目发起规范">项目发起规范</a><em>/</em></dd>
      </dl>
       <dl>
        <dt>关注我们</dt>
        <dd>
          <a rel="nofollow" target="_blank" href="http://tieba.baidu.com/f?ie=utf-8&amp;kw=%E4%BC%97%E7%AD%B9%E7%BD%91" alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em>
          <a rel="nofollow" target="_blank" href="http://user.qzone.qq.com/2357291729" alt="QQ空间" title="QQ空间">QQ空间</a><em>/</em>
          <a rel="nofollow" target="_blank" href="http://e.weibo.com" alt="新浪微博" title="新浪微博">新浪微博</a>
        </dd> 
        <dd>
          <a rel="nofollow" target="_blank" href="http://www.douban.com/people/" alt="豆瓣小站" title="豆瓣小站">豆瓣小站</a><em>/</em>
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
    	    		<a href="http://finance.ifeng.com/" target="_blank">凤凰网</a>
    			</p>
	</div>
      <p>©2014  北京懒人科技有限公司   lanrenyuan.com  版权所有    </p>
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
	

	//显示用户昵称
	$(function(){
			var uid = wx.cookie('uid');
			var name = wx.cookie('uname');
			if(undefined != uid && '' != uid){
				$("#uname").text(name);
			    $("#jsddm").show();
			    $(".login-wrap").hide();
			}else{
				$("#jsddm").hide();
			}
	
			//退出
			$("#logout").click(function(){
				wx.removeCookie("uid");
				wx.removeCookie("uname");
				window.location.href="www.lanrenyuan.com";
			});
			
		})

</script>
