<?php defined('InShopNC') or exit('Access Invalid!');?>
<!doctype html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>">
<title><?php echo $output['html_title'];?></title>
<meta name="keywords" content="<?php echo $output['seo_keywords']; ?>" />
<meta name="description" content="<?php echo $output['seo_description']; ?>" />
<meta name="author" content="">
<meta name="copyright" content="">
<?php echo html_entity_decode($GLOBALS['setting_config']['qq_appcode'],ENT_QUOTES); ?><?php echo html_entity_decode($GLOBALS['setting_config']['sina_appcode'],ENT_QUOTES); ?><?php echo html_entity_decode($GLOBALS['setting_config']['share_qqzone_appcode'],ENT_QUOTES); ?><?php echo html_entity_decode($GLOBALS['setting_config']['share_sinaweibo_appcode'],ENT_QUOTES); ?>
<style type="text/css">
body {
_behavior: url(<?php echo SHOP_TEMPLATES_URL;
?>/css/csshover.htc);
}
</style>
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/base.css" rel="stylesheet" type="text/css">
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/home_header.css" rel="stylesheet" type="text/css">
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/home_login.css" rel="stylesheet" type="text/css">
<link href="<?php echo SHOP_RESOURCE_SITE_URL;?>/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
  <link rel="stylesheet" href="<?php echo SHOP_RESOURCE_SITE_URL;?>/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="<?php echo RESOURCE_SITE_URL;?>/js/html5shiv.js"></script>
      <script src="<?php echo RESOURCE_SITE_URL;?>/js/respond.min.js"></script>
<![endif]-->
<!--[if IE 6]>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/IE6_PNG.js"></script>
<script>
DD_belatedPNG.fix('.pngFix');
</script>
<script>
// <![CDATA[
if((window.navigator.appName.toUpperCase().indexOf("MICROSOFT")>=0)&&(document.execCommand))
try{
document.execCommand("BackgroundImageCache", false, true);
   }
catch(e){}
// ]]>
</script>
<![endif]-->
<script>
var COOKIE_PRE = '<?php echo COOKIE_PRE;?>';var _CHARSET = '<?php echo strtolower(CHARSET);?>';var SITEURL = '<?php echo SHOP_SITE_URL;?>';var SHOP_SITE_URL = '<?php echo SHOP_SITE_URL;?>';var RESOURCE_SITE_URL = '<?php echo RESOURCE_SITE_URL;?>';var RESOURCE_SITE_URL = '<?php echo RESOURCE_SITE_URL;?>';var SHOP_TEMPLATES_URL = '<?php echo SHOP_TEMPLATES_URL;?>';
</script>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.js"></script>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/common.js" charset="utf-8"></script>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery-ui/jquery.ui.js"></script>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.validation.min.js"></script>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.masonry.js"></script>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<script type="text/javascript">
var PRICE_FORMAT = '<?php echo $lang['currency'];?>%s';
$(function(){
	//首页左侧分类菜单
	$(".category ul.menu").find("li").each(
		function() {
			$(this).hover(
				function() {
				    var cat_id = $(this).attr("cat_id");
					var menu = $(this).find("div[cat_menu_id='"+cat_id+"']");
					menu.show();
					$(this).addClass("hover");
					if(menu.attr("hover")>0) return;
					menu.masonry({itemSelector: 'dl'});
					var menu_height = menu.height();
					if (menu_height < 60) menu.height(80);
					menu_height = menu.height();
					var li_top = $(this).position().top;
					if ((li_top > 60) && (menu_height >= li_top)) $(menu).css("top",-li_top+50);
					if ((li_top > 150) && (menu_height >= li_top)) $(menu).css("top",-li_top+90);
					if ((li_top > 240) && (li_top > menu_height)) $(menu).css("top",menu_height-li_top+90);
					if (li_top > 300 && (li_top > menu_height)) $(menu).css("top",60-menu_height);
					if ((li_top > 40) && (menu_height <= 120)) $(menu).css("top",-5);
					menu.attr("hover",1);
				},
				function() {
					$(this).removeClass("hover");
				    var cat_id = $(this).attr("cat_id");
					$(this).find("div[cat_menu_id='"+cat_id+"']").hide();
				}
			);
		}
	);
	$(".head-user-menu dl").hover(function() {
		$(this).addClass("hover");
	},
	function() {
		$(this).removeClass("hover");
	});
	$('.head-user-menu .my-mall').mouseover(function(){// 最近浏览的商品
		load_history_information();
		$(this).unbind('mouseover');
	});
	$('.head-user-menu .my-cart').mouseover(function(){// 运行加载购物车
		load_cart_information();
		$(this).unbind('mouseover');
	});
	$('#button').click(function(){
	    if ($('#keyword').val() == '') {
		    return false;
	    }
	});
});
</script>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 24px;
}
-->
</style>


</head>
<body>
<?php require_once template('layout/layout_top');?>
<!-- [导航头部部分] -->
<div id="travelHeader">
          <div class="logo">
            <a href="<?php echo SHOP_SITE_URL;?>"><img src="<?php echo SHOP_TEMPLATES_URL;?>/images/logo.jpg"/></a>
          </div>

          <!--旅游搜索框-->
          <form class="h_search" action="<?php echo SHOP_SITE_URL;?>" method="get">
              <input name="act" id="search_act" value="search" type="hidden"/>
              <input name="cate_id" id="search_attr" type="hidden"/>
              <input type="text" class="text_in" name="keyword">
              <div class="select_box">
                  <a id="search_btn">
                      全部
                      <span class="img_wrap"><img src="<?php echo SHOP_TEMPLATES_URL;?>/images/slide.gif"/></span>
                  </a>

                  <div id="choice">
                    <?php $i=0;foreach($output['show_goods_class'] as $vals){?>
                      <span data-cateid="<?php echo $vals['gc_id'];?>"><?php echo $vals['gc_name'];?></span>
                    <?php }?>
                  </div>

              </div>
              <input type="submit" class="search" value="搜索">
              <div class="clearfix"></div>
          </form>
          <!--//旅游搜索框结束-->
</div>

<div id="header">
    <div class="commonhead">
      <div id="menuNavOuter">
        <div id="menuNavWrapper">
          <div id="menuNavPanel">
            <ul id="menuNav">
              <li <?php if(!$_GET['cate_id']){?>class="current"<?php }?>>
                <a href="<?php echo SHOP_SITE_URL;?>">综合首页</a>
                <div class="all-category">
                <?php require template('layout/home_goods_class_extend');?>
                </div>
              </li>
              <?php $i=0;foreach($output['show_goods_class'] as $vals){$i++;if($i>=11) break;?>
              <li <?php if($vals['gc_id']==$_GET['cate_id']){?>class="current"<?php }?>>
              
                <a href="
                <?php 
                switch ($vals['gc_id']) {
                  case '530'://春芝堂商场
                    echo 'http://www.chinaspringtown.com';
                    break;
                  default:
                    echo urlShop('index','index',array('cate_id'=> $vals['gc_id']));
                    break;
                }
                ?>" target="_blank"><?php echo $vals['gc_name'];?>
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <?php if(!empty($vals['class2'])){foreach($vals['class2'] as $k=>$v){?>
                  <a <?php if($k==0){?>class="scenery-submenu1"<?php }?> href="<?php echo urlShop('search','index',array('cate_id'=> $v['gc_id']));?>"><?php echo $v['gc_name']?></a>
                  <?php }}?>
                </div>
              </li>
              <?php }?>
             

            </ul>
            <div id="menuMyTc">
              <a href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_snsindex&op=index">
                我的旅游
                <i></i>
              </a>
              <div data-height="150px">
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_order">订单中心</a>
                <!-- 需要分割线 -->
                <i></i>
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_favorites&op=fglist">我的收藏</a>
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=home&op=message">我的信息</a>
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_points">我的积分</a>
              </div>
            </div>
          </div>
        </div>
        <!-- <i id="submenuNavBg"></i> -->
      </div>
    </div>
</div>
<!-- [//导航头部部分] -->



<?php include template('home/cur_local');?>
<?php require_once($tpl_file);?>
<?php require_once template('footer');?>
</body>
</html>
