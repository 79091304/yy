<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>注册-中国最具权威的教育平台</title>
<meta name="keywords" content="家教 教育 英语 健身 母婴">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<!--public js&css start-->
<!--public js&css end -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/setting.css">
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
							href="#">资料修改</a></li>
						<li class=""><a class="icons password ie6fixpic"
							href="#">密码修改</a></li>
						<li><a class="icons portrait ie6fixpic"
							href="#">头像修改</a></li>
						<li><a class="icons address ie6fixpic"
							href="#">收件地址管理</a></li>
						<li><a class="icon-yhj-gray ie6fixpic"
							href="#">我的优惠劵</a></li>
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
							<p class="form-msg red">${user.email}</p>
						</div>

						<div class="form-item clearfix">
							<label class="red">用户名：</label> <input value="${user.name}" id="username"
								name="username" wx-validator-rule="required|byteRangeLength"
								wx-validator-param="|4-24"
								wx-validator-user_name-byterangelength="2到12个汉字或4到24个字符"
								type="text">
						</div>
						<div class="form-item clearfix">
							<label class="red">手机号：</label> <input value="${user.phone}" id="phone"
								name="phone" wx-validator-rule="required|byteRangeLength"
								wx-validator-param="|11"
								wx-validator-user_name-byterangelength="请填写正确的手机号"
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
								<select name="province" id="province" wx-validator-error-value="选择省份">
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
							<label>网址：</label> <input name="website" id="website"
								wx-validator-rule="url" type="text">
						</div>

						<div class="form-item clearfix">
							<label>个人说明：</label>
							<textarea name="desc" id="desc"
								placeholder="您的介绍可更有效的帮助支持者了解您和了解项目的背景"></textarea>
						</div>

						<div class="setting-submit">
							<a type="submit" class="btn-base btn-red-h30 common-sprite"
								><span id="subbt" class="common-sprite">保存</span></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<#include "footer.ftl">
	<script type="text/javascript">
	$(function(){
		$("#subbt").click(function(){
			var use = $("#username").val();
			var web = $("#website").val();
			var des = $("#desc").val();
			var uid = wx.cookie('uid');
			if(uid != null && uid != undefinde){
				$.ajax({
				url:"${ctx}/user/modify.htm",
				data:{uid:uid,username:use,website:web,desc:des,phone:phone},
				type: "POST",
				dataType:"json",
				success:function(data){
					if(data.code==1){
						wx.alert("保存成功");
					}
					else(data.code==0){
						wx.alert(data.msg);
					}
				}
				});
			}
		});
	})
	

</script>
	<!--main end-->
	<!--footer static-->

</body>
</html>