//��ȡ�û���Ϣ
	function login(){
		$.ajax({
			type:'post',
			dataType:'jsonp',
			url:'https://id.ifeng.com/api/login?',
			data:'u='+document.getElementById("name").value+'&k='+document.getElementById("pwd").value+'&type=2&comefrom=6&auth='+document.getElementById("auth").value,
			success:function(data){
				if(data.code==1){//��¼�ɹ�
				var date = data.data.token;
				setCookie("cookie",date);
				 $.ajax({
					type:'post',
					dataType:'text',
					url:'../loginServlet?sid='+data.data.token,
					success:function(data){
						if(data=="1"){
							//��ȡ�û���Ϣ�ɹ�
							window.location.href="main.html";
						}else{
							window.location.href="main.html";
						}
					}
				});  
				}else{
					
				}
			}
		});
	}
	function setCookie(name,value)
{
    
    document.cookie = name + "="+ escape (value);
}