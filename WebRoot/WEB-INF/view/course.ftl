<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title></title>
<meta name="keywords" content="家教 教育 英语">
<meta name="description" content="懒人园是国内最权威的在线学习平台 我们提供更多优质课程 资深教师">
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/detail.css">

<body>
	
	<div class="jiathis_style"
		style="position: absolute; z-index: 1000000000; display: none; top: 50%; left: 50%; overflow: auto;"></div>
	<div class="jiathis_style"
		style="position: absolute; z-index: 1000000000; display: none; overflow: auto;"></div>
	<!--header static-->
	<#include "header.ftl">
	<!--main static-->

	<div class="main deal_bg">
		<div class="wrap clearfix">
			<!--content static-->
			<div class="content fl">
				<!--detail start-->
				<div class="detail-box">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w620"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd detail-con w628">
						<div class="hd">
							<h1 class="word-break">${course.name}</h1>
							<div class="author">
								<span class="author-lay common-sprite inline-block">发起人</span> <span><a
									href="home/id-151182">${course.createdBy}</a></span> <span class="gray">${course.province}${course.area}${course.address}</span>
							</div>
							<div class="tit-bar clearfix">
								<div class="title-nav fl">
									<ul class="clearfix">
										<li class="select"><a
											class="btn-base btn-nav common-sprite"
											href=""> <span
												class="common-sprite">详细介绍</span>
										</a></li>
										<li></li>
										<li></li>
									</ul>
								</div>
								<div class="share">
									<div class="jiathis_style">
										<a class="jiathis_button_tsina" title="分享到新浪微博"><span
											class="jiathis_txt jtico jtico_tsina"></span></a> <a
											class="jiathis_button_qzone" title="分享到QQ空间"><span
											class="jiathis_txt jtico jtico_qzone"></span></a> <a
											class="jiathis_button_weixin" title="分享到微信"><span
											class="jiathis_txt jtico jtico_weixin"></span></a> <a
											class="jiathis_button_tqq" title="分享到腾讯微博"><span
											class="jiathis_txt jtico jtico_tqq"></span></a> <a
											class="jiathis_button_cqq" title="分享到QQ好友"><span
											class="jiathis_txt jtico jtico_cqq"></span></a> <a
											class="jiathis_button_douban" title="分享到豆瓣"><span
											class="jiathis_txt jtico jtico_douban"></span></a> <a
											class="jiathis_button_renren" title="分享到人人网"><span
											class="jiathis_txt jtico jtico_renren"></span></a> <a
											href="http://www.jiathis.com/share"
											class="jiathis jiathis_txt jtico jtico_jiathis"
											target="_blank"></a>
									</div>

								</div>
							</div>
						</div>
						<div class="bd">
							<div class="article">
								<h2></h2>
								<h2>
									<span style="font-weight: normal;">乒乓球教练员陪练员</span>
								</h2>
								<p>
									<span style="font-weight: normal;">
										${course.detail}
									</span>
								</p>
								<div>
									<div>
										<p></p>
									</div>
									<p></p>
								</div>
							</div>

						</div>

						<div class="comment com-pro">
							<div class="flbq">
								<div class="flei">
									分类： <a href="browse/id-18"><span class="red">${course.category}</span></a>
								</div>
								<div class="bqian">
									标签：
									<#list course.tag?split(",") as item>
									 <a href="#" target="_blank"><span
										class="red">${item}</span></a> 
									</#list>
								</div>
								<div class="fr">
									<div class="jiathis_style">
										<a class="jiathis_button_tsina" title="分享到新浪微博"><span
											class="jiathis_txt jtico jtico_tsina"></span></a> <a
											class="jiathis_button_qzone" title="分享到QQ空间"><span
											class="jiathis_txt jtico jtico_qzone"></span></a> <a
											class="jiathis_button_weixin" title="分享到微信"><span
											class="jiathis_txt jtico jtico_weixin"></span></a> <a
											class="jiathis_button_tqq" title="分享到腾讯微博"><span
											class="jiathis_txt jtico jtico_tqq"></span></a> <a
											class="jiathis_button_cqq" title="分享到QQ好友"><span
											class="jiathis_txt jtico jtico_cqq"></span></a> <a
											class="jiathis_button_douban" title="分享到豆瓣"><span
											class="jiathis_txt jtico jtico_douban"></span></a> <a
											class="jiathis_button_renren" title="分享到人人网"><span
											class="jiathis_txt jtico jtico_renren"></span></a> <a
											href="http://www.jiathis.com/share"
											class="jiathis jiathis_txt jtico jtico_jiathis"
											target="_blank"></a>
									</div>

								</div>
							</div>
							<div style="padding: 15px 0 0">
								<ul class="cmtit">
									<li class="pl"><a href="javascript:void(0)"> <span
											id="comment_0_tip">评论( 2 )</span>
									</a></li>
								</ul>
							</div>
							<div class="tjpl">
								<a name="comment"></a>
								<form name="comment_0_form" rel="0" class="comment_form"
									action="deal-save_comment/deal_id-2568">
									<div class="ren">
										<a href="javascript:void(0);"><img
											src="images/noavatar_middle.gif" width="80" height="80"></a>
									</div>
									<div class="pln_r">
										<div class="kuang">
											<textarea name="content">发表评论</textarea>
											<input type="hidden" name="ajax" value="1">
											<ul class="bq">
												<li class="fb send_btn"><input name="" value="添加评论"
													type="button" class="btn-red2"
													style="background: #ED5E58; -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px;"
													onclick=""></li>
											</ul>
										</div>
									</div>
								</form>
							</div>
							<div class="deal_comment_list" id="deal_comment_list_0">
								<div class="comment_item">
									<div class="comment_user_avatar">
										<a href="home/id-153535"
											style="text-align: center; display: inline-block;"><img
											src="./detail_files/noavatar_small.gif"></a>
									</div>
									<div class="blank5"></div>
								</div>
								<div class="comment_item">
									<div class="comment_user_avatar">
										<a href="home/id-134523"
											style="text-align: center; display: inline-block;"><img
											src="./detail_files/noavatar_small.gif"></a>
									</div>
									<div class="comment_content">
										<a href="home/id-134523" class="linkgreen">余小鱼:</a>&nbsp; <span
											style="word-break: break-all;">我也有个骑行梦，计划今年四月中旬和老同学一起去，但不知道能不能请得了家，不知道父母亲人会不会同意，希望能克服重重阻力！支持你！
											&nbsp;&nbsp;</span> <span class="pass_time"> 6天前 </span>
										<div class="clr"></div>
										<div class="comment_op">
											<a href="javascript:void(0);" class="linkgreen replycomment"
												rel="4422">回复</a>
										</div>
										<div class="blank1"></div>
										<div class="reply_box" id="reply_box_4422">
											<div class="blank"></div>
											<form name="comment__form" rel="0" class="comment_form"
												action="deal-save_comment/deal_id-2568-pid-4422">
												<div class="reply_content">
													<textarea name="content">回复 余小鱼:</textarea>
													<input type="hidden" name="ajax" value="1"> <input
														type="hidden" name="comment_pid" value="4422">
												</div>
												<div class="blank"></div>
												<!--<span class="syn_weibo">
				 <input type="checkbox" name="syn_weibo" value="1" />
				<span>同时发布至我的微博 </span>
			</span>-->
												<div>
													<div class="ui-button send_btn" rel="green">
														<div>
															<span>发送</span>
														</div>
													</div>
												</div>
												<div class="blank"></div>

											</form>
										</div>
									</div>

									<div class="blank5"></div>
								</div>
							</div>


							<!--循环-->
							<!--//循环-->
						</div>

					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w620"></div>
						<div class="radius-fr common-sprite"></div>
					</div>

				</div>
				<!--detail end-->
			</div>
			<!--content end-->

			<!--side static-->
			<div class="sidebar fr">
				<!-- 预热项目 -->
				<!-- 普通项目 -->
				<!--btn-inte  static-->
				<!--btn-end  static-->
				<!--item detail  static-->
				<div class="block-list">
					<div class="radius-hd">
						<div class="radius-hl common-sprite"></div>
						<div class="radius-hc w300"></div>
						<div class="radius-hr common-sprite"></div>
					</div>
					<div class="radius-bd item-detail w308">
						<div class="tag bg-red">
							火热报名中 <span class="triangle"></span>
						</div>
						<h2>目前累计报名人数</h2>
						<p class="item-sum">
							<span>1</span><span>0</span>
						</p>
						<div class="ratio-box">

							<div class="ratio-bar common-sprite">
								<span class="ratio-red common-sprite" style="width: 1%"></span>

								<i class="common-sprite ie6fixpic"></i>
							</div>

							<span class="ratio-val ie6fixpic">1% </span>
						</div>
						<div class="detail-rate">
							<ul class="clearfix">
								<li><strong> <a id="signup" dataid="${item.id}" ><font color="red">立刻<br>报名
										</font></a>
								</strong></li>
								<li><strong></strong><span></span></li>
								<li><strong id="strong_like_count">14</strong><span>喜欢</span></li>
							</ul>
						</div>
					</div>
					<div class="radius-ft">
						<div class="radius-fl common-sprite"></div>
						<div class="radius-fc w300"></div>
						<div class="radius-fr common-sprite"></div>
					</div>
				</div>
				<!--btn-end  static-->

				<!--support list static-->
				<a name="support"></a>
				<!--support list end-->

				<!--support list static-->
				<a name="support"></a>
				<!--support list end-->

				<!--support list static-->
				<a name="support"></a>
				<!--support list end-->
			</div>
			<!--side end-->
		</div>
	</div>
	<!--main end-->
	<!--footer static-->
	<#include "footer.ftl">
	
	<script>
		$(function(){
			$("#signup").click(function(){
				var dataid = $(this).attr("dataid");
				var uid = wx.cookie("uid");
				if(uid == '' || undefined== uid){
					wx.alert("您还没有登录哦");
				}else{
					$.ajax({
						url:"${ctx}/user/checkInfo.htm",
						type:"post",
						data:{uid:uid,cid:dataid},
						dataType:"json",
						success:function(obj){
							if(obj.code ==1){
								wx.alert("报名成功，请尽快保持联系方式畅通，我们会尽快联系您");
							}else{
								wx.alert("请到个人设置中完善您的联系方式");
							}
						}
					});
				}
			});
		});
	</script>
	<script type="text/javascript">
	var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe2b6fa1ff48b85f8c94d75e7a60f6e5f' type='text/javascript'%3E%3C/script%3E"));
	</script>
	
</body>
</html>