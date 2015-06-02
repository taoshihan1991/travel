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
    <img src="<?php echo SHOP_TEMPLATES_URL;?>/images/banner1.jpg"/>
    <table class="indexAds">
      <tr>
        <td>
          <a href=""><p>超万家酒店团购<br>2折起</p></a>
        </td>
        <td><a href="" class="green"><p>公司旅游，1对1上门定制<br>老板满意，员工省心</p></a></td>
        <td><a href="" class="blue"><p>积分商城<br>积分抽奖,免费兑奖品</p></a></td>
      </tr>
    </table>
  </div>
  <div class="bannerRight">
    <div class="login280"><a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=login&op=register" target="_blank" title="游客注册" class="y"><i></i>游客注册</a><a rel="nofollow" href="<?php echo SHOP_SITE_URL;?>/index.php?act=seller_login&op=index" target="_blank"><i></i>旅行社入驻</a></div>
    <a href=""><img src="<?php echo SHOP_TEMPLATES_URL;?>/images/ad1.jpg"/></a>
    <div class="notice280">
      <div class="notice_tag_top">
        <a href="http://news.cncn.com" class="">旅游热点</a>
        <a href="" class="on">通知公告</a>
      </div>
      <div class="notice_tag_con">
          <div  style="display: none;">
            <div class="first">
                  <a href=""><img src="http://www.cncn.com/images/a/2015/80X52201505.jpg" alt="5月份适合去哪里旅游？" title="5月份适合去哪里旅游？" width="80" height="52"></a>
                  <em><a href="">5月份适合起哪里旅游？</a></em>
                  <p>五月，春夏之交，花木茂盛，温度适宜，是全年最适合旅游的月份。白居易的诗“人间四月芳菲尽”估计说的就是这个时候吧?</p>
                </div><ul>
            <?php if(!empty($output['indexHomeArticle'])){foreach($output['indexHomeArticle'] as $v){?>
                <li><a href="<?php echo empty($v['article_url']) ? urlShop('article', 'show',array('article_id'=> $v['article_id'])):$v['article_url'] ;?>" target="_blank"><?php echo $v['article_title']?></a></li>
            <?php }}?>
               </ul>
          </div>
          <div>
            <ul class="zixun">
              <?php if(!empty($output['show_article']['notice']['list'])){foreach($output['show_article']['notice']['list'] as $v){?>
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
  <div id="content" class="content_main clearfix">
      <div id="Preferential">
    <h3>每日特惠</h3>
    <div class="infocon">
      <div class="prel">
        <ul>
          <div class="udiyblock"  type="CommonSource">    
            
          <?php echo $output['web_html']['index_sale'];?>

        
    </div>
        </ul>
      </div>
      <div class="prer">
        <div id="portal-block-750355214634" class="udiyblock"  type="AdModel">              <div class="toplefimg">
    <img src="http://upload.17u.com/uploadfile/2015/05/20/33/201505201823267829.jpg" alt="二维码2"/>
    <div><img src="http://upload.17u.com/uploadfile/2015/05/19/33/2015051913593270182.png" alt="二维码2"/></div>
  </div>  
  <div class="toplefimg">
    <img src="http://upload.17u.com/uploadfile/2015/05/21/33/2015052118103641112.jpg" alt="二维码1"/>
    <div><img src="http://upload.17u.com/uploadfile/2015/05/19/33/2015051913593270182.png" alt="二维码1"/></div>
  </div>  
  </div>
      </div>
    </div>

    <div class="clearfix"></div>
  </div>



 
  <?if(is_array($output['categoryTabFloor'])){foreach($output['categoryTabFloor'] as $category){?>
  <div class="inbound" id="inbound">
        <h3><?php echo $category[0]['gc_name']?></h3>
        <div class="infocon">
      <div class="slpnel">
      <div class="udiyblock"  type="CommonSource"> <h4><a href="<?php echo urlShop('search','index',array('cate_id'=>$category[0]['gc_id']));?>" ><?php echo $category[0]['gc_name']?></a></h4>
      <ul>
        <?if(is_array($category)){foreach($category as $k=>$cate){if($k!=0){?>

            <li><a href="<?php echo urlShop('search','index',array('cate_id'=>$cate['gc_id']))?>" des="<?php echo $cate['gc_name']?>" target="_blank" title="<?php echo $cate['gc_name']?>"><?php echo $cate['gc_name']?></a>
            </li>
        <?php }}}?>
        </ul>
<div class="clearfix"></div></div>
      </div>
      <div class="srpnel">
      <div class="udiyblock"  type="CommonSource">   
              <div>
                        <ul>
                          <?if(is_array($category)){foreach($category as $k=>$cate){?>
                            <li <?php if($k==0){?>class="cur"<?php }?>><a des="<?php echo $cate['gc_name']?>" title="<?php echo $cate['gc_name']?>"><?php echo $cate['gc_name']?></a></li>
                          <?php }}?>
                        </ul>
                        <a class="m-scenic" href="<?php echo urlShop('search','index',array('cate_id'=>$category[0]['gc_id']));?>" >更多<?php echo $category[0]['gc_name']?></a>
                        <span class="clearfix"></span>
              </div>
      </div>
        <?if(is_array($category)){foreach($category as $k=>$cate){?>
          <div class="prooutinbound-list pnel <?php if($k!=0){?>none<?php }?>">
            <ul><div id="portal-block-692663448760" class="udiyblock"  type="CommonSource">  
               <?if(is_array($cate['goods'])){foreach($cate['goods'] as $goodsKey=>$v){?>
                  <li  class="<?php if($goodsKey%3==2){?>mr0<?php }?>"><img src="<?php echo $v['pic']?>" alt=""/>
                  <div>
                  <p><?php echo $v['goods_name']?></p>
                  <span>上海出发</span>
                  <div><i>¥</i><em><?php echo $v['goods_price']?></em><span>起</span></div>
                  </div>
                   <a href="" target="_blank" onclick="_tcTraObj._tcTrackEvent('guoneiyou15353tab1', 'Pcblock', 'CN首页','30');"></a>
                  </li>
               <?php }}?>
                      </div></ul>
            </div>
          <?php }}?>


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
        <a href="http://go.ly.com/abroad/city-busan-3176/?from=CNhome" target="_blank" class="c_bg1" rel="nofollow">釜山观光公社</a>
      </li>
      <li>
        <a href="http://www.ly.com/zhuanti/jiangsuly/" class="c_bg2" target="_blank" rel="nofollow">江苏省旅游局</a>
      </li>
      <li>
        <a href="http://www.ly.com/zhuanti/tfsc/?from=CNhome" class="c_bg3"  target="_blank" rel="nofollow">四川省旅游局</a>
      </li>
      <li>
        <a href="http://www.ly.com/zhuanti/qxfj/?from=CNhome" class="c_bg4"  target="_blank" rel="nofollow">福建省旅游局</a>
      </li>
      <li>
        <a href="http://go.ly.com/gonglve/sheng-guangdong-44/?from=CNhome" class="c_bg5"  target="_blank" rel="nofollow">广东省旅游局</a>
      </li>
      <li>
        <a href="http://go.ly.com/gonglve/sheng-qinghai-63/?from=CNhome" class="c_bg6"  target="_blank" rel="nofollow">青海省旅游局</a>
      </li>
      <li class="c_list7">
        <a href="http://go.ly.com/gonglve/sheng-henan-41/?from=CNhome" class="c_bg7"  target="_blank" rel="nofollow">河南省旅游局</a>
      </li>
      <li class="c_list8">
        <a href="http://go.ly.com/gonglve/shi-suzhou-3205/?from=CNhome" class="c_bg8"  target="_blank" rel="nofollow">苏州市旅游局</a>
      </li>
    </div>
  </ul></div>
  <p class="c_list_bg"></p>
</div>
<!--旅游局合作 end-->

<!-- [//主体内容] -->
