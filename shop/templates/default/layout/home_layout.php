<?php defined('InShopNC') or exit('Access Invalid!');?>
<!doctype html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>">
<title><?php echo $output['html_title'];?></title>
<meta name="keywords" content="<?php echo $output['seo_keywords']; ?>" />
<meta name="description" content="<?php echo $output['seo_description']; ?>" />
<meta name="author" content="ShopNC">
<meta name="copyright" content="ShopNC Inc. All Rights Reserved">
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
<div id="header">
    <div class="commonhead">
      <span id="bulletin"></span>

      <div id="headerWrapper">
        <div id="pageheader" class="clearfix">
          <div class="logo_style">
                      <img src="<?php echo SHOP_TEMPLATES_URL;?>/images/topnormal.jpg" alt="" srcset="images/mactopnormal.jpg 2x"/>
            <h1 class="logo" title="旅游">
              <a href="" title="旅游"></a>
            </h1>
          </div>
          <div>
            <a target="_blank" href="">
              <img src="<?php echo SHOP_TEMPLATES_URL;?>/images/app.png" alt="手机客户端"></a>
          </div>
        </div>
      </div>
      <div id="menuNavOuter">
        <div id="menuNavWrapper">
          <div id="menuNavPanel">
            <ul id="menuNav">
              <li class="current">
                <a href="<?php echo SHOP_SITE_URL;?>">首页</a>
                <div class="all-category">
                <?php require template('layout/home_goods_class_extend');?>
                </div>
              </li>
              <li>
                <!-- <p>
                  <span>行业领先</span>
                </p> -->
                <a href="http://www.ly.com/scenery/" onclick="_tcTraObj._tcTrackEvent('scenery5353frist', 'Pcnavigation', 'CN首页','30');">
                  景点
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="scenery-submenu1" href="http://www.ly.com/scenery/" onclick="_tcTraObj._tcTrackEvent('guonei5353scsecond', 'Pcnavigation', 'CN首页','30');">国内景点</a>
                  <a href="http://www.ly.com/globalscenery/" onclick="_tcTraObj._tcTrackEvent('global5353scsecond', 'Pcnavigation', 'CN首页','30');">国际景点</a>
                  <a href="http://www.ly.com/globalscenery/gangaotai/" onclick="_tcTraObj._tcTrackEvent('gangaotai5353scsecond', 'Pcnavigation', 'CN首页','30');">港澳台门票</a>
                  <a href="http://www.ly.com/zizhuyou/" onclick="_tcTraObj._tcTrackEvent('jiuplusjing5353scsecond', 'Pcnavigation', 'CN首页','30');">景点+酒店</a>
                  <a href="http://www.ly.com/bustour/searchlist.html" onclick="_tcTraObj._tcTrackEvent('busscenery5353scsecond', 'Pcnavigation', 'CN首页','30');">巴士跟团游</a>
                  <a href="http://www.ly.com/scenery/chwl/" onclick="_tcTraObj._tcTrackEvent('chwl5353scsecond', 'Pcnavigation', 'CN首页','30');">当地玩乐</a>
                  <a href="http://www.ly.com/scenery/njl/SearchList_0_0_0__0_0.html" onclick="_tcTraObj._tcTrackEvent('njl5353scsecond', 'Pcnavigation', 'CN首页','30');">农家乐</a>
                  <a href="http://www.ly.com/activity/" onclick="_tcTraObj._tcTrackEvent('activity5353scsecond', 'Pcnavigation', 'CN首页','30');">景点活动</a>
                  <a class="menuorder" href="http://member.ly.com/Scenery/SceneryMemberOrderList.aspx">
                    景点订单
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>
              <li>
                <a href="http://www.ly.com/hotel/" onclick="_tcTraObj._tcTrackEvent('hotelfirst5353', 'Pcnavigation', 'CN首页','30');">
                  酒店
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="hotel-submenu1" href="http://www.ly.com/hotel/" onclick="_tcTraObj._tcTrackEvent('guonei5353hosecond', 'Pcnavigation', 'CN首页','30');">国内酒店</a>
                  <a href="http://tuan.ly.com/" onclick="_tcTraObj._tcTrackEvent('tuangou5353hosecond', 'Pcnavigation', 'CN首页','30');">团购酒店</a>
                  <a href="http://www.ly.com/zizhuyou/" onclick="_tcTraObj._tcTrackEvent('jiuplusjing5353hosecond', 'Pcnavigation', 'CN首页','30');">酒店+景点</a>
                  <a href="http://www.ly.com/gangaohotel/" onclick="_tcTraObj._tcTrackEvent('gangaotai5353hosecond', 'Pcnavigation', 'CN首页','30');">港澳台酒店</a>
                  <a href="http://globalhotel.ly.com/" onclick="_tcTraObj._tcTrackEvent('international5353hosecond', 'Pcnavigation', 'CN首页','30');">国际酒店</a>
                  <a href="http://www.ly.com/hotel/kezhan/" style="position: relative;" onclick="_tcTraObj._tcTrackEvent('minsu5353hosecond', 'Pcnavigation', 'CN首页','30');">
                    民宿客栈
                    <!-- <span class="scmnew"></span> -->
                  </a>
                  <a href="http://www.ly.com/hotel/liansuo/" rel="nofollow" onclick="_tcTraObj._tcTrackEvent('pinpai5353hosecond', 'Pcnavigation', 'CN首页','30');">品牌汇</a>
                  <a class="menuorder" href="http://member.ly.com/Hotel/HotelMemberOrderList.aspx">
                    酒店订单
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>
              <li>
                <a href="http://www.ly.com/FlightQuery.aspx" onclick="_tcTraObj._tcTrackEvent('Flightfirst5353', 'Pcnavigation', 'CN首页','30');">
                  机票
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="flight-submenu1" href="http://www.ly.com/FlightQuery.aspx" onclick="_tcTraObj._tcTrackEvent('guonei5353flisecond', 'Pcnavigation', 'CN首页','30');">国内机票</a>
                  <a href="http://www.ly.com/iflight/" onclick="_tcTraObj._tcTrackEvent('guoji5353flisecond', 'Pcnavigation', 'CN首页','30');">国际机票</a>
                  <a class="menuorder" href="http://member.ly.com/Flight/FlightMemberOrderList.aspx">
                    机票订单
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>
              <li>
                <a href="http://www.ly.com/huochepiao/train/" onclick="_tcTraObj._tcTrackEvent('huochepiaofirst5353', 'Pcnavigation', 'CN首页','30');">火车</a>
              </li>
                            <li>
                <a href="http://bus.ly.com/" onclick="_tcTraObj._tcTrackEvent('busfirst5353', 'Pcnavigation', 'CN首页','30');">汽车</a>
              </li>
              <li>
              <!--  <p>
                  <span>酒+景</span>
                </p> -->
                <a href="http://www.ly.com/zizhuyou/" onclick="_tcTraObj._tcTrackEvent('Zhoubianyoufirst5353', 'Pcnavigation', 'CN首页','30');">
                  周边游
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="zmy-submenu1" href="http://www.ly.com/zizhuyou/" onclick="_tcTraObj._tcTrackEvent('jingplusjiu5353zhousecond', 'Pcnavigation', 'CN首页','30');">景点+酒店</a>
                  <a href="http://www.ly.com/zizhuyou/temai/" onclick="_tcTraObj._tcTrackEvent('temai5353zhousecond', 'Pcnavigation', 'CN首页','30');">周边特卖</a>
                  <a href="http://www.ly.com/zizhuyou/qinzi/" onclick="_tcTraObj._tcTrackEvent('qinzi5353zhousecond', 'Pcnavigation', 'CN首页','30');"><em>欢度六一<i></i></em>周边亲子</a>
                  <a href="http://www.ly.com/zizhuyou/fivestar-pc/" onclick="_tcTraObj._tcTrackEvent('ka5353zhousecond', 'Pcnavigation', 'CN首页','30');">周末卡</a>
                  <a href="http://www.ly.com/scenery/chwl/" onclick="_tcTraObj._tcTrackEvent('cjwl5353zhousecond', 'Pcnavigation', 'CN首页','30');">当地玩乐</a>
                  <a href="http://www.ly.com/bustour/searchlist.html" onclick="_tcTraObj._tcTrackEvent('bus5353zhousecond', 'Pcnavigation', 'CN首页','30');">巴士跟团游</a>
                  <a href="http://www.ly.com/scenery/njl/SearchList_0_0_0__0_0.html" onclick="_tcTraObj._tcTrackEvent('njl5353zhousecond', 'Pcnavigation', 'CN首页','30');">农家乐</a>
                  <a href="http://www.ly.com/globalscenery/gangaotai/" onclick="_tcTraObj._tcTrackEvent('gangaotai5353zhousecond', 'Pcnavigation', 'CN首页','30');">港澳台门票</a>
                  <a href="http://www.ly.com/scenery/" onclick="_tcTraObj._tcTrackEvent('scenery5353zhousecond', 'Pcnavigation', 'CN首页','30');">景点</a>
                  <a class="menuorder" href="http://member.ly.com/zizhuyou/orderlist.aspx">
                    周边游订单
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>
              <li>
                <a href="http://gny.ly.com/guoneiyou/" onclick="_tcTraObj._tcTrackEvent('Guoneiyoufirst5353', 'Pcnavigation', 'CN首页','30');">国内游</a>
              </li>
              <li>
                <p>
                                <em style="right:20px">暑期惠<i></i></em>
                               </p>
                <a href="http://www.ly.com/dujia/" onclick="_tcTraObj._tcTrackEvent('Dujiafirst5353', 'Pcnavigation', 'CN首页','30');">
                  出境游
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="dujia-submenu1" href="http://www.ly.com/dujia/" onclick="_tcTraObj._tcTrackEvent('Dujia5353dusecond', 'Pcnavigation', 'CN首页','30');">出境首页</a>
                  <a href="http://www.ly.com/dujia/group/" id="group" mname="group" onclick="_tcTraObj._tcTrackEvent('gentuan5353dusecond', 'Pcnavigation', 'CN首页','30');">跟团游</a>
                  <a href="http://www.ly.com/dujia/freetour/" id="freetour" mname="freetour" onclick="_tcTraObj._tcTrackEvent('ziyouxing5353dusecond', 'Pcnavigation', 'CN首页','30');">自由行</a>
                  <a href="http://www.ly.com/globalscenery/" onclick="_tcTraObj._tcTrackEvent('globle5353dusecond', 'Pcnavigation', 'CN首页','30');">国际景点</a>
                  <a href="http://www.ly.com/globalscenery/gangaotai/" onclick="_tcTraObj._tcTrackEvent('gangaotai5353dusecond', 'Pcnavigation', 'CN首页','30');">港澳台门票</a>
                  <a href="http://www.ly.com/dujia/temai/" onclick="_tcTraObj._tcTrackEvent('temai5353dusecond', 'Pcnavigation', 'CN首页','30');">出境特卖</a>
                  <a href="http://www.ly.com/dujia/yushou/" onclick="_tcTraObj._tcTrackEvent('yushou5353dusecond', 'Pcnavigation', 'CN首页','30');">出境预售</a>
                  <a href="http://www.ly.com/dujia/schedule.html" onclick="_tcTraObj._tcTrackEvent('dingzhi5353dusecond', 'Pcnavigation', 'CN首页','30');">出境定制</a>
                  <a target="_blank" href="http://www.ly.com/zhuanti/chujingbao/" onclick="_tcTraObj._tcTrackEvent('giftcard5353dusecond', 'Pcnavigation', 'CN首页','30');">礼品卡</a>
                  <a class="menuorder" href="http://member.ly.com/dujia/DujiaOrderList.aspx">
                    出境游订单
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>
              <li>
                <p>
                                <em style="right:16px">HOT<i></i></em>
                               </p>
                <a href="http://www.ly.com/youlun/" onclick="_tcTraObj._tcTrackEvent('Youlunfirst5353', 'Pcnavigation', 'CN首页','30');">
                  邮轮
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="youlun-submenu1" href="http://www.ly.com/youlun/" onclick="_tcTraObj._tcTrackEvent('guoji5353yousecond', 'Pcnavigation', 'CN首页','30');">邮轮首页</a>
                  <a href="http://www.ly.com/youlun/yuanyang/" mname="yuanyang" onclick="_tcTraObj._tcTrackEvent('yuanyang5353yousecond', 'Pcnavigation', 'CN首页','30');">远洋航线</a>
                  <a href="http://www.ly.com/youlun/guonei/" mname="youlun/guonei" onclick="_tcTraObj._tcTrackEvent('guonei5353yousecond', 'Pcnavigation', 'CN首页','30');">国内航线</a>
                  <a href="http://www.ly.com/youlun/baochuan.html" onclick="_tcTraObj._tcTrackEvent('baochuan5353yousecond', 'Pcnavigation', 'CN首页','30');">包船专区</a>
                  <a href="http://www.ly.com/youlun/temai/" onclick="_tcTraObj._tcTrackEvent('zaoding5353yousecond', 'Pcnavigation', 'CN首页','30');">邮轮特卖</a>
                  <a href="http://www.ly.com/zhuanti/cruise-shipcard/" target="_blank" onclick="_tcTraObj._tcTrackEvent('giftcard5353yousecond', 'Pcnavigation', 'CN首页','30');">礼品卡</a>
                  <a href="http://www.ly.com/youlun/parentstour/" onclick="_tcTraObj._tcTrackEvent('bama5353yousecond', 'Pcnavigation', 'CN首页','30');">爸妈游</a>
                                    <a href="http://www.ly.com/youlun/gonglve/" onclick="_tcTraObj._tcTrackEvent('chuandui5353yousecond', 'Pcnavigation', 'CN首页','30');">船队</a>
                  <a class="menuorder" href="http://member.ly.com/youlun/YoulunOrderList.aspx">
                    邮轮订单
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>
              <li>
                <a href="http://www.ly.com/dujia/visa/" onclick="_tcTraObj._tcTrackEvent('Qianzhengfirst5353', 'Pcnavigation', 'CN首页','30');">签证</a>
              </li>
              <li>
                <a href="http://tuan.ly.com/" onclick="_tcTraObj._tcTrackEvent('Tuanfirst5353', 'Pcnavigation', 'CN首页','30');">
                  团购
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="tuan-submenu1" href="http://tuan.ly.com/hotel/" onclick="_tcTraObj._tcTrackEvent('jiutuan5353tuansecond', 'Pcnavigation', 'CN首页','30');">酒店团购</a>
                  <a href="http://tuan.ly.com/scenery/" onclick="_tcTraObj._tcTrackEvent('jingtuan5353tuansecond', 'Pcnavigation', 'CN首页','30');">景点团购</a>
                  <a href="http://tuan.ly.com/holiday/" onclick="_tcTraObj._tcTrackEvent('chujingtuan5353tuansecond', 'Pcnavigation', 'CN首页','30');">出境游团购</a>
                  <a href="http://tuan.ly.com/youlun/" onclick="_tcTraObj._tcTrackEvent('youtuan5353tuansecond', 'Pcnavigation', 'CN首页','30');">邮轮团购</a>
                  <a href="http://tuan.ly.com/visa/" onclick="_tcTraObj._tcTrackEvent('qiantuan5353tuansecond', 'Pcnavigation', 'CN首页','30');">签证团购</a>
                  <a href="http://www.ly.com/zhuanti/huiyuanri/" target="_blank" onclick="_tcTraObj._tcTrackEvent('membertuan5353tuansecond', 'Pcnavigation', 'CN首页','30');">会员日团购</a>
                </div>
              </li>
              <li>
                <a href="http://go.ly.com/" onclick="_tcTraObj._tcTrackEvent('Gonglvefirst5353', 'Pcnavigation', 'CN首页','30');">
                  攻略
                  <i></i>
                </a>
                <div class="submenu-nav">
                  <a class="gl-submenu1" href="http://go.ly.com/" onclick="_tcTraObj._tcTrackEvent('glsq5353gonglvesecond', 'Pcnavigation', 'CN首页','30');">攻略社区</a>
                  <a href="http://go.ly.com/gonglve/" onclick="_tcTraObj._tcTrackEvent('gnmdd5353gonglvesecond', 'Pcnavigation', 'CN首页','30');">国内目的地</a>
                  <a href="http://go.ly.com/abroad/" onclick="_tcTraObj._tcTrackEvent('jwmdd5353gonglvesecond', 'Pcnavigation', 'CN首页','30');">境外目的地</a>
                  <a href="http://go.ly.com/youji/" onclick="_tcTraObj._tcTrackEvent('yj5353gonglvesecond', 'Pcnavigation', 'CN首页','30');">游记</a>
                  <a href="http://go.ly.com/user/" onclick="_tcTraObj._tcTrackEvent('grzy5353gonglvesecond', 'Pcnavigation', 'CN首页','30');">个人主页</a>
                  <a class="menuorder" href="http://go.ly.com/youji/edit/">
                    写游记
                    <i>&gt;&gt;</i>
                  </a>
                </div>
              </li>

            </ul>
            <div id="menuMyTc">
              <a href="http://member.ly.com/">
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
