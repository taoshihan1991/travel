<?php defined('InShopNC') or exit('Access Invalid!');?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, inital-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no;" />
    <meta name="author" content="sdqx"/>
    <meta name="keywords" content="<?php echo $output['seo_keywords']; ?>"/>
    <meta name="description" content="<?php echo $output['seo_description']; ?>"/>
    <title><?php echo $output['html_title'];?></title>
    <link href="<?php echo SHOP_TEMPLATES_URL;?>/index/css/layout.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo SHOP_TEMPLATES_URL;?>/index/css/media.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo SHOP_TEMPLATES_URL;?>/index/css/index.css" rel="stylesheet" type="text/css">
    <script src="<?php echo SHOP_TEMPLATES_URL;?>/index/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!--[if IE 6]>
    <script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL;?>/index/js/Png.js"></script>
    <script type="text/javascript">
        EvPNG.fix('*');
    </script>
    <![endif]-->

    <!-- 扩展样式和js -->
    <link href="<?php echo SHOP_TEMPLATES_URL;?>/index/css/extend.css" rel="stylesheet" type="text/css"/>
    <script src="<?php echo SHOP_TEMPLATES_URL;?>/index/js/extend.js" type="text/javascript"></script>
    <script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL;?>/index/js/jquery.SuperSlide.2.1.1.js"></script>

</head>
<body>

<div id="topScollBanner">
            <div class="hd">
                <ul>
                <?php if(is_array($output['topBannerList'])){foreach($output['topBannerList'] as $k=>$v){?>
                <li><?php echo $k+1;?></li>
                <?php }}?>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <?php if(is_array($output['topBannerList'])){foreach($output['topBannerList'] as $v){?>
                    <li><a href="<?php echo $v['url']?>" target="_blank"><img src="<?php echo $v['pic']?>" alt="<?php echo $v['text']?>"/></a></li>
                    <?php }}?>
                </ul>
            </div>
        <script type="text/javascript">
        $("#topScollBanner").slide({mainCell:".bd ul",autoPlay:true});
        </script>
</div>


<!--菜单1-->
<div class="menu_one_wrap">
    <!-- logo-->
    <a href="#" class="logo"><img src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/logo.png"></a>
    <!-- logo 结束-->
    <!-- menu  one-->
    <div class="menu_one">
        <a href="shop/index.php?cate_id=1">
            <img src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list1.jpg">
            <span class="title_hide">旅游超市</span>
            <span class="title">旅游超市</span>
        </a>
        <a href="shop/index.php?cate_id=470">
            <img  src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list6.jpg">
            <span class="title_hide">邮轮中心</span>
            <span class="title">邮轮中心</span>
        </a>
        <a href="shop/index.php?cate_id=2">
            <img  src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list2.jpg">
            <span class="title_hide">购物超市</span>
            <span class="title">购物超市</span>
        </a>
        <a href="shop/index.php?cate_id=3">
            <img  src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list3.jpg">
            <span class="title_hide">保险超市</span>
            <span class="title">保险超市</span>
        </a>
        <a href="shop/index.php?cate_id=256">
            <img  src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list4.jpg">
            <span class="title_hide">金融超市</span>
            <span class="title">金融超市</span>
        </a>
        <a href="shop/index.php?cate_id=308">
            <img  src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list5.jpg">
            <span class="title_hide">文化中心</span>
            <span class="title">文化中心</span>
        </a>

        <a href="shop/index.php?cate_id=530">
            <img  src="<?php echo SHOP_TEMPLATES_URL;?>/index/images/menu_list7.jpg">
            <span class="title_hide">邮轮书画院</span>
            <span class="title">邮轮书画院</span>
        </a>
        <!-- menu  one  结束-->
        <div class="clear"></div>
    </div>
</div>
<!-- menu two-->
<div class="menu_two">
    <div class="menu">
        <a href="#" class="current">综合首页</a>
        <a href="shop/index.php?cate_id=593">商学院</a>
        <a href="shop/index.php?cate_id=662">汽车租赁</a>
        <a href="shop/index.php?cate_id=730">好客专车</a>
        <a href="shop/index.php?act=member_snsindex&op=index" target="_blank">会员中心</a>
        <a href="/bbs/">论坛</a>
        <a href="shop/index.php?act=article&op=show&article_id=24">人才招聘</a>
        <a href="shop/index.php?act=article&op=show&article_id=22">关于我们</a>
   
    </div>
</div>
<!-- menu two 结束-->
<div class="qunar">

    <div class="e_pic_wrap">
        <ul>
            <?php if(is_array($output['midBannerList'])){foreach($output['midBannerList'] as $k=>$v){?>
            <li>
                <a href="<?php echo $v['url']?>" target="_blank">
                    <img src="<?php echo $v['pic']?>">
                </a>
            </li>
            <?php }}?>
        </ul>
    </div>

    <div class="prev"><a href="javascript:void(0)"></a></div>
    <div class="next"><a href="javascript:void(0)"></a></div>
</div>
<script type="text/javascript">
    jQuery(".qunar").slide({mainCell: ".e_pic_wrap ul", effect: "leftLoop", autoPlay: true, interTime: 2500});
</script>
<div class="picScroll">
    <h4>
        案例展示
        <i></i>
    </h4>
    <ul>
        <?php if(is_array($output['productList'])){foreach($output['productList'] as $k=>$v){?>
        <li>
            <a target="_blank" href="<?php echo $v['url']?>">
                <span class="img_wrap"><img src="<?php echo $v['pic']?>"/></span>
                <span class="example_name"><?php echo $v['text']?></span>
            </a>
        </li>
        <?php }}?>

    </ul>

    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>
</div>
</div>

<script type="text/javascript">
    jQuery(".picScroll").slide({
        mainCell: "ul",
        effect: "leftMarquee",
        vis: 6,
        autoPlay: true,
        interTime: 50,
        switchLoad: "_src"
    });
</script>
<!--Content-->
<div class="wrap1920" id="iCon">
    <div class="contanier">
        <!--midNav-->




        <!--footer-->
        <div id="footer">
            <div class="copyright">© 2015 All Rights Reserved&nbsp;&nbsp;<a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
                    target="_blank">鲁ICP备123456号-1</a></div>
            <p class="add">地址：山东济南东环国际广场D座2101</p>
        </div>

        <div id="slideTop">
            <div id="comShare">
                <div class="shareBtn"></div>
                <div class="bdsharebuttonbox">
                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                </div>
            </div>
            <a id="toTop" href="javascript:;">TOP</a>
        </div>
        <!--footer End-->
        <!-- 在线客服-->
        <div class="service" id="floattools">
            <div class="float_l">
                <a id="btn_show" class="btn_open" href="javascript:void(0);">展开</a>
                <a id="btn_hide" class="btn_close" href="javascript:void(0);">隐藏</a>
            </div>
            <div class="float_r" id="service_hide">
                <h6>安固商旅在线客服</h6>
                <ul>
                    <li><span class="service_person">客服一</span> <a target="_blank"
                                                                   href="http://wpa.qq.com/msgrd?v=3&uin=1784522899&site=qq&menu=yes"><img
                            border="0" src="http://wpa.qq.com/pa?p=2:1784522899:9" alt="：有事点这里"/></a></li>
                    <li><span class="service_person">客服二</span> <a target="_blank"
                                                                   href="http://wpa.qq.com/msgrd?v=3&uin=1784522899&site=qq&menu=yes"><img
                            border="0" src="http://wpa.qq.com/pa?p=2:1784522899:9" alt="：有事点这里"/></a></li>
                    <li><span class="service_person">客服三</span> <a target="_blank"
                                                                   href="http://wpa.qq.com/msgrd?v=3&uin=1784522899&site=qq&menu=yes"><img
                            border="0" src="http://wpa.qq.com/pa?p=2:1784522899:9" alt="：有事点这里"/></a></li>
                    <li><span class="phone_number">电话：400_800099</span></li>
                </ul>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                //qq客服代码
                $('#floattools').find('#service_hide').hide();
                $('#btn_show').bind('click', function () {
                    $('#service_hide').animate({width: 'show', opacity: 'show'}, 100, function () {
                        $(this).show();
                    });
                    $('#btn_show').hide();
                    $('#btn_hide').show();
                });
                $('#btn_hide').bind('click', function () {
                    $('#service_hide').animate({width: 'hide', opacity: 'hide'}, 100, function () {
                        $(this).hide();
                    });
                    $('#btn_hide').hide();
                    $('#btn_show').show();
                });
                //返回顶部代码
                $(window).scroll(function(){
                    if($(window).scrollTop()>=100){
                        $('#slideTop').fadeIn();
                    }else{
                        $('#slideTop').fadeOut();
                    }
                });
                $(window)
                $('#toTop').click(function(){
                    $('html,body').animate({
                        scrollTop:0
                    },1000);
                });
            })
        </script>

    </div>
</div>
<!--Content End-->
</body>
</html>

<!-- 弹窗 -->
<div class="alertBoxBg"></div>
<div class="alertBoxContainer">
    <div class="alertBoxTitle">
        <span>提示信息</span>
        <a class="ico">x</a>
    </div>
    <div class="alertBoxInfo">
        为了您更好的体验本站,请不要使用低版本的IE浏览器
    </div>
    <div class="alertBoxBottom">
        <a href="javascript:void(0)" class="alertBoxBtn">确定</a>
    </div>
</div>
<script type="text/javascript">
    $('.alertBoxContainer .alertBoxBtn,.alertBoxContainer .alertBoxTitle .ico').click(function () {
        $('.alertBoxBg').hide();
        $(this).parents(".alertBoxContainer").hide();
    });
</script>
<!-- 弹窗 -->