<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值</title>
<link href="${ctx}/css/chz.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.cookie.js" type="text/javascript"></script>
</head>
<body class="czbody">
<div class="czhead">
  <div class="iBody">
    <h1 class="logo"><a href="http://mm.yue.ifeng.com"><img src="${ctx}/images/cz_logo.png" /></a></h1>
    <span class="back"><a href="http://mm.yue.ifeng.com">返回秀场首页</a></span>
  </div>
</div>
<div class="cziBody">
<form name="user">
  <div class="cz-left">
    <h4 class="tit4">用户信息</h4>
    <div class="conts">
      <p><strong id="hello" class="f15">${userkey}</strong><br />
<a href="javascript:removeCookie()">[退出]</a></p>
<div class="jilulist">
    <p class="f15">最近充值记录：</p>
      <table width="235" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="79">充值时间</td>
    <td width="79">订单号</td>
    <td width="51">金额</td>
    <td width="26">状态</td>
  </tr>
</table>
   <div class="tb">
   <table width="238" border="0" cellpadding="0" cellspacing="0">
   <c:forEach items="${orders }" var="order">
   		<tr>
   			<td><fmt:formatDate value="${order.createdAt }" pattern="yyyyMMdd hh:MM:ss" /> </td>
   			<td>${order.id }</td>
   			<td>${order.price }</td>
   			<td>${order.state == 2 ? '成功':'失败' }</td>
   		</tr>
   </c:forEach>
 	
</table>
</div>
</div>
    </div>
    <h4 class="tit4">投诉与建议</h4>
    <div class="conts" style="height:183px;">
      <p><img src="${ctx }/images/telephone.png" /> 4008109890 </p>
      <p><img src="${ctx }/images/mail.png" /> 投诉与建议 </p>
      <p><span class="gray">工作时间：</span>08:00-23:00 </p>
    </div>
  </div>
</form>
  <div class="cz-right">
    <h4 class="tit4">用户充值</h4>
    <div class="conts2">
    <form name="priceform">
      <p class="pl-20">账户余额：<strong class="red f15">0</strong></p>
      <p class="pl-20">充值账号：<span id="un">${userkey}</span> </p>
       <p class="pl-20">豆数量：
       <span>${price*100 }</span>
      </p >
      <p class="pl-20">支付金额：
       <span id="price">${price }</span>
      </p>
      </form>
      <p class="line"></p>
      <div class="chongzhi-bar">
	      <strong class="pr-30">充值方式：</strong>
	      <span name="#cz5" class="cur">网银充值</span>
	      <span name="#cz6">财付通</span>
	      <span name="#cz1" >支付宝充值</span>
	      <span name="#cz2">电话卡充值</span>
	      <span name="#cz3">储蓄卡充值</span>
	      <span name="#cz4">信用卡充值</span>
      </div>
      
   <div class="chongzhicont" id="cz5">
   	<form action="<%=request.getContextPath() %>/charge/chargeByIfeng.htm" method="post">
	  	 <input type="hidden" name="chargeType" value="5"/>
     	<input  name="transAmt" type="hidden" value="${price }"/>
     	 <input name="body" type="hidden" value="body"/>
      	<input name="show_url" type="hidden" value="show_url"/>
      	<input name="subject" type="hidden" value="${source }"/>
       	<input id="bill_no" name="bill_no" type="hidden" value="${orderid}"/>
       	 <input id="login_name" name="login_name" type="hidden" value="${userkey}"/>
       <p><label class="lab"><input name="payment_method" type="radio" value="14" /><img src="${ctx}/images/99bill.jpg" width="90" height="27" /></label><label class="lab"><input name="payment_method" type="radio" value="1" /><img src="${ctx}/images/yibao.jpg" width="90" height="27"/></label><label class="lab"><input name="payment_method" type="radio" value="21" /><img src="${ctx}/images/icbc.jpg" width="90" height="27"/></label><br />
			<label class="lab"><input name="payment_method" type="radio" value="22" /><img src="${ctx}/images/cmb.jpg" width="90" height="27"/></label><label class="lab"><input name="payment_method" type="radio" value="23" /><img src="${ctx}/images/abc.jpg" width="90" height="27"/></label><label class="lab"><input name="payment_method" type="radio" value="29" /><img src="${ctx}/images/bocom.jpg" width="90" height="27"/></label><br />
			<label class="lab"><input name="payment_method" type="radio" value="24" /><img src="${ctx}/images/ccb.jpg"width="90" height="27" /></label><label class="lab"><input name="payment_method" type="radio" value="28" /><img src="${ctx}/images/boc.jpg"width="90" height="27" /></label><label class="lab"><input name="payment_method" type="radio" value="30" /><img src="${ctx}/images/cmbc.jpg" width="90" height="27" /></label><br />
			<label class="lab"><input name="payment_method" type="radio" value="31" /><img src="${ctx}/images/cib.jpg" width="90" height="27"/></label>
		</p>
      <p class="butmar1">
        <input name="" type="submit" class="but1" value="提交" />
      </p>
      </form>
   </div>
      
     <div class="chongzhicont" id="cz6">
     <form action="<%=request.getContextPath() %>/charge/chargeByIfeng.htm" method="post">
	  	 <input type="hidden" name="chargeType" value="6"/>
     	<input  name="transAmt" type="hidden" value="${price }"/>
     	 <input name="body" type="hidden" value="body"/>
      	<input name="show_url" type="hidden" value="show_url"/>
      	<input name="subject" type="hidden" value="${source }"/>
       	<input id="bill_no" name="bill_no" type="hidden" value="${orderid}"/>
       	 <input id="login_name" name="login_name" type="hidden" value="${userkey}"/>
       <p><label class="lab"><input name="payment_method" type="radio" value="41" /><img src="${ctx}/images/cft.jpg" width="90" height="27" /></label></p>
      <p class="butmar1">
        <input name="" type="submit" class="but1" value="提交" />
      </p>
      </form>
     </div>
      
      
	 <div class="chongzhicont" id="cz1">
	  <form name="chongzhi5" action="<%=request.getContextPath() %>/charge/chargeByIfeng.htm" method="post">
	  	 <input type="hidden" name="chargeType" value="0"/>
     	<input id="transAmt3" name="transAmt" type="hidden" value="${price }"/>
     	<input id="" name="" type="hidden" value=""/>
     	 <input name="body" type="hidden" value="body"/>
      	<input name="show_url" type="hidden" value="show_url"/>
      	<input name="payment_method" type="hidden" value="13"/>
      	<input name="subject" type="hidden" value="${source }"/>
       	<input id="bill_no" name="bill_no" type="hidden" value="${orderid}"/>
       	 <input id="login_name" name="login_name" type="hidden" value="${userkey}"/>
       <p><label class="lab"><input name="" type="radio" value="" /><img src="${ctx}/images/log-logo5.jpg" /></label></p>
      <p class="butmar1">
        <input name="" type="submit" class="but1" value="提交" />
      </p>
      </form>
     </div>
	 
	 <div class="chongzhicont" id="cz2">
	 <form name="chongzhi4" action="<%=request.getContextPath() %>/charge/chargeByIfeng.htm" method="post">
     <input type="hidden" name="chargeType" value="4"/>
      <input id="transAmt2" name="transAmt" type="hidden" value="${price }"/>
      <input name="subject" type="hidden" value="${source }"/>
       <input id="bill_no1" name="bill_no" type="hidden" value="${orderid}"/>
        <input id="login_name1" name="login_name" type="hidden" value="${userkey}"/>
       <p><label class="lab"><input name="payment_method" type="radio" value="36" /><img src="${ctx}/images/log-logo1.jpg" /></label><label class="lab"><input name="payment_method" type="radio" value="37" /><img src="${ctx}/images/log-logo2.jpg" /></label><label class="lab"><input name="payment_method" type="radio" value="" /><img src="${ctx}/images/log-logo3.jpg" /></label></p>
       <p>
		<label class="lab"><input name="payment_method" type="radio" value="27" /><img src="${ctx}/images/log-logo4.jpg" /></label></p>
      <p class="butmar1">
        <input name="" type="submit" class="but1" value="提交" />
      </p>
	</form>
   </div>
	 
	 
      <div class="chongzhicont" id="cz3">
        <p class="banklist"><label class="red">储蓄卡支持银行：</label><span>工商银行、农业银行、建设银行、民生银行、兴业银行、深发银行、中信银行<br />
光大银行<font class="red">（温馨提示：暂不支持 招商银行）</font></span></p>

 
 
     <form name="chongzhi1"  action="<%=request.getContextPath() %>/charge/chargeByGoodPay.htm" method="post">
     	<input type="hidden" name="chargeType" value="2"/>
     	<span id="fail"></span>
     	<input id="typeId" name="typeId" type="hidden" value="1"/>
     	<input id="accountId" name="accountId" type="hidden" value="${userkey}"/>
     	<input id="userkey" name="userkey" type="hidden" value="${userkey}"/>
     	<input id="orderid" name="orderid" type="hidden" value="${orderid}"/>
     	<input id="transAmt" name="transAmt" type="hidden" value="${price }"/>
		
        <p><label>卡　号：</label>
         <input name="cardNo" type="text" class="input1 wit1" id="textfield" size="21" />
       </p>
      <p><label>姓　名：</label>
        <input name="usrName" type="text" class="input1 wit1" id="textfield" size="21" />
      </p>
       <p><label>手机号：</label>
         <input name="mobile" type="text" class="input1 wit1" id="textfield" value="银行预留手机号" size="21" />
        <input name="auth1" name="input"  type="button" class="but3" value="获取验证码" />
		<span id="unauth1"></span>
      </p>
      <p><label>验证码：</label>
        <input name="authCode" type="text"  class="input1 wit2" id="textfield2" size="8" />
      </p>
      <p class="butmar1">
        <input type="submit" class="but1" value="提交" />
      </p>
</form>
   </div>
     <div class="chongzhicont" id="cz4">
  <p class="banklist"><label class="red">信用卡支持银行：</label><span>工商银行、农业银行、中国银行、建设银行、交通银行、深发银行、招商银行<br />
兴业银行、民生银行、广发银行、中信银行、邮储银行、光大银行、浦发银行<br />
上海银行、华夏银行</span></p>
	
	 <form name="chongzhi2" action="<%=request.getContextPath() %>/charge/chargeByGoodPay.htm" method="post">
     	<input type="hidden" name="chargeType" value="3"/>
     	<input id="accountId1" name="accountId" type="hidden" value="${userkey}"/>
     	<input id="userkey1" name="userkey" type="hidden" value="${userkey}"/>
     	<input id="orderid1" name="orderid" type="hidden" value="${orderid}"/>
     	<input id="transAmt1" name="transAmt" type="hidden" value="${price }"/>
     <span name="fail2"></span>
     <input name="typeId" type="hidden" value="2"/>
	
	
       <p><label>卡　号：</label>
         <input name="cardNo" type="text" class="input1 wit1" id="textfield" size="21" />
       </p>
      <p><label>姓　名：</label>
        <input name="usrName" type="text" class="input1 wit1" id="textfield" size="21" />
      </p>
      <p><label>CVV码：</label>
        <input name="cvvCode" type="text" class="input1 wit1" id="textfield" size="21" /> <span class="gray">（卡背面3位数字）</span>
      </p>
      <p><label>有效期：</label>
        <input name="period" type="text" class="input1 wit1" id="textfield" size="21" /> <span class="gray">（例如：1404表示2014年4月）</span>
      </p>
       <p><label>手机号：</label>
         <input name="mobile" type="text" class="input1 wit1" id="textfield" value="银行预留手机号" size="21" />
        <input id="auth2" name="input" type="button" class="but3" value="获取验证码" />
				<span id="unauth2"></span>
      </p>
      <p><label>验证码：</label>
        <input name="authCode" type="text"  class="input1 wit2" id="textfield2" size="8" />
      </p>
      <p class="butmar1">
        <input name="" type="submit" class="but1" value="提交" />
      </p>
		</form>
     </div>
     
    
    </div>
  </div>
</div>
	<div class="footer">
		<span class="logo"><a href="http://mm.yue.ifeng.com"><img
				src="${ctx }/images/footlogo.png" /></a></span>
		<p>
			<a href="http://www.ifeng.com/corp/about/">关于凤凰新媒体</a> |<a
				href="http://mm.yue.ifeng.com
"> 秀场首页</a> | <a
				href="http://yue.ifeng.com">音乐首页</a> | <span style="color: #000">客服电话:4008109890
				| 客服邮箱: wireless@ifeng.com</span><br /> [<a href="images/icp.jpg">京ICP证030609号</a>]
			[<a href="images/wlwhjy.jpg">文网文[2010]136号</a>]<br /> 凤凰新媒体 版权所有<br />
			Copyright © 2013 Phoenix New Media Limited All Rights Reserved.
		</p>
	</div>
 <script>
    function resetTabs(){
        $(".chongzhicont").hide(); //Hide all content
        $(".chongzhi-bar span").attr("class",""); //Reset id's      
    }

    var myUrl = window.location.href; //get URL
    var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For localhost/tabs.html#tab2, myUrlTab = #tab2     
    var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab

    (function(){
        $(".chongzhicont").hide(); // Initially hide all content
        $(".chongzhi-bar span:first").attr("class","cur"); // Activate first tab
        $(".chongzhicont:first").fadeIn(); // Show first tab content
        
        $(".chongzhi-bar span").on("click",function(e) {
            e.preventDefault();
            if ($(this).attr("class") == "cur"){ //detection for current tab
             return       
            }
            else{             
            resetTabs();
            $(this).attr("class","cur"); // Activate this
            $($(this).attr('name')).fadeIn(); // Show content for current tab
            }
        });

        for (i = 1; i <= $(".chongzhi-bar span").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("class","cur"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content        
          }
        }
    })()
  </script> 
 
<script language="javascript">
	var uname="";
	var chargecount="";
	var orderid="";
	var token="";
	var res = "";
	$(function(){
	
		$("#auth1").click(function(){
			auth();
		});
		
		$("#auth2").click(function(){
			auth2();
		});
		
		
		
	});
		
	//产生随机数
	function rand(){
		res="";
		var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','y','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
		for(var i=0;i<8;i++){
			var id=Math.ceil(Math.random()*61);
			res+=chars[id];
		}
		return res;
	}
	 function auth(){
		rand();
		$.ajax({
			async:false,
			type:'post',
			dataType:'text',
			url:'../../../charge/getCode.htm?',
			data:'channelId=7&accountId='+uname+'&categoryId=01&mobile='+document.chongzhi1.mobile.value+'&randnum='+res,
			success:function(data){
			}
		});
		getVerifyCodeCountdown(59,1);
	}
	var getVerifyCodeTimeout;
	//获取验证码倒计时
	function getVerifyCodeCountdown(a,b){
		if(a>0){
			a=a-1;
			if(b==0){
				$("#auth1").css("display","none");
				$("#unauth1").css("display","").text(a+"秒后重新获取");
			}else{
				$("#auth1").css("display","none");
				$("#unauth1").css("display","").text(a+"秒后重新获取");
			}
				getVerifyCodeTimeout=setTimeout("getVerifyCodeCountdown("+a+","+b+")",1000);
		}else{
				clearTimeout(getVerifyCodeTimeout);
				if(b==0){
					$("#auth1").css("display","");
					$("#unauth1").css("display","none");
				}else{
					$("#auth1").css("display","");
					$("#unauth1").css("display","none");
				}
		}
	}
		
		//获取验证码倒计时
	function getVerifyCodeCountdown2(a,b){
		if(a>0){
			a=a-1;
			if(b==0){
				$("#auth2").css("display","none");
				$("#unauth2").css("display","").text(a+"秒后重新获取");
			}else{
				$("#auth2").css("display","none");
				$("#unauth2").css("display","").text(a+"秒后重新获取");
			}
			getVerifyCodeTimeout=setTimeout("getVerifyCodeCountdown2("+a+","+b+")",1000);
		}else{
			clearTimeout(getVerifyCodeTimeout);
			if(b==0){
				$("#auth2").css("display","");
				$("#unauth2").css("display","none");
			}else{
				$("#auth2").css("display","");
				$("#unauth2").css("display","none");
			}
		}
    }
	function auth2(){
		rand();
		$.ajax({
			async:false,
			type:'post',
			dataType:'text',
			url:'../../../charge/getCode.htm?',
			data:'channelId=7&accountId='+uname+'&categoryId=01&mobile='+document.chongzhi2.mobile.value+'&randnum='+res,
			success:function(data){
			}
		});
		getVerifyCodeCountdown2(59,1);
	}
	function clear(){
		document.chongzhi1.mobile.value="";
	}
	function removeCookie(){
		$.cookie('cookie','',{expires: -1, path: '/'});
		$.cookie('sid','',{ expires: -1,path: '/',domain:'.ifeng.com' }); 
		document.location.reload();
		$.ajax({
			type:'post',
			dataType:'text',
			url:'../../../log/logout.htm',
			success:function(data){
			}
		});
	}
</script>
<script>
    var sta_collection_time = new Date().getTime();
  </script>
<script src="http://y3.ifengimg.com/sta_collection.3.3.10.min.js" id="sta_collection_new"></script>
</body>
</html>
