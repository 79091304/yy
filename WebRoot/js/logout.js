/**
 * 退出
 */

function logout(){
	$.cookie('uid',null,{expires:-1});
	window.location.href("http://www.haoxuedang.com");
}