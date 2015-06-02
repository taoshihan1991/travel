<?php defined('InShopNC') or exit('Access Invalid!');?>
<script src="<?php echo SHOP_RESOURCE_SITE_URL.'/js/search_goods.js';?>"></script>
<script src="<?php echo RESOURCE_SITE_URL.'/js/class_area_array.js';?>"></script>
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/layout.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
_behavior: url(<?php echo SHOP_TEMPLATES_URL;
?>/css/csshover.htc);
}
</style>

<!-- [列表页] -->
<!-- [主体部分] -->
<div class="listPage">
  <div class="listPageLeft">
    <!-- 条件筛选 -->
    <div class="searchAttr">
        <div class="box_change">
          <div class="theme">
            <i style="display: inline;"></i>
            <?php if(!empty($output['goods_class_array'])){?>
            <dl req="">
              <dt>主题分类</dt>
              <dd>
                <?php foreach ($output['goods_class_array'] as $value) {?>
                    <?php if(!empty($value['class2'])){foreach($value['class2'] as $v){?>
                    <a href="<?php echo urlShop('search','index',array('cate_id'=>$v['gc_id']))?>" <?php if($v['gc_id']==$_GET['cate_id']){?>class="on"<?php }?>><?php echo $v['gc_name']?></a>
                    <?php }}?>
                <?php }?>
               </dd></dl>
             </div>
             <?php }?>

             <?php if(!empty($output['attr_array']) && is_array($output['attr_array'])){foreach($output['attr_array'] as $key=>$v){?>
               
             <dl class="dl-dest" <?php if(is_array($output['checked_attr'])){foreach ($output['checked_attr'] as $attkey=>$val){if($attkey==$key){?>style="display:none;"<?php }}}?>>
              <dt><?php echo($v['name'])?></dt>
              <dd class="choice">
                <?php foreach($v['value'] as $k=>$row){?>
                <a <?php if(is_array($output['checked_attr'])){foreach ($output['checked_attr'] as $val){if($k==$val['attr_value_id']){?>class="on"<?php }}}?> href="<?php $a_id = (($_GET['a_id'] != '' && $_GET['a_id'] != 0)?$_GET['a_id'].'_'.$k:$k);echo replaceParam(array('a_id' => $a_id));?>"><?php echo $row['attr_value_name']?></a>
                <?php }?>
              </dd>
              </dl>
              
              <?php }}?>
              <?php if(isset($output['checked_attr']) && is_array($output['checked_attr'])){?>
              <dl class="change_ing noborder"><dt>您已选择</dt>
                <dd>
                  
                  <?php foreach ($output['checked_attr'] as $val){?>
                  <a href="<?php echo removeParam(array('a_id' => $val['attr_value_id']));?>" rel="nofollow" class="now_color" nctype="span_filter" title="点击可删除"><?php echo $val['attr_value_name'];?><i data-uri="<?php echo removeParam(array('a_id' => $val['attr_value_id']));?>"></i></a>
                  <?php }?>
                </dd>
              </dl>  
              <?php }?>
            </div>
    </div>
    <!-- //条件筛选 -->

    <!-- 列表 -->
    <div class="box_list">
      <ul>
        <?php if(!empty($output['goods_list']) && is_array($output['goods_list'])){foreach($output['goods_list'] as $value){?>
        <li>
          <div class="tu">
            <a href="<?php echo urlShop('goods','index',array('goods_id'=>$value['goods_id']));?>" target="_blank">
            <img src="<?php echo thumb($value, 240);?>" width="120" height="90" alt="济南出发去齐河泉城欧乐堡梦幻世界【特价】一日 含大通票赠保险"></a>
            <a href="#?" class="btn_add"></a>
          </div>
          <div class="xl_con">
            <div class="xl_type">
              <div class="title">
              <i class="i0"></i>
              <a href="<?php echo urlShop('goods','index',array('goods_id'=>$value['goods_id']));?>" target="_blank" data="3100507"><?php echo $value['goods_name'];?></a>
              <s class="s2" title="支持支付宝在线支付"></s>
              <s class="s3" title="游客保障：该旅行社已签署游客保障协议，并交纳1300元保证金，承诺如实描述、诚信经营、品质服务，在线预订100%有保障！"></s>
            </div>
            <div class="xl_jd">
              <dl>
                <dd>
                  <?php echo $value['goods_jingle'];?>
                </dd>
              </dl>
            </div>
            <div class="lxs"><i></i><a href="<?php echo urlShop('show_store','index',array('store_id'=>$value['store_id']), $value['store_domain']);?>" target="_blank"><?php echo $value['store_name'];?></a>
            </div>
          </div>
          <div class="xl_num">
            <span class="price">¥<em><?php echo $value['goods_price'];?></em>起</span><a href="<?php echo urlShop('goods','index',array('goods_id'=>$value['goods_id']));?>" class="btn_go" target="_blank">去看看</a><span class="guanzhu">最近成交<b><?php echo $value['goods_salenum'];?></b>笔&nbsp;&nbsp;76901人关注</span>
          </div>
        </div>
        </li>
        <?php }}?>
   
      </ul>
    </div>
    <div class="pagination"><?php echo $output['show_page']; ?> </div>
    <!-- //列表 -->

  </div>
  <div class="listPageRight">


    <div class="box280">
      <div class="tit"><a href="javascript:void(0)" target="_blank"><strong><?php echo $output['class_name'];?>分类</strong></a>
      </div>
      <div class="guide">
        <div class="type_nav">
                <?php foreach ($output['goods_class_array'] as $value) {?><?php if($_GET['cate_id']==$value['gc_id']){?>
                    <?php if(!empty($value['class2'])){foreach($value['class2'] as $k=>$v){?>
                    <a <?php if($k%2==1){?>class="bd_r0"<?php }?> href="<?php echo urlShop('search','index',array('cate_id'=>$v['gc_id']))?>" <?php if($v['gc_id']==$_GET['cate_id']){?>class="on"<?php }?>><?php echo $v['gc_name']?></a>
                <?php }}}}?>
        </div>
      </div>
    </div>

    <div class="box280">
      <div class="tit"><strong>当季旅游推荐</strong></div>
      <div class="zhuti">
        <a href="" title="亲子游专题" target="_blank"><img src="http://s.cncnimg.cn/images/a/2014/250x195_qinziyou_140528.png" alt="亲子游专题"></a>
      </div>
    </div>

    <div class="box280">
      <div class="tit">
        <strong>最新预订</strong>
      </div>
      <div class="txt_order">
        <dl>
          <i class="i1"></i>
          <dt><span class="time">1小时前</span><em>张**</em><span>预订了</span></dt>
          <dd clss="title"><a href="/xianlu/697131629826" target="_blank">【北京到白洋淀狼牙山旅游多少钱】白洋淀狼牙山二日|红色旅游团</a></dd>
        </dl>
      </div>
    </div>


    
  </div>
  <div class="clearfix"></div>

</div>
<!-- [//主体部分] -->
<!-- [//列表页] -->





<script src="<?php echo RESOURCE_SITE_URL;?>/js/waypoints.js"></script>
<script src="<?php echo SHOP_RESOURCE_SITE_URL;?>/js/search_category_menu.js"></script>
<script type="text/javascript">
var defaultSmallGoodsImage = '<?php echo defaultGoodsImage(240);?>';
var defaultTinyGoodsImage = '<?php echo defaultGoodsImage(60);?>';

$(function(){
    $('#files').tree({
        expanded: 'li:lt(2)'
    });

    //浮动导航  waypoints.js
    $('#main-nav-holder').waypoint(function(event, direction) {
        $(this).parent().toggleClass('sticky', direction === "down");
        event.stopPropagation();
    });
	// 单行显示更多
	$('span[nc_type="show"]').click(function(){
		s = $(this).parents('dd').prev().find('li[nc_type="none"]');
		if(s.css('display') == 'none'){
			s.show();
			$(this).html('<i class="icon-angle-up"></i><?php echo $lang['goods_class_index_retract'];?>');
		}else{
			s.hide();
			$(this).html('<i class="icon-angle-down"></i><?php echo $lang['goods_class_index_more'];?>');
		}
	});

	<?php if(isset($_GET['area_id']) && intval($_GET['area_id']) > 0){?>
	// 选择地区后的地区显示
	$('[nc_type="area_name"]').html(nc_class_a[<?php echo intval($_GET['area_id']);?>]);
	<?php }?>

	<?php if(isset($_GET['cate_id']) && intval($_GET['cate_id']) > 0){?>
	// 推荐商品异步显示
    $('div[nctype="booth_goods"]').load('<?php echo urlShop('search', 'get_booth_goods', array('cate_id' => $_GET['cate_id']))?>', function(){
        $(this).show();
    });
	<?php }?>
});
</script>