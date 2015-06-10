<?php defined('InShopNC') or exit('Access Invalid!');?>
<!-- [旅游网站css,js] -->
<link rel="stylesheet" type="text/css" href="<?php echo SHOP_TEMPLATES_URL;?>/css/tcIndex.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="<?php echo SHOP_TEMPLATES_URL;?>/css/extend.css"/>
<script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL;?>/js/extend.js"></script>
<!-- [//旅游网站css,js] -->

<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<!-- [最顶部部分] -->
<div id="topNavWrapper">
        <div id="topNavPanel">
          <div id="topLogin">
            <?php if($_SESSION['is_login'] != '1'){?>
            <span>您好，欢迎使用！</span>
            <a class="login" rel="nofollow" href="<?php echo urlShop('login');?>">登录</a>
            <a class="register" rel="nofollow" href="<?php echo urlShop('login','register');?>">注册</a>
            <?php }else{?>
            <a class="username" href="<?php echo urlShop('member_snsindex');?>"><?php echo $_SESSION['member_name'];?></a><span style="color:#333;">，您好</span>
            <a class="loginout" rel="nofollow" href="<?php echo urlShop('login','logout');?>" title="退出帐号"><span>退出</span></a>
            <?php }?>
          </div>
          <ul id="topNav">
            <li id="topMyTc">
              <a href="<?php echo SHOP_SITE_URL;?>/index.php?act=cart">购物车</a>
            </li>
            <li id="topMyTc">
              <a href="<?php echo SHOP_SITE_URL;?>/index.php?act=pointprod&op=index">金币直购专区</a>
            </li>
            <li id="topMyTc">
              <a href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_snsindex">会员中心</a>
              <div data-height="100px">
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_order">订单中心</a>
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_order&state_type=state_new">待付款</a>
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_order&state_type=state_send">待确认</a>
                <a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=member_order&state_type=state_noeval">待评价</a>
              </div>
            </li>
          
            <li id="weixinTc">
              <a href="javascript:void(0);">手机<i></i></a>
              <div></div>
              <span></span>
            </li>
            <li id="tcPhone">
              <a href="javascript:void(0);">电话<i></i></a>
              <div>
                <p>国内电话：1234-8888-8888</p>
                <p>海外电话：+86-888-8888-8888</p>
              </div>
              <span></span>
            </li> 
            <li id="servicePhone">
              <a href="javascript:void(0);">
                客户服务
                <i></i>
              </a>
              <div>               
                <a target="_blank" href="<?php echo urlShop('article', 'article', array('ac_id' => 2));?>">帮助中心</a>
                <a target="_blank" href="<?php echo urlShop('article', 'article', array('ac_id' => 5));?>">售后服务</a>
                <a target="_blank" href="<?php echo urlShop('article', 'article', array('ac_id' => 6));?>">客服中心</a>
              </div>
              <span></span>
            </li>
                         <li id="topJoinTc">
              <a href="javascript:;">合作中心<i></i></a>
                            <div  data-height="57px">
                              <a rel="nofollow" target="_blank" href="">联盟合作</a>
                              <a rel="nofollow" target="_blank" href="">商务合作</a>
                          </div>
                          <span></span>
                      </li>
          </ul>
        </div>
</div>
<!-- [//最顶部部分] -->

