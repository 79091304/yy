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
					<dd></dd>
					<dd>
						<#list category as item> <a rel="nofollow" href="${ctx}/course/list.htm?cid=${item.id}"
							title="${item.name}">${item.name}</a><em>/</em> 
							<#if (item_index+1)%3==0>
							</dd>
							<dd>
							</#if> 
						</#list>
					</dd>
				</dl>
				<dl>
					<dt>关于</dt>
					<dd>
						<a rel="nofollow" href="#" alt="关于懒人" title="关于懒人">关于懒人</a><em>/</em><a
							rel="nofollow" href="#" alt="联系我们" title="联系我们">联系我们</a><em>/</em><a
							rel="nofollow" href="#" alt="帮助中心" title="帮助中心">帮助中心</a><em>/</em>
					</dd>
					<dd>
						<a rel="nofollow" href="#" alt="团队介绍" title="团队介绍">团队介绍</a><em>/</em><a
							rel="nofollow" href="#" alt="服务协议" title="服务协议">服务协议</a><em>/</em>
					</dd>
				</dl>
				<dl>
					<dt>关注我们</dt>
					<dd>
						<a rel="nofollow" target="_blank"
							href="#"
							alt="百度贴吧" title="百度贴吧">百度贴吧</a><em>/</em> <a rel="nofollow"
							target="_blank" href="#"
							alt="QQ空间" title="QQ空间">QQ空间</a><em>/</em> <a rel="nofollow"
							target="_blank" href="#" alt="新浪微博" title="新浪微博">新浪微博</a>
					</dd>
					<dd>
						<a rel="nofollow" target="_blank"
							href="#" alt="豆瓣小站" title="豆瓣小站">豆瓣小站</a><em>/</em>
					</dd>
				</dl>
				<dl class="last">
					<dt>服务</dt>
					<dd>
						<a rel="nofollow" target="_blank" href="#" alt="" title=""></a>
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
			<p>©2014 北京懒人科技有限公司 lanrenyuan.com 版权所有</p>
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
