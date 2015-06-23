<?php defined('InShopNC') or exit('Access Invalid!');?>
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/index.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ie6.js" charset="utf-8"></script>
<![endif]-->
<style type="text/css">
.all-category { display: block !important;}
</style>
  <div class="clear"></div>

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
<div class="content_box">


 
  <?if(is_array($output['categoryTabFloor'])){foreach($output['categoryTabFloor'] as $categoryKey=>$row){?>
  <div class="inbound theme<?php echo $categoryKey;?>" id="inbound">
        <h3><?php echo $categoryKey+1;?>F <?php echo $row['ac_name']?></h3>
        <div class="infocon">

      <div class="srpnel">
          <div class="prooutinbound-list pnel">
            <ul><div class="udiyblock"  type="CommonSource">  
               <?if(is_array($row['list'])){foreach($row['list'] as $goodsKey=>$v){?>
                  <li  class="<?php if($goodsKey%5==4){?>mr0<?php }?>">
                    <a href="<?php echo urlShop('article','show',array('article_id'=>$v['article_id']));?>" target="_blank">
                    <div class="indexThumb">
                      <img src="<?php echo $v['image']?>" alt=""/>
                    </div>
                    <p class="goodsName"><?php echo $v['article_title']?></p>
                   </a>
                  </li>
               <?php }}?>
                      </div></ul>
            </div>
        <div class="prooutinbound-list pnel none"><ul></ul></div>
      </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <?php }}?>

  </div>
</div>
<!--旅游局合作 start-->
<div class="cooper_box">
  <div class="cooper_title">
    <h3>旅游局合作</h3>
    <a href="" target="_blank" rel="nofollow">
      更多旅游局
    </a>
  </div>
  <div id="portal-block-1026606249924" class="udiyblock"  type="CommonSource"> <ul class="cooper_list">
    <div id="portal-block-477488565169" class="udiyblock"  type="CommonSource">
      <li class="c_list1">
        <a href="" target="_blank" class="c_bg1" rel="nofollow">釜山观光公社</a>
      </li>
      <li>
        <a href="" class="c_bg2" target="_blank" rel="nofollow">江苏省旅游局</a>
      </li>
      <li>
        <a href="" class="c_bg3"  target="_blank" rel="nofollow">四川省旅游局</a>
      </li>
      <li>
        <a href="" class="c_bg4"  target="_blank" rel="nofollow">福建省旅游局</a>
      </li>
      <li>
        <a href="" class="c_bg5"  target="_blank" rel="nofollow">广东省旅游局</a>
      </li>
      <li>
        <a href="" class="c_bg6"  target="_blank" rel="nofollow">青海省旅游局</a>
      </li>
      <li class="c_list7">
        <a href="" class="c_bg7"  target="_blank" rel="nofollow">河南省旅游局</a>
      </li>
      <li class="c_list8">
        <a href="" class="c_bg8"  target="_blank" rel="nofollow">苏州市旅游局</a>
      </li>
    </div>
  </ul></div>
  <p class="c_list_bg"></p>
</div>
<!--旅游局合作 end-->

<!-- [//主体内容] -->
