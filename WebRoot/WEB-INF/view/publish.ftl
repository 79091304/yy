<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>发起项目-众筹网-中国最具影响力的众筹平台</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/publish.css">
<script type="text/javascript" src="${ctx}/js/address.js" >
<body>
	<!--header static-->
	<#include "header.ftl">

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

						<form wx-validator="" wx-validator-ajax=""
							action="project-save" method="post"
							name="HwForm" id="HwForm" autocomplete="off">

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
									<label>课时：</label> 
									<input name="deal_days" id="cdays" type="text" onkeyup="return;this.value=this.value.replace(/[^\.\d]/g,'')"
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
									<div id="Js-select-cate" class="option-sort" id="cateid">
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
										<select name="province" class="fl" id="province"
											wx-validator-error-value="请选择省份">
											<option>请选择省份</option>
										</select> 
										<select name="city" class="fl" id="city"
											wx-validator-error-value="请选择城市">
											<option>请选择城市</option>
										</select>
										</select> <select name="area" class="fl" id="area"
											wx-validator-error-value="请选择地区">
											<option>请选择地区</option>
										</select> 
										<script>
											addressInit('province', 'city', 'area', '北京', '北京', '朝阳区');
										</script> 
										<span id="wx-validator-province-error" class="error-text"
											style="display: none">请选择省份</span> <span
											id="wx-validator-city-error" class="error-text"
											style="display: none">请选择城市</span> 
											<input name="caddress" id="address"
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
												onclick="javascript:upd_file();"
												type="file" id="imageurl" name="image_file" value="">
											<a class="btn-base common-sprite btn-red-h30"> <span
												class="common-sprite">上传封面</span>
											</a>

										</div>
										<span class="gray">支持jpg、jpeg、png、gif格式，大小不超过5M。建议尺寸：223
											x 168px</span>
									</div>
								</div>
								<div class="form-item clearfix">
									<label>视频：</label> 
									<input type="text" name="vedio" id="vdeidourl"
										class="inp-w310" maxlength="200"
										wx-validator-placeholder="请输入优酷视频的播放页地址" value=""
										placeholder="请输入优酷视频的播放页地址">
								</div>
								<div class="form-item clearfix">
									<label>课程简介：</label>
									<textarea style="width: 60%; height: 30px" name="brief" id="brief"
										wx-validator-rule="required|maxLength"
										wx-validator-param="|75" wx-validator-placeholder="不超过75个字"
										maxlength="75" placeholder="不超过75个字"></textarea>
									<span id="wx-validator-brief-required" class="error-text">不能为空</span>
									<span id="wx-validator-brief-maxLength"
										class="error-text hidden" style="display: none;">不能超过75个汉字</span>
								</div>

								<div class="form-item clearfix">
									<label>标签：</label> 
									<input type="text" id="Js-tag" name="tags" id="tags"
										class="inp-w310" wx-validator-placeholder="请使用空格或逗号分隔不同标签"
										value="" placeholder="请使用空格或逗号分隔不同标签">
								</div>

								<input type="hidden" name="imageurl" value=""> <input
									type="hidden" name="savenext" value="1"> <input
									type="hidden" name="id" value="">

								<div class="action tr">
									<a type="submit" href="javascript:void(0);"
										wx-validator-submit-error="您填写的部分内容不符合规范" id="dosubmit"
										class="btn-base btn-red-h48 common-sprite"> <span
										class="common-sprite">完成</span>
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
		
<#include "footer.ftl">

<script>
	$(function(){
		$("#dosubmit").click(function(){
			var cname = $("#cname").val();
			var cdays = $("#cdays").val();
			var cateid = $("#cateid").val();
			var province = $("#province")val();
			var city = $("#city").val();
			var area = $("#area").val();
			var address = $("#address").val();
			var vdeidourl = $("#vdeidourl").val();
			var brief = $("#brief").val();
			var imageurl = $("#imageurl").val();
			
		 	if(HwForm_before()){
				$.ajax({
					url : "${ctx}/course/save.htm",
		    		type : "POST", 
				    dataType:"text",
				    contentType:'text/html',
				    data:{name:cname,},
				    success : function(data) {
				       
				    },
					error:function(e){
				    }  
				    
						});
						
			}else{
				 HwForm(data);
			}
		});
	})
</script>
</body>
</html>