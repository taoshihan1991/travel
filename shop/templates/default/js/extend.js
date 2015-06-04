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
	$('#guessBox .linebox').eq(0).find('.showpic').removeClass('none');
	$('#guessBox .linebox').eq(0).find('.ico_nub').removeClass('none');
	$('#guessBox .linebox').hover(function(){
		$('#guessBox .linebox .showpic').addClass('none');
		$('#guessBox .ico_nub').addClass('none');
		$(this).find('.showpic').removeClass('none');
		$(this).find('.ico_nub').removeClass('none');
	});

	// 首页tab
	$('.udiyblock li').click(function(){
		$(this).parents('.udiyblock').find('li').removeClass('cur');
		$(this).addClass('cur');
		var index=$(this).index();
		$(this).parents('.srpnel').find('.prooutinbound-list').addClass('none');
		$(this).parents('.srpnel').find('.prooutinbound-list').eq(index).removeClass('none');
	});

	// 首页banner部分tab
	$('.notice_tag_top a').hover(function(){
		var index=$(this).index();
		$('.notice_tag_top a').removeClass('on').eq(index).addClass('on');
		$('.notice_tag_con').children().hide().eq(index).show();
	});

	//旅游js下拉框
    $('#choice').hide();
    $('.select_box').hover(function () {
            $('#choice').stop().fadeIn();
    }, function () {
            $('#choice').stop().fadeOut();
    });
    $('#choice span').click(function () {
            var txt = $(this).text();
            $('#search_btn').text(txt);
            $('#search_attr').val($(this).attr('data-cateid'));
    });

    //首页图片
    $('img').animate({"opacity":1});
		$('img').hover(function(){
			$(this).stop().animate({"opacity":.7})
			},function(){
				$(this).stop().animate({"opacity":1})
	});

	// 详情页图片滚动
	var move=0;
	var step=100;
	$('.next').click(function(){
		var height=$(this).parents('.viewSlideRight').find('.smallPic').height();
		var top=parseInt($(this).parents('.viewSlideRight').find('.smallPic').css('top').replace('px',''));
		if((height+top)<=290){
			return;
		}
		move=move-step;
		$(this).parents('.viewSlideRight').find('.smallPic').stop().animate({
			top:move+'px'
		});

	});
	
	$('.pre').click(function(){
		var top=$(this).parents('.viewSlideRight').find('.smallPic').css('top').replace('px','');
		if(top>=0){
			move=0;
			return;
		} 

		move=move+step;
		$(this).parents('.viewSlideRight').find('.smallPic').stop().animate({
			top:move+'px'
		});
	});
	$('.smallPic img').click(function(){
		var pic=$(this).attr('data-src');
		$('#bigPic').attr('src',pic);
	});
});
