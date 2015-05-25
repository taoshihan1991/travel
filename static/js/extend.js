/*
扩展js文件
@author tsh
*/
$(function(){
	// 顶部
	$('#topNav li,#menuMyTc').hover(function(){
		$(this).addClass('open');
		var height=$(this).find('div').attr('data-height');
		if(height){
			$(this).find('div').css('height',height);
		}
	},function(){
		$(this).removeClass('open');
		var height=$(this).find('div').attr('data-height');
		if(height){
			$(this).find('div').css('height',0);
		}
		
	});

	// 导航
	$('#menuNav li').hover(function(){
		$(this).addClass('hover');
	},function(){
		$(this).removeClass('hover');
	}); 

	// 列表
	$('.box_list li').hover(function(){
		$('.box_list li').removeClass('hover');
		$(this).addClass('hover');
	});	

	// 详情推荐
	$('#guessBox .linebox').hover(function(){
		$('#guessBox .linebox .showpic').addClass('none');
		$(this).find('.showpic').removeClass('none');
	});
});
