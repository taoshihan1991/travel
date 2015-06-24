<?php defined('InShopNC') or exit('Access Invalid!');?>
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/index.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ie6.js" charset="utf-8"></script>
<![endif]-->
<div class="clear"></div>
<style type="text/css">
.all-category { display: block !important;}
</style>
<!-- [banner部分] -->
<div class="indexBannerBox">
  <div class="bannerCenter">
    <img src="<?php echo $output['indexBanner']['pic']?>"/>
    <table class="indexAds">
      <tr>
      <?php if(!empty($output['advList'])){foreach($output['advList'] as $v){?>
        <td>
          <a href="<?php echo $v['url']?>"><img src="<?php echo $v['pic']?>"/></a>
        </td>
      <?php }}?>
      </tr>
    </table>
  </div>
  <div class="bannerRight">
    <div class="login280"><a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=login&op=register" target="_blank" title="游客注册" class="y"><i></i>游客注册</a><a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=seller_login&op=index" target="_blank"><i></i>商家中心</a></div>
    <a href="<?php echo $output['bannerRightAd'][0]['url'];?>"><img src="<?php echo $output['bannerRightAd'][0]['pic'];?>"/></a>
    <div class="notice280">
      <div class="notice_tag_top">
        <a href="" class="">旅游热点</a>
        <a href="" class="on">通知公告</a>
      </div>
      <div class="notice_tag_con">
          <div  style="display: none;">
            <ul class="zixun">
            <?php if(!empty($output['indexHomeArticle'])){foreach($output['indexHomeArticle'] as $v){?>
                <li>
                  <em><a href="<?php echo urlShop('article', 'article',array('ac_id'=> $v['ac_id']));?>" target="_blank">[<?php echo $v['ac_name']?>]</a></em>
                  <a href="<?php echo empty($v['article_url']) ? urlShop('article', 'show',array('article_id'=> $v['article_id'])):$v['article_url'] ;?>" target="_blank"><?php echo $v['article_title']?></a></li>
            <?php }}?>
               </ul>
          </div>
          <div>
            <ul class="zixun">
              <?php if(!empty($output['show_article'])){foreach($output['show_article'] as $v){?>
              <li> 
                <em><a href="<?php echo urlShop('article', 'article',array('ac_id'=> $v['ac_id']));?>" target="_blank">[<?php echo $v['ac_name']?>]</a></em>
                <a href="<?php echo empty($v['article_url']) ? urlShop('article', 'show',array('article_id'=> $v['article_id'])):$v['article_url'] ;?>"><?php echo $v['article_title']?></a></li>
              <?php }}?>
              </ul>
          </div>
        </div>
      </div>
  </div>
  <div class="clear"></div>
</div>
<!-- [//banner部分] -->

<script type="text/javascript" src="<?php echo SHOP_RESOURCE_SITE_URL;?>/js/home_index.js" charset="utf-8"></script>




<!-- [主体内容] -->
<script type="text/javascript" src="<?php echo SHOP_TEMPLATES_URL;?>/js/jquery.SuperSlide.2.1.1.js"></script>
<style type="text/css">
/*顶部轮播*/
#buyIndexBanner{ width:1190px; margin: 0 auto;}
#buyIndexBanner .bd img{
  width:1190px;  
  height: 280px;
}
</style>
<div id="buyIndexBanner">

            <div class="bd">
                <ul>            
                  <?php if(is_array($output['buyBannerList'])){foreach($output['buyBannerList'] as $k=>$v){?>
                <li>
                    <a href="<?php echo $v['url']?>" target="_blank">
                        <img src="<?php echo $v['pic']?>">
                    </a>
                </li>
            <?php }}?>
            </ul>
            </div>

</div>
<!-- [//主体内容] -->
