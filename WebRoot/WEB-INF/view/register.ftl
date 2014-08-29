<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>用户注册-爱儿网-中国最具影响力的幼儿园平台</title>
<meta name="keywords" content="众筹 创业 项目 投资 支持">
<meta name="description" content="在众筹网发布项目，获得投资支持，实现你的创业梦想">
<script type="text/javascript" src="${ctx }/js/jquery.json-2.4.min.js"></script>
<script type="text/javascript" src="${ctx }/js/util.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/css/register.css">
<body>
<div class="header">
    <div class="wrap">
        <div class="img-logo">
            <h1>
                <a alt="众筹网" class="ie6fixpic" title="众筹网" href="http://www.zhongchou.cn/">众筹网</a>
            </h1>
        </div>
                <div class="quick-links">已有账号 <a class="red" href="../login/toLogin.htm">直接登录</a></div>
                
    </div> 
</div>
<div class="main">
	<div class="wrap">
		<div class="main-inner" style="background-image:url(static/zhongchou/images/phoenix/licai_cnt.jpg)"> </div>
		<div class="signin-block" style="position:absolute; right:0; top:60px;">
			<div class="signin-tit">
				<h3>用户注册</h3>
			</div>
			<div class="signin-form">
				<form method="post" id="JS-user_register_form">
					<div class="form-item clearfix">
						<label>我是：</label>
						<select id = "type" name="type">
								<option value="">请选择</option>
								<option value="0">家长</option>
								<option value="1">老师</option>
						</select>
					</div>
					<div class="form-item clearfix">
						<label>邮箱：</label>
						<input type="text" placeholder="请输入您的常用邮箱" name="email">
					</div>
					<div class="form-item clearfix">
						<label>手机号：</label>
						<input type="text" placeholder="请输入您的手机号" name="phone">
					</div>
					<div class="form-item clearfix">
						<label>密码：</label>
						<input type="password" name="user_pwd" placeholder="请输入6-16位密码">
					</div>
					<div class="form-item clearfix">
						<label>确认密码：</label>
						<input type="password" name="confirm_user_pwd" placeholder="请再次输入密码">
					</div>
					<div class="form-item clearfix">
						<label>昵称：</label>
						<input type="text" placeholder="请输入昵称" name="user_name">
					</div>
					<div class="form-item clearfix">
						<label>验证码：</label>
						<input class="inp-wst" type="text" name="verify">
						<span class="code"><img title="点击更换" onclick="javascript:refresh(this);" src="../imageServlet"></span>
					</div>
					<div class="login-form-btn">
						<input type="submit" value="立即注册">
					</div>
					<div class="pass-login clearfix">
						<div class="fl">
							<a class="weibo icon-login" href="https://api.weibo.com/oauth2/authorize?client_id=1494625316&redirect_uri=http%3A%2F%2Fwww.zhongchou.cn%2Fapi_callback.php%3Fc%3DSina%26response_type%3Dcode&response_type=code">新浪微博</a>|
							<a class="tqq icon-login" href="https://open.t.qq.com/cgi-bin/oauth2/authorize?client_id=801393846&redirect_uri=http%3A%2F%2Fwww.zhongchou.cn%2Fapi_callback.php%3Fc%3DTencent&response_type=code">腾讯微博</a>
						</div>
					</div>
				</form>
				<script>
				$(function(){
					
				});
				
				//发送邮件
				function sendEmail(){
					
				}
				
				 function refresh(obj) {
				        obj.src = "imageServlet?"+Math.random();
				    }
				 
					//ajax验证手机号是否已经注册
				 function checkPhoneIslegal(){
						$.ajax({ 
						url: "./phoneIsLegal.htm",
						dataType: "json",
						data:"phone="+phone,
						type: "POST",
						success: function(ajaxobj){
							if(ajaxobj.code ==1){
								wx.alert("手机号已经注册");
								return false;
							}
							}
						});
				 }
				
					var is_submiting = false;
					function jmzgetLength(str) {
						var realLength = 0, len = str.length, charCode = -1;
						for (var i = 0; i < len; i++) {
						charCode = str.charCodeAt(i);
						if (charCode >= 0 && charCode <= 128) realLength += 1;
							else realLength += 2;
						}
						return realLength;
					} 
					$("#JS-user_register_form").bind("submit", function(event){
						if(is_submiting) return false;
						
						var email = $.trim($("#JS-user_register_form").find("input[name='email']").val());
						var phone = $.trim($("#JS-user_register_form").find("input[name='phone']").val());
						var user_pwd = $.trim($("#JS-user_register_form").find("input[name='user_pwd']").val());
						var confirm_user_pwd = $.trim($("#JS-user_register_form").find("input[name='confirm_user_pwd']").val());
						var user_name = $.trim($("#JS-user_register_form").find("input[name='user_name']").val());
						var verify = $.trim($("#JS-user_register_form").find("input[name='verify']").val());
						var type = $.trim($("#JS-user_register_form").find("select[name='type']").val());
						if(type == ''){
							wx.alert("请先认定一下我的身份");
							return false;
						}
						if(email == '' || !wx.validator.rule.email(email)) {
							wx.alert("邮箱格式不正确");
							return false;
						}
						if(phone == '' || !wx.validator.rule.mobile(phone)) {
							wx.alert("手机格式不正确");
							return false;
						}else{
							
						}
						if(user_pwd.length < 6 || user_pwd.length > 16) {
							wx.alert("密码必须是6到16位的字母或数字");
							return false;
						}
						if(user_pwd != confirm_user_pwd) {
							wx.alert("确认密码失败");
							return false;
						}
						if(user_name=="" || jmzgetLength(user_name)>24) {
							wx.alert("昵称不能为空,最多为12个汉字或24个字符");
							return false;
						}
						if(verify=="" || jmzgetLength(user_name)>24) {
							wx.alert("验证码不能为空");
							return false;
						}
						is_submiting = true;
						var ajaxurl = './register.htm';
						$.ajax({ 
							url: ajaxurl,
							dataType: "json",
							data:"verify="+verify+"&email="+email+"&username="+user_name+"&password="+user_pwd+"&type="+type+"&phone="+phone,
							type: "POST",
							success: function(ajaxobj){
								is_submiting = false;
								if(ajaxobj.code==1)
								{
									wx.alert("注册邮件已发出请查收", function() {
										window.location.href = "../login/toLogin.htm";
									});
								}else if(ajaxobj.code== -1)
								{
									wx.alert("验证码错误");
								} 
								else {
									if (ajaxobj.msg != "") {
										wx.alert(ajaxobj.msg);
										return;
									}
									for (var  i = 0; i < ajaxobj.data.length; i++) {
										if (ajaxobj.data[i].type == 'form_error') {
											wx.alert(ajaxobj.data[i].info);
											return;
										}
									}
									
									wx.alert("注册错误");
								}
							},
							error:function(ajaxobj)
							{
								is_submiting = false;
								wx.alert('网络错误');
							}
						});
						return false;
					});
				</script>
			</div>
		</div>
	</div>
</div>

<div class="footer-login">
<p>©2013   北京东方联合投资管理有限公司   zhongchou.cn   版权所有     京ICP备11027068号 </p>
</div>
<!--footer end-->

 </body></html>