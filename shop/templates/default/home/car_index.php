<?php defined('InShopNC') or exit('Access Invalid!');?>
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/index.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ie6.js" charset="utf-8"></script>
<![endif]-->
<div class="clear"></div>

<!-- [好客专车app部分] -->
<style type="text/css">
/*顶部轮播*/
#carIndexBanner{ width:1600px; margin: 0 auto;}
#carIndexBanner img{
  width:1600px; 
}
</style>
<div id="carIndexBanner">
  <?php if(is_array($output['carBannerList'])){foreach($output['carBannerList'] as $k=>$v){?>
    <a href="<?php echo $v['url']?>" target="_blank"><img src="<?php echo $v['pic']?>"></a>
  <?php }}?>

</div>
<!-- [//好客专车app部分] -->

