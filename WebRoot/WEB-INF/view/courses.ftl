<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<!--public js&css start-->
<!--public js&css end -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/list.css">
</head>

<body>
	<!--header static-->
	<#include "header.ftl">
	<script>
		$(document).ready(function() {
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
					<a class="select" href="${ctx}/course/list.htm?sid=0">所有课程(95)</a>
					<a href="${ctx}/course/list.htm?sid=2">众筹中(41)</a> <a
						href="${ctx}/course/list.htm?sid=1">已成功(54)</a>
				</div>
				<div class="range">
					<select name="deal_sort">
						<option value="/browse/id-22-s-df">默认排序</option>
						<option value="/browse/id-22-s-sb">最新上线</option>
						<option value="/browse/id-22-s-si_c">最多支持人数</option>
					</select>
				</div>
			</div>
			<div class="item-lists">
				<ul class="clearfix">
					<#list courses as item>
					<li>
						<!--Deal Card Module-->
						<div class="list-item">
							<a class="item-figure" href="${ctx}/course/getInfo.htm?id=${item.id}" target="_blank">
								<img
								src="${ctx}/images/${item.imgUrl}"
								alt="${item.name}" title="${item.name}" />
							</a>
							<div class="item-upvote">
								<a class="icons " href="javascript:void(0);" rel="9"
									onclick="like_deal_v2(${item.id}, this)">${item.liked}</a>
							</div>
							<h3>
								<a href="/deal-show/id-16844" target="_blank">${item.name}</a>
							</h3>
							<div class="item-caption">
								<span class="caption-title">目标：<em>20天</em> <em><i
										class="font-yen">&yen;</i>30000</em></span> <span
									class="btn-base btn-red-h20 common-sprite"> <span
									class="common-sprite">众筹中</span>
								</span>
							</div>
							<div class="progress-bar">
								<span class="progress bg-red" style="width: 2%;"></span>
							</div>
							<div class="item-rate clearfix">
								<span class="rate1"> <em>2%</em><br>已达
								</span> <span class="rate2"> <em>￥509</em><br>已筹资
								</span> <span class="rate3"> <em>19天</em><br>剩余时间
								</span>
							</div>
						</div>
					</li>
					</#list>
				</ul>
				<div class="page tr">
					&nbsp;<A class='select common-sprite'>1</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-2'>&nbsp;2&nbsp;</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-3'>&nbsp;3&nbsp;</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-4'>&nbsp;4&nbsp;</a>&nbsp;<a
						class='common-sprite' href='/browse/id-22-p-5'>&nbsp;5&nbsp;</a> <a
						class='next' href='/browse/id-22-p-2'>下一页</a>
				</div>
			</div>
		</div>
	</div>
	<!--footer static-->

	<#include "footer.ftl">
</html>
