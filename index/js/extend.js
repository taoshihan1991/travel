$(function(){
	var slideNavObj=$('.slideNav');
	var slideNavItemObj=slideNavObj.find('.slideNavItem');
	var index=0;
	$('#header #nav li').hover(function(){
		index=$(this).index();
		slideNavObj.attr('data-hover',1);
		

		slideNavItemObj.hide();
		slideNavItemObj.eq(index).show();

		if(slideNavItemObj.eq(index).length && index!=0 &&index!=1){
			slideNavObj.show();
		}
		
	},function(){
		index=$(this).index();
		if(!slideNavItemObj.eq(index).length || index==0 || index==1){
			slideNavObj.hide();
		}
		setTimeout(function(){
			if(slideNavObj.attr('data-hover')!=1){
				slideNavObj.attr('data-hover',0)
				slideNavObj.hide();
			}
		},3000);

	});
	slideNavObj.hover(function(){
		$(this).attr('data-hover',1);
		$(this).show();
	},function(){
		$(this).hide();
	});


	// ie版本
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    if (Sys.ie){
    	$('.alertBoxBg').show();
    	$('.alertBoxContainer').show();
    }


})