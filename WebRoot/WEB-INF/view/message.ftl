<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>-中国最具影响力的众筹平台</title>
<meta name="keywords" content="家教 教育 英语 健身 母婴">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<!--public js&css start-->
<!--public js&css end -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/message.css">
</head>

<body>
	<!--header static-->
	<#include "header.ftl">
	
	<!--header-end-->
	<!--main static-->
	<div class="main clearfix">
		<div class="setting wrap">
			<div class="setting-title clearfix">
				<h3>消息中心</h3>
				<a href="home/id-154415">返回个人中心</a>
			</div>
			<div class="setting-content clearfix">
				<div class="setting-menu">
					<ul class="clearfix">
						<li class="select"><a class="icons msg ie6fixpic"
							href="#">私信</a></li>
						<li><a class="icons rec-com ie6fixpic"
							href="#">发出的话题</a></li>
						<li><a class="icons rec-com ie6fixpic"
							href="#">发出的评论</a></li>
						<li><a class="icons emit-com ie6fixpic"
							href="#">收到的评论</a></li>
					</ul>
				</div>
				<div class="message-box">
					<!--message static-->
					<div class="message-item clearfix" id="message_all">
						<div class="bd">
							<ul class="clearfix">
								<div class="operating-tips clearfix">
									<div class="icon-message"></div>
									<h3>很抱歉......这儿是个荒地：（</h3>
									<p>您可以向站内用户发送私信～～</p>
								</div>
							</ul>
							<div class="page tr"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<script id="Js-kuang-tpl" type="text">
<div >
	<div class="pop-box">
	<div class="title">
		<h3 class="">发送私信</h3>
		<a href="javascript:;" class="btn-close common-sprite ie6fixpic Js-pop-close">×</a>
	</div> 
	<div class="pop-body">
		<form action="" method="post">
			<div class="pop-msg">
				<h3>收件人：{{=data[1]}}</h3>
				<textarea id="Js-content"></textarea>
			</div>
			<div class="btn">
				<a class="btn-base btn-red-h30 common-sprite Js-pop-submit" data-id="{{=data[0]}}">
					<span class="common-sprite">保存</span>
				</a>
				<a class="btn-base btn-gray-h30 common-sprite Js-pop-close">
					<span class="common-sprite">取消</span>
				</a>
			</div>
		</form>
	</div>
	</div>
</div>
</script>
	<!--main end-->
	<!--footer static-->
<#include "footer.ftl" >
	
<script type="text/javascript">
	
	var replayUrl = "/message-send";
		$(".Js-reply").click(function(){
			wx.pop(wx.template("Js-kuang-tpl",{data:$(this).attr("data-id").split("|")}),{shown:function(){
				$(".Js-pop-submit").click(function(){
					wx.sendData(replayUrl,"id="+$(this).attr("data-id")+"&message="+$("#Js-content").val(),function(data){
						if(data.status == 1){
							wx.alert(data.info,function(){
								location.reload();
							});
						}
						else{
							wx.alert(data.info);
						}
					});
				});
			}});
		});
			template.openTag = "{{";
			template.closeTag = "}}";

	function del_message(id){
		wx.confirm("确定删除？",function(){
			wx.sendData("/message-delmessage","s_id="+id,function(data){
				location.reload();
			})
		});
	}
</script>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
</script>

</body>
</html>