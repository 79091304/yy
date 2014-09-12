
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
                        <li>
                            <em class="icon-sub">1</em>
                            <span>确认密码</span>
                            <i class="icon-sub"></i>
                        </li>
                        <li>
                            <em class="icon-sub">2</em>
                            <span>安全验证</span>
                            <i class="icon-sub"></i>
                        </li>
                        <li class="select">
                            <em class="icon-sub">3</em>
                            <span>重置密码</span>
                        </li>
                    </ul>
                </div>
                <!--sub nav static-->
                <!--step detail static-->
                <div class="step-detail">
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
                        <span class="code"><img src="" onclick="this.src = '/verify.php?t='+Math.random();"></span>
                        </div>
                        
                        <div class="step-submit">
                            <a type="submit" class="btn-base btn-red-h30 common-sprite" href="javascript:void(0);">
                                <span class="common-sprite">完成</span>
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
function user_getpassword_form(data){
  if(data.status == 1){
    wx.alert("密码修改成功",function(){
      location.href = "/user-login";
    });
  } else {
    wx.alert(data.info || "修改失败");
  }
}

</script>

</body></html>