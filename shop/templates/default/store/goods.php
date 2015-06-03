<?php defined('InShopNC') or exit('Access Invalid!');?>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/qtip/jquery.qtip.min.js"></script>
<link href="<?php echo RESOURCE_SITE_URL;?>/js/qtip/jquery.qtip.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/home_goods.css" rel="stylesheet" type="text/css">
<style type="text/css">
.ncs-goods-picture .levelB, .ncs-goods-picture .levelC {
cursor: url(<?php echo SHOP_TEMPLATES_URL;
?>/images/shop/zoom.cur), pointer;
}
.ncs-goods-picture .levelD {
cursor: url(<?php echo SHOP_TEMPLATES_URL;
?>/images/shop/hand.cur), move\9;
}
</style>


<!-- [主体部分] -->
<div class="viewPage">
  <div class="viewPageLeft">
    <div class="viewInfo">
      <div class="viewInfoLeft">
        <!-- 轮播图 -->
        <div class="viewSlidePicBox">
            <img src="<?php echo $output['goods_image'][0];?>" id="bigPic">
            <div class="viewSlideRight">
              <a href="jascript:;" class="pre"></a>
              <div class="smallPic">
                <?php if(!empty($output['goods_image'])){foreach($output['goods_image'] as $v){?>
                <a href="javascript:;">
                  <img src="<?php echo $v;?>" data-src="<?php echo $v;?>" alt=""/>
                </a>
                <?php }}?>
              </div>
              
              <a href="jascript:;" class="next"></a>
            </div>

        </div>
                          
                                    
      <!-- 轮播图 -->
      </div>
      <div class="viewInfoRight">
        <table>
          <tbody><tr>
            <td class="infoName">产品编号：</td>
            <td>222044</td>
          </tr>
          <tr>
            <td class="infoName">本站价：</td>
            <td><div class="s_price"><b>¥</b>1199</div></td>
          </tr>
          <tr>
            <td class="infoName">市场价：</td>
            <td>222044</td>
          </tr>
          <tr>
            <td class="infoName">咨询热线：</td>
            <td>222044</td>
          </tr>
        </tbody></table>
        <a href="" title="立即预订" class="reserveBtn" attr-url="">立即预订</a>
      </div>
    </div>

    <div class="ncs-goods-layout expanded" >
      <div class="ncs-goods-main" id="main-nav-holder">
        <div class="ncs-promotion" style="display: none;">
          <div class="ncs-goods-title-nav">
            <ul>
              <li class="current"><a href="javascript:void(0);">优惠套装</a></li>
            </ul>
          </div>
          <div class="ncs-goods-info-content"><!--S 组合销售 -->
            <div class="ncs-bundling" id="nc-bundling"> </div>
            <!--E 组合销售 --></div>
        </div>
        <nav class="tabbar pngFix" id="main-nav">
          <div class="ncs-goods-title-nav">
            <ul id="categorymenu">
              <li class="current"><a id="tabGoodsIntro" href="#content"><?php echo $lang['goods_index_goods_info'];?></a></li>
              <li><a id="tabGoodsRate" href="#content"><?php echo $lang['goods_index_evaluation'];?></a></li>
              <li><a id="tabGoodsTraded" href="#content"><?php echo $lang['goods_index_sold_record'];?></a></li>
              <li><a id="tabGuestbook" href="#content"><?php echo $lang['goods_index_goods_consult'];?></a></li>
            </ul>
          </div>
        </nav>
        <div class="ncs-intro">
          <div class="content bd" id="ncGoodsIntro"> 
            
            <!--S 满就送 -->
            <?php if($output['mansong_info']) { ?>
            <div class="nc-mansong">
              <div class="nc-mansong-ico"></div>
              <dl class="nc-mansong-content">
                <dt><?php echo $output['mansong_info']['mansong_name'];?>
                  <time>( <?php echo $lang['nc_promotion_time'];?><?php echo $lang['nc_colon'];?><?php echo date('Y/m/d',$output['mansong_info']['start_time']).'--'.date('Y/m/d',$output['mansong_info']['end_time']);?> )</time>
                </dt>
                <dd>
                  <?php foreach($output['mansong_info']['rules'] as $rule) { ?>
                  <span><?php echo $lang['nc_man'];?><em><?php echo ncPriceFormat($rule['price']);?></em><?php echo $lang['nc_yuan'];?>
                  <?php if(!empty($rule['discount'])) { ?>
                  ， <?php echo $lang['nc_reduce'];?><i><?php echo ncPriceFormat($rule['discount']);?></i><?php echo $lang['nc_yuan'];?>
                  <?php } ?>
                  <?php if(!empty($rule['goods_id'])) { ?>
                  ， <?php echo $lang['nc_gift'];?> <a href="<?php echo $rule['goods_url'];?>" title="<?php echo $rule['mansong_goods_name'];?>" target="_blank"> <img src="<?php echo cthumb($rule['goods_image'], 60);?>" alt="<?php echo $rule['mansong_goods_name'];?>"> </a>&nbsp;。
                  <?php } ?>
                  </span>
                  <?php } ?>
                </dd>
                <dd class="nc-mansong-remark"><?php echo $output['mansong_info']['remark'];?></dd>
              </dl>
            </div>
            <?php } ?>
            <!--E 满就送 -->
            <?php if(is_array($output['goods']['goods_attr']) || isset($output['goods']['brand_name'])){?>
            <ul class="nc-goods-sort">
              <li>商家货号：<?php echo $output['goods']['goods_serial'];?></li>
              <?php if(isset($output['goods']['brand_name'])){echo '<li>'.$lang['goods_index_brand'].$lang['nc_colon'].$output['goods']['brand_name'].'</li>';}?>
              <?php if(is_array($output['goods']['goods_attr']) && !empty($output['goods']['goods_attr'])){?>
              <?php foreach ($output['goods']['goods_attr'] as $val){ $val= array_values($val);echo '<li>'.$val[0].$lang['nc_colon'].$val[1].'</li>'; }?>
              <?php }?>
            </ul>
            <?php }?>
            <div class="ncs-goods-info-content">
              <?php if (isset($output['plate_array'][1])) {?>
              <div class="top-template"><?php echo $output['plate_array'][1][0]['plate_content']?></div>
              <?php }?>
              <div class="default"><?php echo $output['goods']['goods_body']; ?></div>
              <?php if (isset($output['plate_array'][0])) {?>
              <div class="bottom-template"><?php echo $output['plate_array'][0][0]['plate_content']?></div>
              <?php }?>
            </div>
          </div>
        </div>
        <div class="ncs-comment">
          <div class="ncs-goods-title-bar hd">
            <h4><a href="javascript:void(0);"><?php echo $lang['goods_index_evaluation'];?></a></h4>
          </div>
          
          <div class="ncs-goods-info-content bd" id="ncGoodsRate">
              <div class="top">
                  <div class="rate">
                      <p><strong><?php echo $output['goods_evaluate_info']['good_percent'];?></strong><sub>%</sub>好评</p>
                <span>共有<?php echo $output['goods_evaluate_info']['all'];?>人参与评分</span></div>
              <div class="percent">
                <dl>
                  <dt>好评<em>(<?php echo $output['goods_evaluate_info']['good_percent'];?>%)</em></dt>
                  <dd><i style="width: <?php echo $output['goods_evaluate_info']['good_percent'];?>%"></i></dd>
                </dl>
                <dl>
                  <dt>中评<em>(<?php echo $output['goods_evaluate_info']['normal_percent'];?>%)</em></dt>
                  <dd><i style="width: <?php echo $output['goods_evaluate_info']['normal_percent'];?>%"></i></dd>
                </dl>
                <dl>
                  <dt>差评<em>(<?php echo $output['goods_evaluate_info']['bad_percent'];?>%)</em></dt>
                  <dd><i style="width: <?php echo $output['goods_evaluate_info']['bad_percent'];?>%"></i></dd>
                </dl>
              </div>
              <div class="btns"><span>您可对已购商品进行评价</span>
                <p><a href="<?php echo urlShop('member_order', 'index');?>" class="ncs-btn ncs-btn-red" target="_blank"><i class="icon-comment-alt"></i>评价商品</a></p>
              </div>
            </div>
            <div class="ncs-goods-title-nav">
          <ul id="comment_tab">
              <li data-type="all" class="current"><a href="javascript:void(0);"><?php echo $lang['goods_index_evaluation'];?>(<?php echo $output['goods_evaluate_info']['all'];?>)</a></li>
              <li data-type="1"><a href="javascript:void(0);">好评(<?php echo $output['goods_evaluate_info']['good'];?>)</a></li>
              <li data-type="2"><a href="javascript:void(0);">中评(<?php echo $output['goods_evaluate_info']['normal'];?>)</a></li> 
              <li data-type="3"><a href="javascript:void(0);">差评(<?php echo $output['goods_evaluate_info']['bad'];?>)</a></li>
          </ul></div>
            <!-- 商品评价内容部分 -->
            <div id="goodseval" class="ncs-commend-main"></div>
          </div>
        </div>
        <div class="ncg-salelog">
          <div class="ncs-goods-title-bar hd">
           <h4><a href="javascript:void(0);"><?php echo $lang['goods_index_sold_record'];?></a></h4>
          </div>
          <div class="ncs-goods-info-content bd" id="ncGoodsTraded">
            <div class="top">
              <div class="price"><?php echo $lang['goods_index_goods_price'];?><strong><?php echo $output['goods']['goods_price'];?></strong><?php echo $lang['goods_index_yuan'];?><span><?php echo $lang['goods_index_price_note'];?></span></div>
            </div>
            <!-- 成交记录内容部分 -->
            <div id="salelog_demo" class="ncs-loading"> </div>
          </div>
        </div>
        <div class="ncs-consult">
          <div class="ncs-goods-title-bar hd">
            <h4><a href="javascript:void(0);"><?php echo $lang['goods_index_goods_consult'];?></a></h4>
          </div>
          <div class="ncs-goods-info-content bd" id="ncGuestbook"> 
            <!-- 咨询留言内容部分 -->
            <div class="ncs-guestbook">
              <div id="cosulting_demo" class="ncs-loading"> </div>
            </div>
          </div>
        </div>
        <?php if(!empty($output['goods_commend']) && is_array($output['goods_commend']) && count($output['goods_commend'])>1){?>
        <div class="ncs-recommend">
          <div class="title">
            <h4><?php echo $lang['goods_index_goods_commend'];?></h4>
          </div>
          <div class="content">
            <ul>
              <?php foreach($output['goods_commend'] as $goods_commend){?>
              <?php if($output['goods']['goods_id'] != $goods_commend['goods_id']){?>
              <li>
                <dl>
                  <dt class="goods-name"><a href="<?php echo urlShop('goods', 'index', array('goods_id' => $goods_commend['goods_id']));?>" target="_blank" title="<?php echo $goods_commend['goods_jingle'];?>"><?php echo $goods_commend['goods_name'];?><em><?php echo $goods_commend['goods_jingle'];?></em></a></dt>
                  <dd class="goods-pic"><a href="<?php echo urlShop('goods', 'index', array('goods_id' => $goods_commend['goods_id']));?>" target="_blank" title="<?php echo $goods_commend['goods_jingle'];?>"><img src="<?php echo thumb($goods_commend, 240);?>" alt="<?php echo $goods_commend['goods_name'];?>"/></a></dd>
                  <dd class="goods-price"><?php echo $lang['currency'];?><?php echo $goods_commend['goods_price'];?></dd>
                </dl>
              </li>
              <?php }?>
              <?php }?>
            </ul>
            <div class="clear"></div>
          </div>
        </div>
        <?php }?>
      </div>
    </div>

  </div>
  <div class="viewPageRight">
      <div class="selecttc">
            <p class="selecttc_top">选择旅游的三大理由</p>
            <div class="reasonbg">
                <div class="reason_div">
                    <p class="reason_p1">价格透明</p>
                    <p class="reason_p2">透明团、无零负团费、低价有保障</p>
                    <span class="jgtmbg"></span>
                </div>
                <div class="reason_div">
                    <p class="reason_p1">海量线路</p>
                    <p class="reason_p2">万余条线路，提供跟团/自助/邮轮/签证/等预订服务</p>
                    <span class="hlxlbg"></span>
                </div>
                <div class="reason_div">
                    <p class="reason_p1">真实体验</p>
                    <p class="reason_p2">真实点评和原创游记 提供最真实的体验</p>
                    <span class="zstybg"></span>
                </div>
            </div>
        </div>

        <div id="guessBox" class="recommend">
          <p class="recommend_top">热门产品推荐</p>
          <div class="l_center">
            <?php if(!empty($output['goods_commend'])){foreach($output['goods_commend'] as $key=>$v){?>
            <div class="linebox">
              <a class="showpic none" href="<?php echo urlShop('goods', 'index', array('goods_id' => $goods_commend['goods_id']));?>" target="_blank" title="">
                <img alt="<?php echo $v['goods_name']?>" src="<?php echo thumb($v, 240);?>">
                <b class="img_ico1">&nbsp;</b>
              </a>
              <a class="lin_a" href="<?php echo urlShop('goods', 'index', array('goods_id' => $goods_commend['goods_id']));?>" title="<?php echo $v['goods_name']?>" target="_blank">
                <b class="ico_nub none"><div><?php echo $key+1?></div></b>
                <span class="long_name"><?php echo $v['goods_name']?></span>
              </a>
              <div class="linrbot">
                <span class="pri_sp"><b>¥</b><?php echo $v['goods_price']?></span>
              </div>
            </div>
            <?php }}?>
            </div></div>
  </div>
  <div class="clearfix"></div>
</div>
<!-- [//主体部分] -->


<form id="buynow_form" method="post" action="<?php echo SHOP_SITE_URL;?>/index.php">
  <input id="act" name="act" type="hidden" value="buy" />
  <input id="op" name="op" type="hidden" value="buy_step1" />
  <input id="cart_id" name="cart_id[]" type="hidden"/>
</form>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.charCount.js"></script> 
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.ajaxContent.pack.js" type="text/javascript"></script> 
<script src="<?php echo RESOURCE_SITE_URL;?>/js/sns.js" type="text/javascript" charset="utf-8"></script> 
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.F_slider.js" type="text/javascript" charset="utf-8"></script> 
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/waypoints.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.raty/jquery.raty.min.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.nyroModal/custom.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.poshytip.min.js" charset="utf-8"></script>
<link href="<?php echo RESOURCE_SITE_URL;?>/js/jquery.nyroModal/styles/nyroModal.css" rel="stylesheet" type="text/css" id="cssfile2" />
<script type="text/javascript">
/** 辅助浏览 **/
jQuery(function($){
	//产品图片
	$.getScript('<?php echo SHOP_RESOURCE_SITE_URL?>/js/ImageZoom.js', function(){
		var 
		zoomController,
		zoomControllerUl,
		zoomControllerUlLeft = 0,
		shell = $('#ncs-goods-picture'),
		shellPanel = shell.parent().hide(),
		heightOffset = 80,
		minGallerySize = [380, shellPanel.height() - heightOffset],
		imageZoom = new ImageZoom({
			shell: shell,
			basePath: '',
			levelASize: [60, 60],
			levelBSize: [360, 360],
			gallerySize: minGallerySize,
			onBeforeZoom: function(index, level){
				if(!zoomController){
					zoomController = shell.find('div.controller');
				}

				var 
				self = this,
				duration = 320,
				width = minGallerySize[0], 
				height = minGallerySize[1],
				zoomFx = function(){
					self.ops.gallerySize = [width, height];
					self.galleryPanel.stop().animate({width:width, height:height}, duration);
					shellPanel.stop().animate({height:height + heightOffset}, duration);
					zoomController.animate({width:width-22}, duration);
					shell.stop().animate({width:width}, duration);
				};
				if(level !== this.level && this.level !== 0){
					if(this.level === 1 && level > 1){
						height = Math.max(520, shellPanel.height());
						width = shellPanel.width();
						zoomFx();
					}
					else if(level === 1){
						zoomFx();
					}
				}
			},
			onZoom: function(index, level, prevIndex){
				if(index !== prevIndex){
					if(!zoomControllerUl){
						zoomControllerUl = zoomController.find('ul').eq(0);
					}
					var 
					width = 76, 
					ops = this.ops,
					count = ops.items.length,
					panelVol = ~~((zoomController.width() + 10)/width),
					minLeft = width * (panelVol - count),
					left = Math.min(0, Math.max(minLeft, -width * ~~(index-panelVol/2)));

					if(zoomControllerUlLeft !== left){
						zoomControllerUl.stop().animate({left: left}, 320);
						zoomControllerUlLeft = left;
					}
				}
				shell.find('a.prev,a.next')[level<3 ? 'removeClass' : 'addClass']('hide');
				shell.find('a.close').css('display', [level>1 ? 'block' : 'none']);
			},
			items: [ 
	                <?php if (!empty($output['goods_image'])) {?>
	                <?php echo implode(',', $output['goods_image']);?>
	                <?php }?>
					]
		});
		shell.data('imageZoom', imageZoom);

		shellPanel.show();
	});

});
</script> 
<script>
    //收藏分享处下拉操作
    jQuery.divselect = function(divselectid,inputselectid) {
      var inputselect = $(inputselectid);
      $(divselectid).mouseover(function(){
          var ul = $(divselectid+" ul");
          ul.slideDown("fast");
          if(ul.css("display")=="none"){
              ul.slideDown("fast");
          }
      });
      $(divselectid).live('mouseleave',function(){
          $(divselectid+" ul").hide();
      });
    };
$(function(){
    // 加入购物车
    $('a[nctype="addcart_submit"]').click(function(){
        addcart(<?php echo $output['goods']['goods_id'];?>, checkQuantity());
    });
    // 立即购买
    $('a[nctype="buynow_submit"]').click(function(){
        buynow(<?php echo $output['goods']['goods_id']?>,checkQuantity());
    });

    //浮动导航  waypoints.js
    $('#main-nav').waypoint(function(event, direction) {
        $(this).parent().parent().parent().toggleClass('sticky', direction === "down");
        event.stopPropagation();
    });

    // 分享收藏下拉操作
    $.divselect("#handle-l");
    $.divselect("#handle-r");

    // 规格选择
    $('dl[nctype="nc-spec"]').find('a').each(function(){
        $(this).click(function(){
            if ($(this).hasClass('hovered')) {
                return false;
            }
            $(this).parents('ul:first').find('a').removeClass('hovered');
            $(this).addClass('hovered');
            checkSpec();
        });
    });

});

function checkSpec() {
    var spec_param = <?php echo $output['spec_list'];?>;
    var spec = new Array();
    $('ul[nctyle="ul_sign"]').find('.hovered').each(function(){
        var data_str = ''; eval('data_str =' + $(this).attr('data-param'));
        spec.push(data_str.valid);
    });
    spec1 = spec.sort(function(a,b){
        return a-b;
    });
    var spec_sign = spec1.join('|');
    $.each(spec_param, function(i, n){
        if (n.sign == spec_sign) {
            window.location.href = n.url;
        }
    });
}

// 验证购买数量
function checkQuantity(){
    var quantity = parseInt($("#quantity").val());
    if (quantity < 1) {
        alert("<?php echo $lang['goods_index_pleaseaddnum'];?>");
        $("#quantity").val('1');
        return false;
    }
    max = parseInt($('[nctype="goods_stock"]').text());
    if(quantity > max){
        alert("<?php echo $lang['goods_index_add_too_much'];?>");
        return false;
    }
    return quantity;
}

// 规格页面跳转
// function 

// 立即购买js
function buynow(goods_id,quantity){
<?php if ($_SESSION['is_login'] !== '1'){?>
	login_dialog();
<?php }else{?>
    if (!quantity) {
        return;
    }
    $("#cart_id").val(goods_id+'|'+quantity);
    $("#buynow_form").submit();
<?php }?>
}
$(function(){
    //选择地区查看运费
    $('#transport_pannel>a').click(function(){
    	var id = $(this).attr('nctype');
    	if (id=='undefined') return false;
    	var _self = this,tpl_id = '<?php echo $output['goods']['transport_id'];?>';
	    var url = 'index.php?act=goods&op=calc&rand='+Math.random();
	    $('#transport_price').css('display','none');
	    $('#loading_price').css('display','');
	    $.getJSON(url, {'id':id,'tid':tpl_id}, function(data){
	    	if (data == null) return false;
	        if(data != 'undefined') {$('#nc_kd').html(data);}else{$('#nc_kd').html('');}
	        $('#transport_price').css('display','');
	    	$('#loading_price').css('display','none');
	        $('#ncrecive').html($(_self).html());
	    });
    });
    <?php if($output['goods']['goods_show'] == '1'){?>
    $("#nc-bundling").load('index.php?act=goods&op=get_bundling&goods_id=<?php echo $output['goods']['goods_id'];?>&store_id=<?php echo $output['goods']['store_id'];?>', function(){
        if($(this).html() != '') {
            $(this).parents('.ncs-promotion:first').show();
        }
    });
    <?php }?>
    $("#salelog_demo").load('index.php?act=goods&op=salelog&goods_id=<?php echo $output['goods']['goods_id'];?>&store_id=<?php echo $output['goods']['store_id'];?>', function(){
        // Membership card
        $(this).find('[nctype="mcard"]').membershipCard({type:'shop'});
    });
	$("#cosulting_demo").load('index.php?act=goods&op=cosulting&goods_id=<?php echo $output['goods']['goods_id'];?>&store_id=<?php echo $output['goods']['store_id'];?>', function(){
		// Membership card
		$(this).find('[nctype="mcard"]').membershipCard({type:'shop'});
	});
});

/** goods.php **/
$(function(){	
	// 商品内容部分折叠收起侧边栏控制
	$('#fold').click(function(){
  		$('.ncs-goods-layout').toggleClass('expanded');
	});
	// 商品内容介绍Tab样式切换控制
	$('#categorymenu').find("li").click(function(){
		$('#categorymenu').find("li").removeClass('current');
		$(this).addClass('current');
	});
	// 商品详情默认情况下显示全部
	$('#tabGoodsIntro').click(function(){
		$('.bd').css('display','');
		$('.hd').css('display','');	
	});
	// 点击评价隐藏其他以及其标题栏
	$('#tabGoodsRate').click(function(){
		$('.bd').css('display','none');
		$('#ncGoodsRate').css('display','');
		$('.hd').css('display','none');
	});
	// 点击成交隐藏其他以及其标题
	$('#tabGoodsTraded').click(function(){
		$('.bd').css('display','none');
		$('#ncGoodsTraded').css('display','');
		$('.hd').css('display','none');
	});
	// 点击咨询隐藏其他以及其标题
	$('#tabGuestbook').click(function(){
		$('.bd').css('display','none');
		$('#ncGuestbook').css('display','');
		$('.hd').css('display','none');
	});
	//商品排行Tab切换
	$(".ncs-top-tab > li > a").mouseover(function(e) {
		if (e.target == this) {
			var tabs = $(this).parent().parent().children("li");
			var panels = $(this).parent().parent().parent().children(".ncs-top-panel");
			var index = $.inArray(this, $(this).parent().parent().find("a"));
			if (panels.eq(index)[0]) {
				tabs.removeClass("current ").eq(index).addClass("current ");
				panels.addClass("hide").eq(index).removeClass("hide");
			}
		}
	});
	//信用评价动态评分打分人次Tab切换
	$(".ncs-rate-tab > li > a").mouseover(function(e) {
		if (e.target == this) {
			var tabs = $(this).parent().parent().children("li");
			var panels = $(this).parent().parent().parent().children(".ncs-rate-panel");
			var index = $.inArray(this, $(this).parent().parent().find("a"));
			if (panels.eq(index)[0]) {
				tabs.removeClass("current ").eq(index).addClass("current ");
				panels.addClass("hide").eq(index).removeClass("hide");
			}
		}
	});
		
//触及显示缩略图	
	$('.goods-pic > .thumb').hover(
		function(){
			$(this).next().css('display','block');
		},
		function(){
			$(this).next().css('display','none');
		}
	);
	
	/* 商品购买数量增减js */
	// 增加
	$('.increase').click(function(){
		num = parseInt($('#quantity').val());
	    <?php if (!empty($output['goods']['upper_limit'])) {?>
	    max = <?php echo $output['goods']['upper_limit'];?>;
	    if(num >= max){
	        alert('最多限购'+max+'件');
	        return false;
	    }
	    <?php } ?>
		max = parseInt($('[nctype="goods_stock"]').text());
		if(num < max){
			$('#quantity').val(num+1);
		}
	});
	//减少
	$('.decrease').click(function(){
		num = parseInt($('#quantity').val());
		if(num > 1){
			$('#quantity').val(num-1);
		}
	});
	
	// 搜索价格不能填写非数字。
	var re = /^[1-9]+[0-9]*(\.\d*)?$|^0(\.\d*)?$/;
	$('input[name="start_price"]').change(function(){
		if(!re.test($(this).val())){
			$(this).val('');
		}
	});
	$('input[name="end_price"]').change(function(){
		if(!re.test($(this).val())){
			$(this).val('');
		}
	});
});

/* add cart */
function addcart(goods_id, quantity)
{
	if (!quantity) return false;
    var url = 'index.php?act=cart&op=add';
    $.getJSON(url, {'goods_id':goods_id, 'quantity':quantity}, function(data){
    	if(data != null){
    		if (data.state)
            {
                $('#bold_num').html(data.num);
                $('#bold_mly').html(price_format(data.amount));
                $('.ncs-cart-popup').fadeIn('fast');
//                 setTimeout(slideUp_fn, 5000);
                // 头部加载购物车信息
                load_cart_information();
            }
            else
            {
                alert(data.msg);
            }
    	}
    });
}
// 显示举报下拉链接
$(document).ready(function() {
	$(".ncs-inform").hover(function() {
		$(this).addClass("hover");
	},
	function() {
		$(this).removeClass("hover");
	});
})

//评价列表
$(document).ready(function(){
    $('#comment_tab').on('click', 'li', function() {
        $('#comment_tab li').removeClass('current');
        $(this).addClass('current');
        load_goodseval($(this).attr('data-type'));
    });

    load_goodseval('all');

    function load_goodseval(type) {
        var url = '<?php echo urlShop('goods', 'comments', array('goods_id' => $output['goods']['goods_id']));?>';
        url += '&type=' + type;
        $("#goodseval").load(url, function(){
            $(this).find('[nctype="mcard"]').membershipCard({type:'shop'});
        });
    }
});
</script> 
