<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>用户登录-爱儿网-中国最具影响力的众筹平台</title>
<meta name="keywords" content="众筹 创业 项目 投资 支持">
<meta name="description" content="在众筹网发布项目，获得投资支持，实现你的创业梦想">

<link rel="stylesheet" type="text/css" href="${ctx }/css/login.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css">
<script type="text/javascript" src="${ctx }/js/util.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<body>
<div class="header">
    <div class="wrap">
        <div class="img-logo">
            <h1>
                <a alt="众筹网" class="ie6fixpic" title="众筹网" href="">众筹网</a>
            </h1>
        </div>
                <div class="quick-links">还没有帐号？立即 <a class="red" href="../register/toRegister.htm">免费注册</a></div>
                
    </div>
</div>
<div class="main">
	<div class="wrap">
		<div class="main-inner" style="background-image:url(static/zhongchou/images/phoenix/licai_cnt.jpg)"> </div>
		<div class="login-block" style="position:absolute; right:0; top:60px;">
			<div class="login-func">
				<ul class="clearfix">
					<li id="Js-pcbtn" class="select"><span>普通用户登录</span></li>
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
					<a class="red fr" href="user-getpassword">忘记密码？</a>
				</div>
			</div>
			
		</div>
		<script>
		
		
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
				
				var ajaxurl = './login.htm';
				query = 'ajax=1&email=' + email + '&password=' + password;
				$.ajax({ 
					url: ajaxurl,
					dataType: "json",
					data:query,
					type: "POST",
					success: function(ajaxobj){
						if(ajaxobj.code==1)
						{
							window.location.href = "../index.htm";
						}
						else
						{
							wx.alert(ajaxobj.msg);
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
		
		
		</script>
	</div>
</div>
<div class="footer-login">
<p>©2013   北京东方联合投资管理有限公司   zhongchou.cn   版权所有     京ICP备11027068号 </p>
</div>
<!--footer end-->
<div style="display:none;">
</div>
</body></html>