
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>众筹网-中国最具影响力的众筹平台</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/forgetpwd.css"/>
<!--public js&css start-->
<!--public js&css end -->    

<body>
<!--header static-->
<#include "header.ftl">


<div class="main clearfix">
    <div class="wrap clearfix">
        <!--flow step static-->
        <div class="radius-hd">
            <div class="radius-hl common-sprite"></div>
            <div class="radius-hc w950"></div>
            <div class="radius-hr common-sprite"></div>
        </div>
        <div class="radius-bd w958">
            <div class="tit-wrap">
                <h3>找回密码</h3>
            </div>
            <!--forgot con static-->
            <div class="forgot-con">
                <!--sub nav static-->
                <div class="sub-nav">
                    <ul class="clearfix">
                        <li class="select" id="li1" >
                            <em class="icon-sub">1</em>
                            <span>确认密码</span>
                            <i class="icon-sub"></i>
                        </li>
                        <li id="li2">
                            <em class="icon-sub">2</em>
                            <span>安全验证</span>
                            <i class="icon-sub"></i>
                        </li>
                        <li id="li3" >
                            <em class="icon-sub">3</em>
                            <span>重置密码</span>
                        </li>
                    </ul>
                </div>
                <!--sub nav static-->
                
                <!--步骤1 -->
                 <div id="getpwd1" class="step-detail getpsswdone">
                    <form wx-validator wx-validator-error-class="error-text" wx-validator-ajax name="user_getpassword_form" action="/user-ajax_checkemail">
                        <div class="form-item clearfix">
                            <label>请填写您需要找回的帐号：</label>
                            <input name="contact" class="inp-w227" wx-validator-rule="required|emailormobile" type="text" wx-validator-placeholder="请填写您注册的邮箱或手机号" />
                             <span class="error-text">请填写您注册的邮箱</span>
                        </div>
                        <div class="form-item clearfix">
                            <label>请输入验证码：</label>
                            <input name="vcode" type="text" wx-validator-rule="required|rangelength|digits" wx-validator-param="|4-5|" class="inp-wst">
                            <span class="code"><img src="${ctx}/imageServlet" title="点击更换" onclick="javascript:refresh(this);" ></span>
                            <span id="wx-validator-vcode-required" class="error-text" style="display:none">不能为空</span>
                            <span id="wx-validator-vcode-rangelength" class="error-text" style="display:none">请输入4-5位的数字或字母</span>
                        </div>
                        <div class="step-submit">
                            <a type="submit" class="btn-base btn-red-h30 common-sprite"  href="javascript:void(0);">
                                <span class="common-sprite" id="step1" >下一步</span>
                            </a>
                        </div>
                    </form>
                </div>
                <!--step detail end-->
                <!--step detail static-->
                <div id="getpwd2" class="step-detail getpsswdtwo" >
                    <form wx-validator wx-validator-error-class="error-text" wx-validator-ajax name="user_codeuserverify_form" action="/user-codeuserverify">
                        <div class="form-item clearfix">
                            <label>验证方式：</label>
                            <p id="comfirmemail" class="form-msg passemail"></p>
                        </div>
                        <div class="form-item clearfix">
                            <input id="step2" class="btn-code" style="margin-left:190px;" type="button" value="获取验证码" />
                            <span id="wx-validator-vcode-required" class="error-text" style="display:none">不能为空</span>
                            <span id="wx-validator-vcode-rangelength" class="error-text" style="display:none">请输入6-7位的数字或字母</span>
                        </div>
                        <!-- 
                        <div class="step-submit">
                            <a type="submit" class="btn-base btn-red-h30 common-sprite" href="javascript:void(0);">
                                <span class="common-sprite">下一步</span>
                            </a>
                        </div>
                         -->
                    </form>
                </div>
                
              
                
                <!--step detail static--><!--步骤3 -->
                <div id="getpwd3" class="step-detail" style="display:none;">
                    <form autocomplete="off" wx-validator="" wx-validator-ajax="" name="user_getpassword_form" action="/user-ajax_modifypassword" wx-validator-error-class="error-text">
                        <div class="form-item clearfix">
                            <label>新密码：</label>
                            <input placeholder="请输入修改密码" name="passwd" class="inp-w227" wx-validator-rule="required|rangelength" wx-validator-param="|6-16" wx-validator-placeholder="请输入修改密码" type="password"><span style="display: none;" id="wx-validator-passwd-rangelength" class="error-text">请输入6-16位的数字或字母</span>
                        </div>
                        <div class="form-item clearfix">
                            <label>确认密码：</label>
                             <input placeholder="请重复输入密码" name="re_passwd" class="inp-w227" wx-validator-rule="required|equalTo" wx-validator-param="|passwd" wx-validator-placeholder="请重复输入密码" type="password"><span style="display: none;" id="wx-validator-re_passwd-equalTo" class="error-text">请保持所填写的内容一致</span>
                        </div><input name="ajax" vlaue="1" type="hidden">
                        <div class="form-item clearfix">
                        <label>请输入验证码：</label>
                        <input value="111111" name="vcode" wx-validator-rule="required|rangelength|digits" wx-validator-param="|6-7|" class="inp-wst" type="text"><span style="display: none;" id="wx-validator-vcode-rangelength" class="error-text">请输入6-7位的数字或字母</span>
                        </div>
                        
                        <div class="form-item clearfix">
                        <label>请输入图形验证码：</label>
                        <input value="2861" name="vcode_pic" wx-validator-rule="required|digits" class="inp-wst" type="text"><span style="display: none;" id="wx-validator-vcode_pic-required" class="error-text">不能为空</span>
                        <span class="code"><img src="${ctx}/imageServlet" onclick="this.src = '${ctx}/imageServlet'+Math.random();"></span>
                        </div>
                        
                        <div class="step-submit">
                            <a type="submit" class="btn-base btn-red-h30 common-sprite" href="javascript:void(0);">
                                <span id="step3" class="common-sprite">完成</span>
                            </a>
                        </div>
                    </form>
                </div>
                <!--step detail end-->
            </div>
            <!--forgot con end-->
        </div>
        <div class="radius-ft">
            <div class="radius-fl common-sprite"></div>
            <div class="radius-fc w950"></div>
            <div class="radius-fr common-sprite"></div>
        </div>
        <!--side end-->
    </div>
</div>
<!--footer static-->
<#include "footer.ftl" >

<script>

	 function refresh(obj) {
		obj.src = "imageServlet?"+Math.random();
	 }

$(function(){
	$("#getpwd1").show();
	$("#getpwd2").hide();
	$("#getpwd3").hide();
	
	var email = $("input[name='contact']").val();
	$("#step1").click(function(){
		$.ajax({	
			url:"${ctx}/settings/step1.htm",
			data:{email:email},
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj.code ==1){
					$("#getpwd1").hide();
					$("#getpwd2").show();
					$("#li1").removeClass();
					$("#li2").addClass("select");
					$("#comfirmemail").text(email);
				}else{
					wx.alert("邮箱不存在，请重新输入");
				}
			}
		});
	});
	
	$("#step2").click(function(){
		$.ajax({	
			url:"${ctx}/settings/step2.htm",
			data:{email:email},
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj.code ==1){
					$("#getpwd2").hide();
					$("#getpwd3").show();
					$("#li2").removeClass();
					$("#li3").addClass("select");
				}
			}
		});
	});
	
	$("#step3").click(function(){
		var pwd = $("input[name='passwd']").val();
		var vcode = $("input[name='vcode']").val();
		var piccode = $("input[name='vcode_pic']").val();
		$.ajax({	
			url:"${ctx}/settings/step3.htm",
			data:{email:email,password:pwd,code:vcode,piccode:piccode},
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj.code ==1){
					wx.alert("密码修改成功，请重新登录");
					window.loaction.href="http://localhost/yy/";
				}
			}
		});
	});
	
});



</script>

</body></html>