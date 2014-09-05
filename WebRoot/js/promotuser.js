/**
 * 
 */

var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;
var backitem        = 0;
var hoveritem       = 0;
var whiteitem       = 0;


function jsddm_open()
{	
	jsddm_canceltimer();
	jsddm_close();
	ddmenuitem =$('#jsddm').find('.myinfo').show();
	ddmenuitem =$('#jsddm').find('.JS-myinfo').show();
	backitem = $('#jsddm').find('a.tit').addClass("active");
	hoveritem = $('#jsddm').find('a span.xm').css('color', '#190302');	
	whiteitem =$('.flinfo .white').css('visibility', 'hidden');
	}

function jsddm_close()
{	if(ddmenuitem) ddmenuitem.hide();
	if(backitem) backitem.removeClass("active");
	if(hoveritem) hoveritem.css('color', '#190302');
	if(whiteitem) whiteitem.css('visibility', 'hidden');
}

function jsddm_timer()
{	closetimer = window.setTimeout(jsddm_close, timeout);}

function jsddm_canceltimer()
{	if(closetimer)
	{	window.clearTimeout(closetimer);
		closetimer = null;}}

$(document).ready(function()
{	
	$('#jsddm ').bind('mouseover', jsddm_open);
	$('#jsddm ').bind('mouseout',  jsddm_timer);	
	$("#headermenu").find("a").bind("click",selectMenu);
	});
	
document.onclick = jsddm_close;


/*********判断字符长度,汉字为2个字符************/
var jmz = {};
jmz.GetLength = function(str) {		    
    var realLength = 0, len = str.length, charCode = -1;
    for (var i = 0; i < len; i++) {
        charCode = str.charCodeAt(i);
        if (charCode >= 0 && charCode <= 128) realLength += 1;
        else realLength += 2;
    }
    return realLength;
};

/**
 * 喜欢操作
 */
var inlikedealrequest = 0;
function like_deal_v2(id, el) {
	  if (inlikedealrequest) return;
	  inlikedealrequest = 1;
	  var dataType = typeof type=="undefined"?"&type=0":type;
	  var ajaxurl = APP_ROOT+"/index.php?ctl=deal&act=like&id="+id+dataType;
	  $.ajax({ 
	    url: ajaxurl,
	    dataType: "json",
	    success: function(ajaxobj) {
	      inlikedealrequest = false;
	      if (ajaxobj.status>0) {
	        var nums = parseInt($(el).attr('rel'))+1;
	        $(el).html(nums+"");
	        $("#strong_like_count").html(nums);
	        $(el).removeClass("like"); 
	        $(el).addClass("liked");
	        $(".Js-changelike").html('<i class="common-sprite icon-like  ie6fixpic"></i>已喜欢');
	        el.onclick = function() {};
	      } else {
	        $.showErr(ajaxobj.info);
	      }
	    },
	    error:function(ajaxobj)
	    {
	      inlikedealrequest = false;
	    }
	  });
	}
/*
 * 适用于预热项目的喜欢操作
 */
function like_deal_v3(id, el) {
	  if (inlikedealrequest) return;
	  inlikedealrequest = 1;
	  var dataType = typeof type=="undefined"?"&type=0":type;
	  var ajaxurl = APP_ROOT+"/index.php?ctl=deal&act=like&id="+id+dataType;
	  $.ajax({ 
	    url: ajaxurl,
	    dataType: "json",
	    success: function(ajaxobj) {
	      inlikedealrequest = false;
	      if (ajaxobj.status>0) {
	        var nums = parseInt($(el).attr('rel'))+1;
	        $(el).html("已喜欢");
	        //$(el).removeClass("like");
	        //$(el).addClass("liked");
	        $("#show_like_count").html(nums);
	        $("#activity_show_like").html("已喜欢 ("+nums+")");
	        $("#activity_show_like_top").html(nums);
	        el.onclick = function() {};
	      } else {
	        $.showErr(ajaxobj.info);
	      }
	    },
	    error:function(ajaxobj)
	    {
	      inlikedealrequest = false;
	    }
	  });
	}


/**
 * 选择样式
 */
function selectMenu(){
	$(this).parent().removeClass("select");
}