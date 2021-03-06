<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<meta name="keywords" content="家教 教育 英语">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/list.css">
</head>

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
					<li ><a href="${ctx}/index.shtml">首页 </a></li>
					<li class="select" ><a href="${ctx}/course/list.htm">课程</a></li>
					<li><a href="${ctx}/teacher/list.htm">教师 </a></li>
					<li><a href="${ctx}/teacher/list.htm">新人帮助</a></li>
					<li><a href="${ctx}/course/prepublish.htm">发布课程</a></li>
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
							<li class="spo"><a class="ie6fixpic"
								href="${ctx}/user/index.htm?type=1">报名的课程</a></li>
							<li class="spo"><a class="ie6fixpic"
								href="${ctx}/user/index.htm?type=2">发布的课程</a></li>
							<li class="att"><a class="ie6fixpic"
								href="${ctx}/user/index.htm?type=3">喜欢的课程</a></li>
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
	
	
	
	<div class="main">
		<div class="wrap">
			<!--channel-nav static-->
			<div class="channel-nav">
				<ul class="clearfix">
					<li><a title="全部分类" href="/browse">全部</a></li> <#list categories
					as item>
					<li><a href="${ctx}/course/list.htm?cid=${item.id}"
						title="${item.name}">${item.name}</a></li> </#list>
				</ul>
			</div>
			<div class="filter-box clearfix">
				<div class="rel-key-rec">
					<a  sid="0" <#if sid==0 || sid ==null> class="select" </#if>   href="${ctx}/course/list.htm?sid=0">所有课程(${pager.rowCount})</a>
					<a sid="2" <#if sid==2> class="select" </#if> href="${ctx}/course/list.htm?sid=2">招生中(41)</a> 
					<a sid="1" <#if sid==1> class="select" </#if> href="${ctx}/course/list.htm?sid=1">已完成(54)</a>
				</div>
				<div class="range">
					<select name="deal_sort">
						<option value="${ctx}/course/list.htm">默认排序</option>
						<option value="${ctx}/course/list.htm">最新上线</option>
						<option value="${ctx}/course/list.htm">最多支持人数</option>
					</select>
				</div>
			</div>
			<div class="item-lists">
				<ul class="clearfix">
					<#list pager.records as item>
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure" href="${ctx}/course/getInfo.htm?id=${item.id}" target="_blank">
								<img src="${ctx}/image/out.htm?uri=${item.imgUrl}" />
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="9"
									onclick="like_deal_v2(${item.id}, this)">${item.liked}</a>
							</div>
							<h3>
								<a href="${ctx}/course/getInfo.htm?id=${item.id}" target="_blank">${item.name}</a>
							</h3>
							<div class="item-caption">
								<span class="caption-title"></span> <span
									class="btn-base btn-red-h20 common-sprite"> <span
									class="common-sprite">
									${(item.status == 1)?string('报名中','已结束')}
									</span>
								</span>
							</div>
							<div class="progress-bar">
								<span class="progress bg-red" style="width: 2%;"></span>
							</div>
							<div class="item-rate clearfix">
								<span class="rate1"> <em>${item.scount}人</em><br>
								</span> <span class="rate2"> 
								</span> <span class="rate3"> <em>${item.period}课时</em>
								</span>
							</div>
						</div>
					</li>
					</#list>
				</ul>
				<div class="page tr" id="pageDiv" >
					<#list 1..(pager.pageCount) as pt>
						<a class='common-sprite' pageNow=${pt} >&nbsp;${pt}&nbsp;
					</#list>
					<#if (pager.pageCount>1) >
						<a class='next' href='/browse/id-22-p-2'>下一页</a>
					</#if>
				</div>
			</div>
		</div>	
	</div>
	<!--footer static-->
	
<#include "footer.ftl">
</body>	
	<script>
		$(document).ready(function() {
		
			var pageNow = ${pager.pageNow?default(1)};
			
		
			var sort = wx.trim($("select[name='deal_sort']").val());
			var sid = wx.trim($(".rel-key-rec").children(".select:first").attr("sid"));
			//分页跳转
			$("#pageDiv").children(".common-sprite").each(function(index,item){
				//设置当前页数亮
				var pn = $(this).attr("pageNow");
				if(pageNow == pn){
					$(this).addClass("select common-sprite");
				}
				var now = wx.trim($(this).text());
				var url = "${ctx}/course/list.htm?pageNow="+now+"&sort="+sort+"&sid="+sid;
				$(this).attr("href",url);
			});
			
			$("select[name='deal_sort']").bind('change', function() {
				window.location.href = $(this).val();
			});
		});
		
				/**
		 * 喜欢操作
		 */
		var inlikedealrequest = 0;
		function like_deal_v2(cid, el) {
			  if (inlikedealrequest) return;
			  inlikedealrequest = 1;
			  var dataType = typeof type=="undefined"?"&type=0":type;
			  var ajaxurl = '${ctx}/course/like.htm';
			  $.ajax({ 
			    url: ajaxurl,
			    dataType: "json",
			    data:{id:cid},
			    success: function(ajaxobj) {
			      inlikedealrequest = false;
			      if (ajaxobj.code == 1) {
			        var nums = parseInt($(el).attr('rel'))+1;
			        $(el).html(nums+"");
			        $("#strong_like_count").html(nums);
			        $(el).removeClass("like"); 
			        $(el).addClass("liked");
			        $(".Js-changelike").html('<i class="common-sprite icon-like  ie6fixpic"></i>已喜欢');
			        el.onclick = function() {};
			      } else {
			        $.showErr(ajaxobj.data);
			      }
			    },
			    error:function(ajaxobj)
			    {
			      inlikedealrequest = false;
			    }
			  });
			}
	</script>
	<script type="text/javascript">
	var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
	</script>
	
</html>
