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
					<li class="select"  ><a href="${ctx}/index.html">首页 </a></li>
					<li ><a href="${ctx}/course/list.htm">课程</a></li>
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
					</span> <span id="uanme" class="user-name word-break ie6fixpic">游客</span>
					</a>
				</div>
				<div class="menu-bd JS-myinfo">
					<ul class="clearfix">
							<li class="spo"><a class="ie6fixpic"
								href="/home-build_deal/id-154415">发起的项目</a></li>
							<li class="att"><a class="ie6fixpic"
								href="/home-focus/id-154415">喜欢的项目</a></li>
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