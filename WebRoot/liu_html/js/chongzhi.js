	var uname="";
	var chargecount="";
	var orderid="";
	var token="";
	var res = "";
	$.ajax({
			type:'post',
			dataType:'json',
			url:'../chongzhiServlet',
			data:'',
			success:function(data){
				uname=data.name;
				chargecount=data.chargeccount;
				orderid=data.orderid;
				document.getElementById("money").innerHTML=data.chargeccount;
				document.getElementById("hello").innerHTML=data.name;
				document.getElementById("un").innerHTML=data.name;
				document.getElementById("price").innerHTML=data.chargeccount/100;
			}
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
	//储蓄卡充值
	function iccard(){
 		var cardNo=document.chongzhi1.cardNo.value;
		var usrName=document.chongzhi1.usrName.value;
		var mobile=document.chongzhi1.mobile.value;
		var transAmt=document.priceform.price.value;
		var authCode=document.chongzhi1.auth.value;
		rand();
		var flag=hex_md5('channelId=7&accountId=yanjianxia&categoryId=01&transAmt=1&randnum='+res+'&key=u9Y%)!a1z');
		console.log('typeId=1&channelId=0&accountId=yanjianxia&categoryId=01&cardNo='+cardNo+'&usrName='+usrName+'&mobile='+mobile+'&transAmt=1&authCode='+authCode+'&randnum='+res+'&sign='+flag);
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://211.151.175.47/interface/pay.php?',
			data:'typeId=1&channelId=7&accountId='+uname+'&categoryId=01&cardNo='+cardNo+'&usrName='+usrName+'&mobile='+mobile+'&transAmt='+transAmt+'&authCode='+authCode+'&randnum='+res+'&sign='+flag,
			success:function(data){alert(222);
				if(data.respCode=="0000"){//充值成功
					 $.ajax({
						type:'post',
						url:'../chargeServlet?userkey='+uname+'&orderid='+orderid+'&transAmt='+transAmt,
						success:function(data){
							window.location.href="chongzhi2.html";
						}
					}); 
				}else{
					//充值失败，给出失败原因
					document.chongzhi1.fail.innerHTML="<font color='red'>"+data.respMsg+"</font>";
				}
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	//信用卡充值
	function xinyongka(){
		var cardNo=document.chongzhi2.cardNo.value;
		var usrName=document.chongzhi2.usrName.value;
		var mobile=document.chongzhi2.mobile.value;
		var transAmt=document.priceform.price.value;
		var authCode=document.chongzhi2.auth.value;
		rand();
		var period=document.chongzhi2.period.value;
		var cvvCode=document.chongzhi2.cvvCode.value;
		var flag=hex_md5('channelId=7&accountId='+uname+'&categoryId=01&transAmt='+transAmt+'&randnum='+res+'&cvvCode='+cvvCode+'&period='+period+'&key=u9Y%)!a1z');
		 console.log('typeId=2&channelId=7&accountId='+uname+'&categoryId=01&cardNo='+cardNo+'&usrName='+usrName+'&mobile='+mobile+'&transAmt='+transAmt+'&authCode='+authCode+'&randnum='+res+'&cvvCode='+cvvCode+'&period='+period+'&sign='+flag);
		 $.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://211.151.175.47/interface/pay.php?',
			data:'typeId=2&channelId=7&accountId='+uname+'&categoryId=01&cardNo='+cardNo+'&usrName='+usrName+'&mobile='+mobile+'&transAmt='+transAmt+'&authCode='+authCode+'&randnum='+res+'&cvvCode='+cvvCode+'&period='+period+'&sign='+flag,
			success:function(data){
				if(data.respCode=="0000"){//充值成功
				alert("success");
					//入库
					 $.ajax({
						type:'post',
						url:'../chargeServlet?userkey='+uname+'&orderid='+orderid+'&transAmt='+transAmt,
						success:function(data){
							window.location.href="chongzhi2.html";
						}
					}); 
				}else{alert("fail");
					//充值失败，给出失败原因
					document.chongzhi2.fail.innerHTML="<font color='red'>"+data.respMsg+"</font>";
				}
			}
		}); 
	}
	/* 
	//手机包月
	function allmobile(){
		change();
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://pay.ifeng.com/payment?',
			data:'service="wap_direct_pay_by_user"&merchant=100008&bill_no=&charset="UTF-8"&subject=&price=&payment_method=&card_no=&return_url=&notify_url=&sign_type=&sign=',	
			success:function(data){
				
			}
		});
	} */
	
	//电话卡充值
	function mobile(){
		var sign=hex_md5("service=wap_direct_pay_by_user&merchant=100008&bill_no="+orderid+"&charset=UTF-8&subject=&price="+document.priceform.select.value+"&payment_method=13&return_url=&notify_url=172.28.10.34:8080/tvchat/chargeServlet");
		alert("sign");
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://pay.ifeng.com/payment?',
			data:'service=&merchant=100008&bill_no=&charset=UTF-8&subject=&price=&payment_method=&card_no=&return_url=&notify_url=172.28.10.34:8080/tvchat/chargeServlet&sign_type=md5&sign='+sign,	
			success:function(data){
				alert(data.trade_status);
			},
			error:function(data){
				alert("error:"+data.trade_status);
			}
		});
		alert("end");
	}
	
	//支付宝充值
	function zhifubao1(){alert("zhifubao");
		var service="wap_direct_pay_by_user";
		var charset="UTF-8";
		var subject="六币";
		var return_url="172.28.10.34:8080/tvchat/liu_html/chongzhi2.html";
		var notify_url="172.28.10.34:8080/tvchat/chargeServlet";
		var sign=hex_md5("service="+service+"&merchant=100008&bill_no=8023490234&charset="+charset+"&subject="+subject+"&price="+document.priceform.select.value+"&payment_method=13&return_url="+return_url+"&notify_url="+notify_url);
		console.log(sign);
		console.log("service="+service+"&merchant=100008&bill_no=8023490234&charset="+charset+"&subject="+subject+"&price="+document.priceform.select.value+"&payment_method=13&return_url="+return_url+"&notify_url="+notify_url);
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://pay.ifeng.com/payment?',
			data:'service='+service+'&merchant=100008&bill_no=8023490234&charset='+charset+'&subject='+subject+'&price='+document.priceform.select.value+'&payment_method=13&return_url='+return_url+'&notify_url='+notify_url+'&sign_type=md5&sign='+sign,	
			success:function(data){alert(234);
				//alert(data.trade_status);
			},
			error:function(data){
				alert("error:"+data);
			}
		});
	}
	
	function zhifubao(){alert("zhifubao");
		var service="wap_direct_pay_by_user";
		var charset="UTF-8";
		var subject="六币";
		var return_url="172.28.10.34:8080/tvchat/liu_html/chongzhi2.html";
		var notify_url="172.28.10.34:8080/tvchat/chargeServlet";
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'../chargeServlet',
			data:'service='+service+'&merchant=100008&bill_no=8023490234&charset='+charset+'&subject='+subject+'&price='+document.priceform.select.value+'&payment_method=13&return_url='+return_url+'&notify_url='+notify_url+'&sign_type=md5',	
			success:function(data){alert(234);
				//alert(data.trade_status);
			},
			error:function(data){
				alert("error:"+data);
			}
		});
	}
	
	function auth1(){
		var sign=hex_md5('channelId=7&accountId='+document.chongzhi1.cardNo.value+'&categoryId=01&mobile='+document.chongzhi1.mobile.value+'&randnum='+rand());
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://211.151.175.47/interface/authCode.php?',
			data:'channelId=7&accountId='+uname+'&categoryId=01&mobile='+document.chongzhi1.mobile.value+'&randnum='+rand+'&sign='+sign,
			success:function(data){
			}
		});
	}
	
	function auth2(){
		rand();
		alert(res);
		var sign=hex_md5('channelId=7&accountId='+document.chongzhi2.cardNo.value+'&categoryId=01&mobile='+document.chongzhi2.mobile.value+'&randnum='+res);
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'http://211.151.175.47/interface/authCode.php?',
			data:'channelId=7&accountId='+uname+'&categoryId=01&mobile='+document.chongzhi2.mobile.value+'&randnum='+res+'&sign='+sign,
			success:function(data){
			}
		});
	}
	
	function clear(){alert("clear");
		document.chongzhi1.mobile.value="";
	}