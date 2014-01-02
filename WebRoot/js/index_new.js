	$(function(){
		
		$("#favorites").click(function () {
		    var ctrl = (navigator.userAgent.toLowerCase()).indexOf('mac') != -1 ? 'Command/Cmd' : 'CTRL';  
		    if (document.all) {  
			window.external.addFavorite('http://mm.yue.ifeng.com', '美女秀场');  
		    } else if (window.sidebar) {  
			window.sidebar.addPanel('美女秀场', 'http://mm.yue.ifeng.com', "");  
		    } else {
			alert('添加失败\n您可以尝试通过快捷键' + ctrl + ' + D 加入到收藏夹~');  

		    }  
		});  

		
		if($.cookie('cookie') || $.cookie('sid')){
			$.ajax({
				type:'post',
				dataType:'text',
				url:'log/login.htm',
				data:'',
				success:function(data){
					var name = data.split("nickname=");
					if(name.length>1){
						logo_in();
						$("#windowbg").hide();
						$("#welcome1").hide();
						$("#ud").html("<a target='_blank' href='http://my.ifeng.com' > <strong>欢迎您：<u class='red' >"+name[1]+"</u> </strong></a> [<a href='#'onclick='removeCookie()'>退出</a>] ");
					}else{
					}
					
				}
			});
		}
		
	});
	
	function removeCookie(){
		$.cookie('cookie','',{expires: -1, path: '/'});
		$.cookie('sid','',{ expires: -1,path: '/',domain:'.ifeng.com' }); 
		document.location.reload();
		$.ajax({
			type:'post',
			dataType:'text',
			url:'LogoutServlet',
			success:function(data){
			}
		});
	}
	
	//获取用户信息
	function login(){
		var username = $("#username").val();
		var pwd = $("#pwd").val();
		var aut = $("#auth").val();
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'https://id.ifeng.com/api/login?',
			data:'u='+username+'&k='+pwd+'&type=2&comefrom=6&auth='+aut,
			success:function(result){
				if(result.code==1){//登录成功
				var name = result.data.uname;
				 $.ajax({
					type:'post',
					dataType:'text',
					url:'user/getUserInfo.htm?sid='+result.data.token,
					success:function(data){
						if(data=="1"){
							//获取用户信息成功
							logo_in();
							$("#windowbg").hide();
							$("#welcome1").hide();
							$("#ud").html("<p id='welcome2' class='wellcome f12'><a target='_blank' href='http://my.ifeng.com' >  <strong>欢迎您：<u class='red'>"+name+"</u> </strong></a>[<a href='#'onclick='removeCookie()'>退出</a>]</p> ");
						}else{
						}
					}
				});  
				}else{
					document.getElementById("loginfail").innerHTML="<font color='red'>"+result.message+"</font>";
					ChangeValidCode("chkcode");
				}
			}
		});
	}
	
	
	
	//邮箱注册
	function submitReg(){
		var uid="";
			 $.ajax({
			type:'post',
			dataType:'jsonp',
			url:'https://id.ifeng.com/api/register?u='+document.form2.email.value+'&k='+document.form2.pwd1.value+'&comefrom=6&auth='+document.form2.auth.value+'&type=2',
			success:function(data){
				if(data.code==1){
					//记录注册用户
					$.ajax({
						type:'post',
						dataType:'text',
						url:"RegisterBackServlet?mail="+$('#email').val()+"&pwd="+$('#password1').val(),
						success:function(data){}
							});
				document.getElementById("fail").innerHTML="";
				setCookie("reg",document.form2.email.value);
				//注册成功跳转到登录页
				window.location.href="liu_html/reg1.html";
				}else{
					document.getElementById("regfail").innerHTML="<font color='red'>"+data.message+"</font>";
					ChangeValidCode("chkcode2");
				}
			}
		}); 
	}
	
	function setCookie(name,value)	//两个参数，一个是cookie的名子，一个是值
{
    document.cookie = name + "="+ escape (value);
}
	
	function openme(){
		 document.getElementById('blackbg').style.display='block';
		 document.getElementById('windowbg').style.display='block';
		}
		function closeme(){
		 document.getElementById('blackbg').style.display='none';
		 document.getElementById('windowbg').style.display='none';
		}
		 function logo_in(){
		closeme();
		}
		 