<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>发布课程-懒人园-中国最具权威的教育平台</title>
<meta name="keywords" content="家教 教育 英语 健身 母婴">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">

<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/publish.css">
<script type="text/javascript" src="${ctx}/js/address.js" ></script>
<script type="text/javascript" src="${ctx}/js/ajaxupload.js"></script>
<body>
	<!--header static-->
	
	
	<div class="header">
		<div class="wrap clearfix" pbid="header">
			<div class="img-logo">
				<h1>
					<a alt="" class="ie6fixpic" title="" href="index"></a>
				</h1>
			</div>
			<!--menu start-->
			<div class="menu">
				<ul class="clearfix" id="headermenu">
					<li ><a href="${ctx}/index.html">首页 </a></li>
					<li ><a href="${ctx}/course/list.htm">课程</a></li>
					<li><a href="${ctx}/teacher/list.htm">教师 </a></li>
					<li><a href="${ctx}/teacher/list.htm">新人帮助</a></li>
					<li class="select"  ><a href="${ctx}/course/prepublish.htm">发布课程</a></li>
				</ul>
			</div>
			<!--menu end-->
			<!--search start-->
			<div class="search common-sprite ie6fixpic sw">
				<form autocomplete="off" action="/deals" method="post"
					id="header_new_search_form" wx-validator="">
					<input placeholder="搜索" name="k" wx-validator-placeholder="搜索"
						wx-validator-rule="required" class="search-key gray"
						wx-validator-notip="" type="text"> <input
						id="Js-search-submit" class="btn-search ie6fixpic" type="submit">
				</form>
			</div>
			<!--search end-->

			<!-- user menu start-->
			<div class="user-menu" id="jsddm">
				<div class="menu-hd tx">
					<a href="" class="tit"> <span class='avatar-box'>
							<img id="headeravatar"
							src="${ctx}/images/noavatar_small.gif" />
					</span> <span id="uname" class="user-name word-break ie6fixpic">游客</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
							<li class="sup"><a class="ie6fixpic" href="/home/id-154415">报名的课程</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="/home-build_deal/id-154415">发布的课程</a></li>
							<li class="att"><a class="ie6fixpic"
								href="/home-focus/id-154415">喜欢的课程</a></li>
							<li class="msg"><a class="ie6fixpic" href="${ctx}/message/index.htm">消息中心</a></li>
							<li class="set"><a class="ie6fixpic" href="${ctx}/settings/index.htm">个人设置</a></li>
							<li class="exit bn"><a  class="ie6fixpic" id="logout"
								href="${ctx}/log/logout.htm">退出</a></li>
					</ul>
				</div>
			</div>
			<!-- user menu end-->

			<!--login start-->
			<div class="login-wrap">
				<span id="usertag"> <a rel="nofollow"
					href="${ctx}/log/toLogin.htm">登录</a> <em>|</em> <a rel="nofollow"
					href="${ctx}/register/toRegister.htm">注册</a>
				</span> 
			</div>
			<!--login end-->
		</div>
	</div>
	

	<!--main static-->
	<div class="main clearfix">
		<div class="wrap clearfix">
			<!--content static-->
			<div class="content fl">

				<!--project start-->
				<div class="project-box">
					<div class="radius-hd">
						<div class="radius-hl common-sprite">111</div>
						<div class="radius-hc w705">222</div>
						<div class="radius-hr common-sprite">333</div>
					</div>
					<div class="radius-bd project-con w713">

						<form wx-validator="" wx-validator-ajax="" action="project-save"
							method="post" name="HwForm" id="HwForm" autocomplete="off">

							<div class="tit-wrap">
								<h3>课程信息</h3>
							</div>
							<div class="project-edit">
								<div class="form-item clearfix">
									<label>课程名称：</label> <input name="cname" type="text" id="cname"
										class="inp-w310" wx-validator-rule="required|maxLength"
										wx-validator-param="|40" wx-validator-placeholder="名称不可超过40个字"
										wx-validator-name-maxlength="名称不可超过40个字" value=""
										maxlength="40" placeholder="名称不可超过40个字">
								</div>
								<div class="form-item clearfix">
									<label>课时：</label> <input name="deal_days" id="cdays"
										type="text"
										onkeyup="return;this.value=this.value.replace(/[^\.\d]/g,'')"
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
										<#list category as item> <span data-id="${item.id}">${item.name}</span>
										</#list>
									</div>
									<input id="Js-cate" class="hidden" name="cate_id" value="">
								</div>
								<div class="form-item clearfix">
									<label>授课地点：</label>
									<div class="option-box">
										<select name="province" class="fl" id="province"
											wx-validator-error-value="请选择省份">
											<option>请选择省份</option>
										</select> <select name="city" class="fl" id="city"
											wx-validator-error-value="请选择城市">
											<option>请选择城市</option>
										</select> </select> <select name="area" class="fl" id="area"
											wx-validator-error-value="请选择地区">
											<option>请选择地区</option>
										</select>
										<script>
											addressInit('province', 'city',
													'area', '北京', '北京', '朝阳区');
										</script>
										<span id="wx-validator-province-error" class="error-text"
											style="display: none">请选择省份</span> <span
											id="wx-validator-city-error" class="error-text"
											style="display: none">请选择城市</span> <input name="caddress"
											id="address" type="text" class="inp-w310"
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
											<input type="button" id="upload" name="image_file" value="">
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
										id="vediourl" class="inp-w310" maxlength="200"
										wx-validator-placeholder="请输入优酷视频的播放页地址" value=""
										placeholder="请输入优酷视频的播放页地址">
								</div>
								<div class="form-item clearfix">
									<label>课程简介：</label>
									<textarea style="width: 60%; height: 30px" name="brief"
										id="brief" wx-validator-rule="required|maxLength"
										wx-validator-param="|75" wx-validator-placeholder="不超过75个字"
										maxlength="75" placeholder="不超过75个字"></textarea>
									<span id="wx-validator-brief-required" class="error-text">不能为空</span>
									<span id="wx-validator-brief-maxLength"
										class="error-text hidden" style="display: none;">不能超过75个汉字</span>
								</div>

								<div class="form-item clearfix">
									<label>标签：</label> <input type="text" id="Js-tag" name="tags"
										id="tags" class="inp-w310"
										wx-validator-placeholder="请使用空格或逗号分隔不同标签" value=""
										placeholder="请使用空格或逗号分隔不同标签">
								</div>

								<input type="hidden" name="imageurl" id="imageurl" value="">
								<input type="hidden" name="savenext" value="1"> <input
									type="hidden" name="id" value="">

								<div class="action tr">
									<a type="submit" wx-validator-submit-error="您填写的部分内容不符合规范"
										id="dosubmit" class="btn-base btn-red-h48 common-sprite">
										<span class="common-sprite">完成</span>
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
		<!--main end-->
		<!--footer static-->
		<#include "footer.ftl">

		<script>
			$(function() {
			
				var uid = wx.cookie('uid');
				var name = wx.cookie('uname');
				if(undefined != uid && '' != uid){
					$("#uname").text(name);
				    $("#jsddm").show();
				    $(".login-wrap").hide();
				}else{
					$("#jsddm").hide();
				}

				$("input[name='name']").blur(
						function() {
							$("#Js-name").text($(this).val());

							wx.sendData("/project-gettag", "name="
									+ $("#Js-name").text(), function(data) {
								$("#Js-tag").val(data.tags);
							});
						});
				$("input[name='limit_price']").blur(function() {
					$("#Js-price").text("￥" + $(this).val());
				});
				$("input[name='deal_days']").blur(function() {
					$("#Js-days").text($(this).val() + "天");
				});

				$("#Js-select-cate").delegate(
						'span',
						'click',
						function(event) {
							$(this).addClass('select').siblings().removeClass(
									'select');
							$("#Js-cate").val($(this).attr("data-id"));
						});

				$("#dosubmit").click(
						function() {
							var cname = $("#cname").val();
							var cdays = $("#cdays").val();
							var cateid = $(".option-sort").children(
									".select:first").attr("data-id");
							var province = $("#province").val();
							var city = $("#city").val();
							var area = $("#area").val();
							var address = $("#address").val();
							var vediourl = $("#vediourl").val();
							var brief = $("#brief").val();
							var imageurl = $("#imageurl").val();
							if ("" == cateid && undefined == cateid) {
								wx.alert("请选择类别");
								return;
							}

							$.ajax({
								url : "${ctx}/course/save.htm",
								type : "POST",
								dataType : "json",
								data : {
									cname : cname,
									cdays : cdays,
									cid : cateid,
									pro : province,
									cty : city,
									are : area,
									addre : address,
									ved : vediourl,
									bri : brief,
									img : imageurl,
									uid : uid,
									uname : name
								},
								success : function(data) {
									if (data.code == 1) {
										wx.alert("保存完成");
									}
								}
							});
						});
			})

			//文件上传
			$(document).ready(function() {
				var button = $('#upload'), interval;
				var fileType = "all", fileNum = "one";
				new AjaxUpload(button, {
					action : '${ctx}/file/upload.htm',
					name : 'userfile',
					onSubmit : function(file, ext) {
						if (fileType == "pic") {
							if (ext && /^(jpg|png|jpeg|gif)$/.test(ext)) {
								this.setData({
									'info' : '文件类型为图片'
								});
							} else {
								wx.alert("非图片类型文件，请重传");
								return false;
							}
						}
						button.text('文件上传中');
						if (fileNum == 'one')
							this.disable();
						interval = window.setInterval(function() {
							var text = button.text();
							if (text.length < 14) {
								button.text(text + '.');
							} else {
								button.text('文件上传中');
							}
						}, 200);
					},
					onComplete : function(file, response) {//上传成功的函数；
						//清楚按钮的状态
						button.text('文件上传');
						window.clearInterval(interval);
						this.enable();
						//修改下方div的显示文字
						var resdata = $.parseJSON(response);
						if (resdata.code == 1) {
							$(".gray").text(file + "上传成功");
							$("#imageurl").val(resdata.data);
							$('#upload').attr("disabled", "true");
						} else {
							$(".gray").text(file + "上传失败");
						}
					}
				});
			});
		</script>
</body>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
</script>

</html>
