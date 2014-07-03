<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>   
<!DOCTYPE html>
<!-- saved from url=(0034)http://www.zhongchou.cn/user-login -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>用户登录-爱儿网-中国最具影响力的众筹平台</title>
<meta name="keywords" content="众筹 创业 项目 投资 支持">
<meta name="description" content="在众筹网发布项目，获得投资支持，实现你的创业梦想">

<link rel="stylesheet" type="text/css" href="${ctx }/css/login1.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/login2.css">
<script type="text/javascript" src="js/jquery.js"></script>
<body>
<div class="header">
    <div class="wrap">
        <div class="img-logo">
            <h1>
                <a alt="众筹网" class="ie6fixpic" title="众筹网" href="http://www.zhongchou.cn/">众筹网</a>
            </h1>
        </div>
                <div class="quick-links">还没有帐号？立即 <a class="red" href="http://www.zhongchou.cn/user-register">免费注册</a></div>
                
    </div>
</div>
<div class="main">
	<div class="wrap">
		<div class="main-inner" style="background-image:url(static/zhongchou/images/phoenix/licai_cnt.jpg)"> </div>
		<div class="login-block" style="position:absolute; right:0; top:60px;">
			<div class="login-func">
				<ul class="clearfix">
					<li id="Js-pcbtn" class="select"><span>普通用户登录</span></li>
					<li id="Js-mobbtn" class="lbmob"><span>手机用户登录</span></li>
				</ul>
			</div>
			<div id="Js-pclogin" class="login-form">
				<form method="post" id="JS-user_login_form">
					<div class="login-form-ipt">
						<input class="uid icon-login ie6fixpic" type="text" placeholder="请输入用户名/邮箱" name="email">
					</div>
					<div class="login-form-ipt">
						<input class="ped icon-login ie6fixpic" type="password" placeholder="请输入密码" name="user_pwd">
					</div>
					<div class="login-form-btn">
						<input type="submit" value="登录">
					</div>
				</form>
				<div class="pass-login clearfix">
					<div class="fl">
						<a class="weibo icon-login" href="https://api.weibo.com/oauth2/authorize?client_id=1494625316&redirect_uri=http%3A%2F%2Fwww.zhongchou.cn%2Fapi_callback.php%3Fc%3DSina%26response_type%3Dcode&response_type=code">新浪微博</a>|
						<a class="tqq icon-login" href="https://open.t.qq.com/cgi-bin/oauth2/authorize?client_id=801393846&redirect_uri=http%3A%2F%2Fwww.zhongchou.cn%2Fapi_callback.php%3Fc%3DTencent&response_type=code">腾讯微博</a>
					</div>
					<a class="red fr" href="http://www.zhongchou.cn/user-getpassword">忘记密码？</a>
				</div>
			</div>
			<div id="Js-moblogin" class="login-form" style="display:none;">
				<form method="post" id="JS-user_mobilelogin_form">
					<div class="error-mid" style="display:none">
						<p class="icon-login ie6fixpic">用户名或密码错误，请重新输入。</p>
					</div>
					<div class="login-form-ipt">
						<input name="mobile" class="phon icon-login ie6fixpic" type="text" placeholder="手机号码">
					</div>
					<div class="login-form-ipt clearfix">
						<input name="vcode" class="ped icon-login vcode-input ie6fixpic" type="password" placeholder="验证码">
						<div class="fr do-not-click">
							<a style="display:inline-block" id="JS-vcodebtn" class="btn-base btn-red-h30 common-sprite"><span class="common-sprite">获取密码</span></a>
							<span id="JS-vcodelabel" style="display:none;" class="send-info"><em class="red">179</em>秒后<br>重新发送</span>
						</div>
					</div>
					<div class="login-form-btn">
						<input type="submit" value="登录">
					</div>
				</form>
			</div>
		</div>
		<script>
		// 切换逻辑
		$("#Js-pcbtn").bind("click", function(){
			$("#Js-pclogin").show();
			$("#Js-moblogin").hide();
			$("#Js-pcbtn").addClass("select");
			$("#Js-mobbtn").removeClass("select");
		});
		$("#Js-mobbtn").bind("click", function(){
			$("#Js-moblogin").show();
			$("#Js-pclogin").hide();
			$("#Js-mobbtn").addClass("select");
			$("#Js-pcbtn").removeClass("select");
		});
		
		
		(function(){
			$("#JS-user_login_form").bind("submit", function(){
				var email = $.trim($("#JS-user_login_form").find("input[name='email']").val());
				var password = $.trim($("#JS-user_login_form").find("input[name='user_pwd']").val());
				
				if(email == '')
				{
					wx.alert("账号不能为空");
					return false;
				}
				
				if(password == '')
				{
					wx.alert("密码不能为空");
					return false;
				}
				
				var ajaxurl = '/user-do_login';
				query = 'ajax=1&email=' + email + '&user_pwd=' + password;
				$.ajax({ 
					url: ajaxurl,
					dataType: "json",
					data:query,
					type: "POST",
					success: function(ajaxobj){
						if(ajaxobj.status==1)
						{
							window.location.href = "/deal-show/id-2025";
						}
						else
						{
							wx.alert(ajaxobj.info);
						}
					},
					error:function(ajaxobj)
					{
						wx.alert("登录失败，请重试");
					}
				});
				return false;
			});
		})();
		
		(function(){
			$("#JS-user_mobilelogin_form").bind("submit", function(){
				var mobile = $.trim($("#JS-user_mobilelogin_form").find("input[name='mobile']").val());
				var vcode = $.trim($("#JS-user_mobilelogin_form").find("input[name='vcode']").val());
				if(mobile == '' || !wx.validator.rule.mobile(mobile))
				{
					wx.alert("手机号格式不正确");
					return false;
				}
				
				if(vcode == '')
				{
					wx.alert("验证码不能为空");
					return false;
				}
				
				
				var ajaxurl = '/user-do_mobile_login';
				query = 'ajax=1&mobile=' + mobile + '&vcode=' + vcode;
				$.ajax({ 
					url: ajaxurl,
					dataType: "json",
					data:query,
					type: "POST",
					success: function(ajaxobj){
						if(ajaxobj.status==1)
						{
							window.location.href = "/deal-show/id-2025";
						}
						else
						{
							wx.alert(ajaxobj.info);
						}
					},
					error:function(ajaxobj)
					{
						wx.alert("登录失败，请重试");
					}
				});
				return false;
			});
		})();
		
		(function(){
			var vcode_leftTime = 180;
			var vcode_timer = null;
			function vcode_startRycleVbtn() {
				if (vcode_leftTime > 1) {
					vcode_leftTime--;
					$("#JS-vcodelabel").html('<em class="red">' + vcode_leftTime + '</em>秒后<br>重新发送');
					$("#JS-vcodelabel").show();
					$("#JS-vcodebtn").hide();
					vcode_timer = setTimeout(vcode_startRycleVbtn, 1000);
				} else {
					if (vcode_timer) clearTimeout(vcode_timer);
					vcode_leftTime = 180;
					$("#JS-vcodelabel").hide();
					$("#JS-vcodebtn").show();
				}
			}

			$("#JS-vcodebtn").bind("click", function(){
				var mobile = $.trim($("#Js-moblogin").find("input[name='mobile']").val());
				if(mobile == '' || !wx.validator.rule.mobile(mobile))
				{
					wx.alert("手机号格式不正确");
					return false;
				}

				var ajaxurl = '/user-get_login_vcode';
				var query = "mobile=" + mobile;
				vcode_startRycleVbtn();
				$.ajax({ 
					url: ajaxurl,
					dataType: "json",
					data:query,
					type: "POST",
					success: function(ajaxobj){
						if(ajaxobj.status==1)
						{
							wx.alert("密码已经发出到手机，有效期5分钟，请迅速登录")
						}
						else
						{
							vcode_leftTime = 0;
							vcode_startRycleVbtn();
							wx.alert(ajaxobj.info);
						}
					},
					error:function(ajaxobj)
					{
						vcode_leftTime = 0;
						vcode_startRycleVbtn();
						wx.alert("验证码发送失败，请重试");
					}
				});
			});
		})();
		</script>
	</div>
</div>
<div class="footer-login">
<p>©2013   北京东方联合投资管理有限公司   zhongchou.cn   版权所有     京ICP备11027068号 </p>
</div>
<!--footer end-->
<div style="display:none;">
    <script type="text/javascript">
      var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
      document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe89e365e0d0438aa7f6d6eab7960962c' type='text/javascript'%3E%3C/script%3E"));
    </script><script src="./login_files/h.js" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=e89e365e0d0438aa7f6d6eab7960962c" target="_blank"><img border="0" src="./login_files/21.gif" width="20" height="20"></a>
</div>
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
<script src="static/js/DD_belatedPNG_0.0.8a.js"></script>
<![endif]-->
 <img src="./login_files/pv" style="display: none; width: 0px; height: 0px;"></body></html>