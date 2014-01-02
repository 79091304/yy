<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>凤凰音乐美女秀场</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/index_new.js" type="text/javascript"></script>
</head>

<body>
<div id="blackbg"></div>
<div style="background:#fff">
  <div class="iBody">
    <h1 class="logo"><img src="images/logo.png" /></h1>
    <p class="headright"><span id="ud"><a href="#" onClick="openme()" >注册</a> | <a href="#" onClick="openme()" >登录</a> </span><a id="favorites" href="#">加入收藏</a> <a href="http://yue.ifeng.com">凤凰音乐首页</a></p>
  </div>
  <script type="text/javascript"> 

</script>
  <div id="windowbg">
    <div class="window">
      <div id="divlogin" class="tit5"><span name="#tab1">用户登录</span><span class="cur2"  name="#tab2">用户注册</span><em class="close" onClick="closeme()"></em></div>
      <div class="from" id="tab1">
<p id="loginfail"></p>
<form name="form1">
        <p>
          <label>用户名：</label>
          <input id="username"  type="text" class="input1 input2" />
        </p>
        <p>
          <label>密码：</label>
          <input  id="pwd" type="password" class="input1 input2" />
          <span class="jpicon"></span></p>
        <p>
          <label>验证码：</label>
          <input id="auth" type="text" class="input1 input3" />
          <span><img id="chkcode"
										src="https://id.ifeng.com/index.php/public/authcode" /></span></p>
        <p class="red msg2">
          <label> </label>
          <a
											href="javascript:ChangeValidCode('chkcode');" class="red">看不清，换一个</a></p>
        <p class="butmar2">
          <input type="button" value="登录" onclick="login()" class="but1 " />
          
	</form>
      </div>
      <div class="from from2" id="tab2">
	<p id="regfail"></p>
	<form name="form2">
	<span id="fail"></span>
        <p>
          <label>电子邮箱：</label>
          <input id="email" name="email"  type="text" class="input1 input2" />
        </p>
        <p>
          <label>密码：</label>
          <input  id="password1" type="password" name="pwd1" class="input1 input2" />
          <span class="jpicon"></span></p>
        <p>
          <label>确认密码：</label>
          <input  id="passoword2" type="password" name="pwd2"  class="input1 input2" />
          <span class="jpicon"></span><span id="tishi" class="msg4">
		</span>										
	  </p>
        <p>
         <label>验证码：</label> <input id="auth" name="auth" type="text"
										class="input1 input3" /> 
		<span><img id="chkcode2" src="https://id.ifeng.com/index.php/public/authcode"
										title="kanbuqing" />
				</img></span>
									<p class="red msg2">
										<label> </label> <a
											href="javascript:ChangeValidCode('chkcode2');" class="red">看不清，换一个</a>
	  </p>
        <p class="butmar2">
          <input type="button" value="注册" class="but1 "  onclick="submitReg()" />
        </p>
	</form>
      </div>
    </div>
  </div>
  <script>
function ChangeValidCode(id){
    	document.getElementById(id).src="https://id.ifeng.com/index.php/public/authcode?time="+new Date().getTime();
    }
    function resetTabs(){
        $(".from").hide(); //Hide all content
        $(".tit5 span").attr("class",""); //Reset id's      
    }

    var myUrl = window.location.href; //get URL
    var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For localhost/tabs.html#tab2, myUrlTab = #tab2     
    var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab

    (function(){
        $(".from").hide(); // Initially hide all content
        $(".tit5 span:first").attr("class","cur1"); 
        $(".from:first").fadeIn(); // Show first tab content
        
        $(".tit5 span").on("click",function(e) {
            e.preventDefault();
            if ($(this).attr("class") == "cur1"){ //detection for current tab
             return       
            }
            else{             
            resetTabs();
            $(this).attr("class","cur1"); // Activate this
            $($(this).attr('name')).fadeIn(); // Show content for current tab
            }
        });

        for (i = 1; i <= $(".tit5 span").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("class","cur1"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content        
          }
        }
    })()
  </script> 
</div>
<div class="navi">
  <p class="iBody"><a href="#" class="cur">主编精选</a><a href="liu_html/main.html#_yue_liu">六间房</a></p>
</div>
<div class="imgnews">
  <div id="list">
    <ul>
   	   <li style="z-index:5; " class=""> <a href="http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http%3A%2F%2Fv.6.cn%2F1820%3Fcoop%3D1023"><img src="images/05.jpg"/></a>
        <div style="opacity: 0.9; "></div>
      </li>
      <li style="z-index:3; " class=""> <a href="http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http%3A%2F%2Fv.6.cn%2F875555%3Fcoop%3D1023">  <img src="images/03.jpg"/></a>
        <div style="opacity: 0.9; "></div>
      </li>
      <li style="z-index:4; " class=""> <a href="http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http%3A%2F%2Fv.6.cn%2F66566%3Fcoop%3D1023"><img src="images/04.jpg"/></a>
        <div style="opacity: 0.9; "></div>
      </li>
      <li style=" z-index:2; " class="">  <a href="http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http%3A%2F%2Fv.6.cn%2F198251%3Fcoop%3D1023"><img src="images/01.jpg"/></a>
        <div style="opacity: 0.9; "></div>
      </li>
      <li style="z-index:1; " class="hove"><a href="http://mm.yue.ifeng.com/liu_html/main.html?bgurl=http%3A%2F%2Fv.6.cn%2F7778%3Fcoop%3D1023"> <img src="images/02.jpg"/></a>
        <div style="opacity:0; "></div>
      </li>
      
      
    </ul>
   <span onclick="javascript:;" class="prev"></span> <span onclick="javascript:;" class="next"></span> </div>
</div>
<div class="iBody">
  <div class="conts">
    <h3>主播在线<strong class="shaux"><a href="#"></a></strong></h3>
    <ul class="zhub">
     <jsp:include page="liu_html/tui_show.html" />
    </ul>
  </div>
  <div class="conts">
    <h3><span>6.CN</span> 美女秀场<strong class="shaux"><a href="#"></a></strong></h3>
    <div class="cont1">
      <ul class="ljf">
      	<jsp:include page="liu_html/rand_show.html" />
      
      </ul>
      <div class="toplist">
        <h4 class="menu">主播排行榜<span class="menutab"><a href="#" class="cur">日榜</a> <a href="#">周榜</a> <a href="#">月榜</a> <a href="#">超榜</a></span></h4>
        <ul id="d" style="display:block">
         	<jsp:include page="liu_html/rank_day.html" />
        </ul>
        <ul>
         <jsp:include page="liu_html/rank_week.html" />
        </ul>
        <ul>
         <jsp:include page="liu_html/rank_month.html" />
        </ul>
        <ul>
          <jsp:include page="liu_html/rank_super.html" />
        </ul>
      </div>
    <ul class="ljf ljf2" style="width:1000px;">
    <h4>编辑推荐</h4>
       <jsp:include page="liu_html/rand_show_back.html" />
      </ul>

    </div>
  </div>
 
 
 
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".textbg2").hide();
	$(".imgplay").hide();
	
	$("ul.bofang li").hover(function(){
		$(this).find(".textbg2").stop().fadeTo(300,0.5)
		$(this).find(".imgplay").stop().fadeTo(300,1)
	},function(){
		$(this).find(".textbg2").stop().fadeTo(100,0)
		$(this).find(".imgplay").stop().fadeTo(100,0)
	});

});
</script> 
<script type="text/javascript">
   function cur(ele){ 
     $(ele).addClass("cur").siblings().removeClass("cur");
   }
   
   function tab(id_tab,tag_tab,id_con,tag_con,act){
if(!act){ act="click"};
if(act=="click"){
$(id_tab).find(tag_tab).each(function(i){
$(id_tab).find(tag_tab).eq(i).click(
function(){
cur(this);
$(id_con).find(tag_con).eq(i).show().siblings(tag_con).hide();
})           
})  
     }
  if(act=="mouseover"){
$(id_tab).find(tag_tab).each(function(i){
$(id_tab).find(tag_tab).eq(i).mouseover(
function(){
cur(this);
$(id_con).find(tag_con).eq(i).show().siblings(tag_con).hide();
})           
})  
     } 
   }
  tab(".menutab","a",".toplist","ul","mouseover");
  
 </script> 
<script>$(document).ready(function() {
            $list_li = $(".toplist ul li");
            $list_li.eq(0).addClass("cur");
            $list_li.mouseover(function(){
                $(this).addClass("cur").siblings().removeClass("cur");
           });
        });</script> 
<script type="text/javascript">
window.onload = function(){
	var oBut = document.getElementById('list');
	var oTop = document.getElementById('top');
	var oTli = oTop.getElementsByTagName('li');
	var aLi = oBut.getElementsByTagName('li');
	var aA = oBut.getElementsByTagName('span');
	var aP = getClass(oBut, 'b_tit');
	var oSmall = getClass(oTop, 'small')[0];
	var i = iNow = 0;
	var timer = null;
	var aSort = [];
	var aPosition = [
					{width:560,height:330,top:0,left:250,zIndex:10},
					{width:350,height:250,top:45,left:80,zIndex:8},
					{width:350,height:250,top:45,left:630,zIndex:8},
					{width:240,height:190,top:70,left:-10,zIndex:6},
					{width:240,height:190,top:70,left:830,zIndex:6}
		]
	for(i=0;i<oTli.length;i++){
		oTli[i].index = i;
		myAddEvent(oTli[i], 'mouseover', function(){
			startMove(this, {opacity:100});
		})
		myAddEvent(oTli[i], 'mouseout', function(){
			if(this.className != 'hove')startMove(this, {opacity:40});
		})
		myAddEvent(oTli[i], 'click', function(){
			iNow = this.index;
			tab();
		})
	}
	for(i=0;i<aLi.length;i++){
		aLi[i].index = i;
		aLi[i].style.width = aPosition[i].width +'px';
		aLi[i].style.height = aPosition[i].height +'px';
		aLi[i].style.top = aPosition[i].top +'px';
		aLi[i].style.left = aPosition[i].left +'px';
		aLi[i].style.zIndex = aPosition[i].zIndex;
		aSort[i] = aPosition[i];
		myAddEvent(aLi[i], 'mouseover', function(){
			var oDiv = this.getElementsByTagName('div')[0];
			startMove(oDiv, {opacity:0});
			if(this.style.width == '344px'){
				startMove(aP[this.index], {bottom:0});
			}
		});
		myAddEvent(aLi[i], 'mouseout', function(){
			if(this.style.width == '344px'){
				startMove(aP[this.index], {bottom:-120});
			}else{
				var oDiv = this.getElementsByTagName('div')[0];
				startMove(oDiv, {opacity:75});
			}
		});
		myAddEvent(aLi[i], 'click', function(){
			var iSort = this.index;
			iNow = this.index;
			Sort();
			for(i=0;i<iSort;i++){
				aSort.unshift(aSort.pop());
			}
			sMove();
		});
	}
	myAddEvent(aA[0], 'click', function(){
		aSort.unshift(aSort.pop());
		sMove();
		setInter();
	});
	myAddEvent(aA[1], 'click', function(){
		aSort.push(aSort.shift());
		sMove();
		iNow--;
		if(iNow<0)iNow = aLi.length - 1;
		tab();
	});
	oSmall.onmouseover = oBut.onmouseover = function(){
		clearInterval(timer);
	};
	oSmall.onmouseout = oBut.onmouseout = function(){
		clearInterval(timer);
		timer = setInterval(setInter,2500);
	};
	timer = setInterval(setInter,2500);
	function setInter(){
		iNow++;
		if(iNow>aLi.length-1)iNow = 0;
		tab();
	}
	function tab(){
		for(i=0;i<oTli.length;i++)oTli[i].className = '',startMove(oTli[i], {opacity:40});
		oTli[iNow].className = 'hove';
		startMove(oTli[iNow], {opacity:100})
		var iSort = iNow;
		Sort();
		for(i=0;i<iSort;i++){
			aSort.unshift(aSort.pop());
		}
		sMove();
	}
	function Sort(){
		for(i=0;i<aLi.length;i++){
			aSort[i] = aPosition[i];
		}
	}
	function sMove(){
		for(i=0;i<aLi.length;i++){
			var oDiv = aLi[i].getElementsByTagName('div')[0];
			startMove(oDiv, {opacity:75});
			startMove(aLi[i], aSort[i], function(){one();});
			aLi[i].className = '';
		}
		aLi[iNow].className = 'hove';
	}
	function one(){
		for(i=0;i<aLi.length;i++){
			if(aLi[i].style.width == '344px'){
				var oDiv = aLi[i].getElementsByTagName('div')[0];
				startMove(oDiv, {opacity:0});
			}
		}
	}
	one();
};
function getClass(oParent, sClass){
	var aElem = document.getElementsByTagName('*');
	var aClass = [];
	var i = 0;
	for(i=0;i<aElem.length;i++)if(aElem[i].className == sClass)aClass.push(aElem[i]);
	return aClass;
}
function myAddEvent(obj, sEvent, fn){
	if(obj.attachEvent){
		obj.attachEvent('on' + sEvent, function(){
			fn.call(obj);
		});
	}else{
		obj.addEventListener(sEvent, fn, false);
	}
}
function startMove(obj, json, fnEnd){
	if(obj.timer)clearInterval(obj.timer);
	obj.timer = setInterval(function (){
		doMove(obj, json, fnEnd);
	}, 30);
}
function getStyle(obj, attr){
	return obj.currentStyle ? obj.currentStyle[attr] : getComputedStyle(obj, false)[attr];
}
function doMove(obj, json, fnEnd){
	var iCur = 0;
	var attr = '';
	var bStop = true;
	for(attr in json){
		attr == 'opacity' ? iCur = parseInt(100*parseFloat(getStyle(obj, 'opacity'))) : iCur = parseInt(getStyle(obj, attr));
		if(isNaN(iCur))iCur = 0;
		if(navigator.userAgent.indexOf("MSIE 8.0") > 0){
			var iSpeed = (json[attr]-iCur) / 3;
		}else{
			var iSpeed = (json[attr]-iCur) / 5;
		}
		iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
		if(parseInt(json[attr])!=iCur)bStop = false;
		if(attr=='opacity'){
			obj.style.filter = "alpha(opacity:"+(iCur+iSpeed)+")";
			obj.style.opacity = (iCur + iSpeed) / 100;
		}else{
			attr == 'zIndex' ? obj.style[attr] = iCur + iSpeed : obj.style[attr] = iCur + iSpeed +'px';
		}
	}
	if(bStop){
		clearInterval(obj.timer);
		obj.timer = null;		
		if(fnEnd)fnEnd();
	}
}
</script>
<div id="top" style="display:none">
  <div class="small">
    <ul>
      <li class="" style="opacity: 0.4; "><img src="../../images/01.jpg"></li>
      <li class="" style="opacity: 0.4; "><img src="../../images/02.jpg"></li>
      <li style="opacity: 0.96; " class="hove"><img src="../../images/03.jpg"></li>
      <li style="opacity: 0.4; " class=""><img src="../../images/01.jpg"></li>
      <li style="opacity: 0.4; " class=""><img src="../../images/03.jpg"></li>
    </ul>
  </div>
</div>
<div class="footer" style="background:none"> <span class="logo"><a href="http://mm.yue.ifeng.com"><img
				src="images/logo.png" /></a></span>
  <p> <a href="http://www.ifeng.com/corp/about/">关于凤凰新媒体</a> |<a
				href="http://mm.yue.ifeng.com
"> 秀场首页</a> | <a
				href="http://yue.ifeng.com">音乐首页</a> | <span style="color: #000">客服电话:4008109890
    | 客服邮箱: wireless@ifeng.com</span><br />
    [<a href="images/icp.jpg">京ICP证030609号</a>]
    [<a href="images/wlwhjy.jpg">文网文[2010]136号</a>]<br />
    凤凰新媒体 版权所有<br />
    Copyright © 2013 Phoenix New Media Limited All Rights Reserved. </p>
</div>
<script>
    var sta_collection_time = new Date().getTime();
  </script>
<script src="http://y3.ifengimg.com/sta_collection.3.3.10.min.js" id="sta_collection_new"></script>
</body>
</html>
