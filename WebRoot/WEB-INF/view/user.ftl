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
<#include "header.ftl">
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

<#include "footer.ftl">

</body></html>