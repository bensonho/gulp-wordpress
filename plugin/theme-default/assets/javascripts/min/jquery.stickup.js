$(document).ready(function(){var s=[],t=[],n=0,o="",e="",r="",a=null,i=0,c=0,l=0,p=0,u=0;$(window).scroll(function(){var s=$(this).scrollTop();o=s>n?"down":"up",n=s}),$.fn.stickUp=function(s){$(this).addClass("stuckMenu");var n=0;if(null!=s){for(var o in s.parts)s.parts.hasOwnProperty(o)&&(t[n]=s.parts[n],n++);0==n&&console.log("error:needs arguments"),e=s.itemClass,r=s.itemHover,null!=s.topMargin?"auto"==s.topMargin?p=parseInt($(".stuckMenu").css("margin-top")):isNaN(s.topMargin)&&s.topMargin.search("px")>0?p=parseInt(s.topMargin.replace("px","")):isNaN(parseInt(s.topMargin))?(console.log("incorrect argument, ignored."),p=0):p=parseInt(s.topMargin):p=0,a=$("."+e).size()}i=parseInt($(this).height()),c=parseInt($(this).css("margin-bottom")),l=parseInt($(this).next().closest("div").css("margin-top")),u=parseInt($(this).offset().top)},$(document).on("scroll",function(){function n(n){contentView=.4*$("#"+t[n]).height(),testView=s[n]-contentView,varscroll>testView?($("."+e).removeClass(r),$("."+e+":eq("+n+")").addClass(r)):varscroll<50&&($("."+e).removeClass(r),$("."+e+":eq(0)").addClass(r))}if(varscroll=parseInt($(document).scrollTop()),null!=a)for(var d=0;a>d;d++)s[d]=$("#"+t[d]).offset().top,"down"==o&&varscroll>s[d]-50&&varscroll<s[d]+50&&($("."+e).removeClass(r),$("."+e+":eq("+d+")").addClass(r)),"up"==o&&n(d);u<varscroll+p&&($(".stuckMenu").addClass("isStuck"),$(".stuckMenu").next().closest("div").css({"margin-top":i+c+l+"px"},10),$(".stuckMenu").css("position","fixed"),$(".isStuck").css({top:"0px"},10,function(){})),varscroll+p<u&&($(".stuckMenu").removeClass("isStuck"),$(".stuckMenu").next().closest("div").css({"margin-top":l+"px"},10),$(".stuckMenu").css("position","relative"))})});