<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>用户注册-爱儿网-中国最具权威的教育平台</title>
<meta name="keywords" content="家教 教育 英语 健身 母婴">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/login.css">
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/js/util.js"></script>
<body>
<div class="header">
    <div class="wrap">
        <div class="img-logo">
            <h1>
                <a alt="" class="ie6fixpic" title="" href="">学习帮</a>
            </h1>
        </div>
                <div class="quick-links">已有账号 <a class="red" href="${ctx}/log/toLogin.htm">直接登录</a></div>
                
    </div> 
</div>
<div class="main">
	<div class="wrap">
		<div class="main-inner" style="background-image:url(static/lanrenyuan/images/phoenix/licai_cnt.jpg)"> </div>
		<div class="signin-block" style="position:absolute; right:0; top:60px;">
			<div class="signin-tit">
				<h3>用户注册</h3>
			</div>
			<div class="signin-form">
				<form method="post" id="JS-user_register_form">
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
							<a class="weibo icon-login" href="https://api.weibo.com/oauth2/authorize?client_id=1494625316&redirect_uri=http%3A%2F%2Fwww.lanrenyuan.cn%2Fapi_callback.php%3Fc%3DSina%26response_type%3Dcode&response_type=code">新浪微博</a>|
							<a class="tqq icon-login" href="https://open.t.qq.com/cgi-bin/oauth2/authorize?client_id=801393846&redirect_uri=http%3A%2F%2Fwww.lanrenyuan.cn%2Fapi_callback.php%3Fc%3DTencent&response_type=code">腾讯微博</a>
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
				        obj.src = "${ctx}/imageServlet?"+Math.random();
				    }
				 
					//ajax验证手机号是否已经注册
				 function checkPhoneIslegal(){
						$.ajax({ 
						url: "${ctx}/register/phoneIsLegal.htm",
						dataType: "json",
						data:{phone:phone},
						type: "post",
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
						$.ajax({ 
							url: "${ctx}/register/register.htm",
							type: "post",
							data:{verify:verify,email:email,username:user_name,password:user_pwd,phone:phone},
							dataType: "json",
							success: function(ajaxobj){
								is_submiting = false;
								if(ajaxobj.code==1)
								{
									wx.alert("注册邮件已发出请查收", function() {
										window.location.href = "${ctx}/log/toLogin.htm";
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
<p>©2014   北京懒人科技有限公司   lanrenyuan.com   版权所有    </p>
</div>
<!--footer end-->

 </body></html>