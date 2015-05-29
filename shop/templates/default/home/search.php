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
            <dl req="">
              <dt>主题分类</dt>
              <dd>
                <?php foreach ($output['goods_class_array'] as $value) {?>
                    <?php if(!empty($value['class2'])){foreach($value['class2'] as $v){?>
                    <a href="" <?php if($v['gc_id']==$_GET['cate_id']){?>class="on"<?php }?>><?php echo $v['gc_name']?></a>
                    <?php }}?>
                <?php }?>
               </dd></dl>
             </div>
             <?php if(!empty($output['attr_array']) && is_array($output['attr_array'])){foreach($output['attr_array'] as $v){?>
             <dl class="dl-dest">
              <dt><?php print_r($v['name'])?></dt>
              <dd class="choice">
                <a class="all checkbox on" href="">全部</a>
                <?php foreach($v['value'] as $k=>$row){?>
                <a <?php if($k==$_GET['a_id']){?>class="on"<?php }?> href="<?php $a_id = $k;echo replaceParam(array('a_id' => $a_id));?>"><?php echo $row['attr_value_name']?></a>
                <?php }?>
              </dd>
              </dl>
              <?php }}?>

              <dl><dt>行程天数</dt><dd><a href="/jinan/zhoubian-s1" class="on">全部</a><a href="/jinan/zhoubian-d1">1日游</a><a href="/jinan/zhoubian-d2">2日游</a><a href="/jinan/zhoubian-d3">3日游</a><a href="/jinan/zhoubian-d4">4日游</a><a href="/jinan/zhoubian-d5">5日游及以上</a></dd></dl><dl class="noborder"><dt>出游方式</dt><dd><a href="/jinan/zhoubian-s1" class="on">全部</a><a href="/jinan/zhoubian-t1">跟团游</a><a href="/jinan/zhoubian-t4">自由行</a><a href="/jinan/zhoubian-t6">自驾游</a><a href="/jinan/zhoubian-t3">独立包团</a></dd></dl></div>
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
      <div class="tit"><strong>当季旅游推荐</strong></div>
      <div class="zhuti">
        <a href="http://www.cncn.com/zhuti/qinziyou/" title="亲子游专题" target="_blank"><img src="http://s.cncnimg.cn/images/a/2014/250x195_qinziyou_140528.png" alt="亲子游专题"></a>
      </div>
    </div>

    <div class="box280">
      <div class="tit"><a href="http://guilin.cncn.com/lvyougonglue/" target="_blank"><strong>旅游景点分类</strong></a>
      </div>
      <div class="guide">
        <div class="type_nav">
          <a href="http://guilin.cncn.com/jingdian/" target="_blank">旅游景点大全</a>
          <a class="bd_r0" href="http://guilin.cncn.com/jingdian/gonglue/" target="_blank">景点游玩攻略</a>
          <a href="http://guilin.cncn.com/zhusu/" target="_blank">住宿攻略</a>
          <a class="bd_r0" href="http://guilin.cncn.com/jiaotong/" target="_blank">交通指南</a>
          <a href="http://guilin.cncn.com/meishi/" target="_blank">美食小吃</a><a class="bd_r0" href="http://guilin.cncn.com/techan/" target="_blank">桂林特产</a><a href="http://wan.cncn.com/guide_guilin.htm" target="_blank">旅游贴士</a><a class="bd_r0" href="http://guilin.cncn.com/photo/" target="_blank">风景图片</a>
        </div>
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




<div class="nch-container wrapper" >
  <div class="left">
    <?php if (!empty($output['goods_class_array'])) {?>
    <div class="nch-module nch-module-style02">
      <div class="title">
        <h3>分类筛选</h3>
      </div>
      <div class="content">
        <ul id="files" class="tree">
          <?php foreach ($output['goods_class_array'] as $value) {?>
          <li><i class="tree-parent tree-parent-collapsed"></i><a href="<?php echo urlShop('search', 'index', array('cate_id' => $value['gc_id']));?>" <?php if ($value['gc_id'] == $_GET['cate_id']) {?>class="selected"<?php }?>><?php echo $value['gc_name']?></a>
            <?php if (!empty($value['class2'])) {?>
            <ul>
              <?php foreach ($value['class2'] as $val) {?>
              <li><i class="tree-parent tree-parent-collapsed"></i><a href="<?php echo urlShop('search', 'index', array('cate_id' => $val['gc_id']));?>" <?php if ($val['gc_id'] == $_GET['cate_id']) {?>class="selected"<?php }?>><?php echo $val['gc_name']?></a>
                <?php if (!empty($val['class3'])) {?>
                <ul>
                  <?php foreach ($val['class3'] as $v) {?>
                  <li class="tree-parent tree-parent-collapsed"><i></i><a href="<?php echo urlShop('search', 'index', array('cate_id' => $v['gc_id']));?>" <?php if ($v['gc_id'] == $_GET['cate_id']) {?>class="selected"<?php }?>><?php echo $v['gc_name']?></a></li>
                  <?php }?>
                </ul>
                <?php }?>
              </li>
              <?php }?>
            </ul>
            <?php }?>
          </li>
          <?php }?>
        </ul>
      </div>
    </div>
    <?php }?>
    <!-- S 推荐展位 -->
    <div nctype="booth_goods" class="nch-module" style="display:none;"> </div>
    <!-- E 推荐展位 -->
    <div class="nch-module-sidebar"> <?php echo loadadv(37,'html');?>
      <div class="clear"></div>
    </div>
    <div class="nch-module nch-module-style03">
      <div class="title">
        <h3><?php echo $lang['goods_class_viewed_goods']; ?></h3>
      </div>
      <div class="content">
        <?php foreach ($output['viewed_goods'] as $k=>$v){?>
        <dl class="nch-sidebar-bowers">
          <dt class="goods-name"><a href="<?php echo urlShop('goods','index',array('goods_id'=>$v['goods_id'])); ?>"><?php echo $v['goods_name']; ?></a></dt>
          <dd class="goods-pic"><a href="<?php echo urlShop('goods','index',array('goods_id'=>$v['goods_id'])); ?>"><img src="<?php echo thumb($v, 60); ?>" title="<?php echo $v['goods_name']; ?>" alt="<?php echo $v['goods_name']; ?>" ></a></dd>
          <dd class="goods-price"><?php echo $lang['currency'];?><?php echo $v['goods_price']; ?></dd>
        </dl>
        <?php } ?>
      </div>
    </div>
  </div>
  <div class="right">
    <?php if(!isset($output['goods_class_array']['child']) && empty($output['goods_class_array']['child']) && !empty($output['goods_class_array'])){?>
    <?php $dl=1;  //dl标记?>
    <?php if((!empty($output['brand_array']) && is_array($output['brand_array'])) || (!empty($output['attr_array']) && is_array($output['attr_array']))){?>
    <div class="nch-module nch-module-style01">
      <div class="title">
        <h3>
          <?php if (!empty($output['class_name'])) {?>
          <em><?php echo $output['class_name'];?></em> -
          <?php }?>
          商品筛选</h3>
      </div>
      <div class="content">
        <div class="nch-module-filter">
          <?php if((isset($output['checked_brand']) && is_array($output['checked_brand'])) || (isset($output['checked_attr']) && is_array($output['checked_attr']))){?>
          <dl nc_type="ul_filter">
            <dt><?php echo $lang['goods_class_index_selected'].$lang['nc_colon'];?></dt>
            <dd class="list">
              <?php if(isset($output['checked_brand']) && is_array($output['checked_brand'])){?>
              <?php foreach ($output['checked_brand'] as $key=>$val){?>
              <span class="selected" nctype="span_filter"><?php echo $lang['goods_class_index_brand'];?>:<em><?php echo $val['brand_name']?></em><i data-uri="<?php echo removeParam(array('b_id' => $key));?>">X</i></span>
              <?php }?>
              <?php }?>
              <?php if(isset($output['checked_attr']) && is_array($output['checked_attr'])){?>
              <?php foreach ($output['checked_attr'] as $val){?>
              <span class="selected" nctype="span_filter"><?php echo $val['attr_name'].':<em>'.$val['attr_value_name'].'</em>'?><i data-uri="<?php echo removeParam(array('a_id' => $val['attr_value_id']));?>">X</i></span>
              <?php }?>
              <?php }?>
            </dd>
          </dl>
          <?php }?>
          <?php if (!isset($output['checked_brand']) || empty($output['checked_brand'])){?>
          <?php if(!empty($output['brand_array']) && is_array($output['brand_array'])){?>
          <dl <?php if($dl>3){?>class="dl_hide"<?php }?>>
            <dt><?php echo $lang['goods_class_index_brand'].$lang['nc_colon'];?></dt>
            <dd class="list">
              <ul>
                <?php $i = 0;foreach ($output['brand_array'] as $k=>$v){$i++;?>
                <li <?php if ($i>10){?>style="display:none" nc_type="none"<?php }?>><a href="<?php $b_id = (($_GET['b_id'] != '' && intval($_GET['b_id']) != 0)?$_GET['b_id'].'_'.$k:$k); echo replaceParam(array('b_id' => $b_id));?>"><?php echo $v['brand_name'];?></a></li>
                <?php }?>
              </ul>
            </dd>
            <?php if (count($output['brand_array']) > 10){?>
            <dd class="all"><span nc_type="show"><i class="icon-angle-down"></i><?php echo $lang['goods_class_index_more'];?></span></dd>
            <?php }?>
          </dl>
          <?php $dl++;}?>
          <?php }?>

          <?php if(!empty($output['cate_array']) && is_array($output['cate_array'])){?>
          <dl <?php if($dl>3){?>class="dl_hide"<?php }?>>
            <dt><?php echo $lang['goods_class_index_goods_class'].$lang['nc_colon'];?></dt>
            <dd class="list">
              <ul>
                <?php $i = 0;foreach ($output['cate_array'] as $k=>$v){$i++;?>
                <li <?php if ($i>10){?>style="display:none" nc_type="none"<?php }?>><a href="<?php $b_id = (($_GET['cate_id'] != '' && intval($_GET['cate_id']) != 0)?$_GET['cate_id'].'_'.$k:$k); echo replaceParam(array('cate_id' => $b_id));?>"><?php echo $v['gc_name'];?></a></li>
                <?php }?>
              </ul>
            </dd>
            <?php if (count($output['brand_array']) > 10){?>
            <dd class="all"><span nc_type="show"><i class="icon-angle-down"></i><?php echo $lang['goods_class_index_more'];?></span></dd>
            <?php }?>
          </dl>
          <?php $dl++;?>
          <?php }?>

          <?php if(!empty($output['attr_array']) && is_array($output['attr_array'])){?>
          <?php $j = 0;foreach ($output['attr_array'] as $key=>$val){$j++;?>
          <?php if(!isset($output['checked_attr'][$key]) && !empty($val['value']) && is_array($val['value'])){?>
          <dl>
            <dt><?php echo $val['name'].$lang['nc_colon'];?></dt>
            <dd class="list">
              <ul>
                <?php $i = 0;foreach ($val['value'] as $k=>$v){$i++;?>
                <li <?php if ($i>10){?>style="display:none" nc_type="none"<?php }?>><a href="<?php $a_id = (($_GET['a_id'] != '' && $_GET['a_id'] != 0)?$_GET['a_id'].'_'.$k:$k); echo replaceParam(array('a_id' => $a_id));?>"><?php echo $v['attr_value_name'];?></a></li>
                <?php }?>
              </ul>
            </dd>
            <?php if (count($val['value']) > 10){?>
            <dd class="all"><span nc_type="show"><i class="icon-angle-down"></i><?php echo $lang['goods_class_index_more'];?></span></dd>
            <?php }?>
          </dl>
          <?php }?>
          <?php $dl++;} ?>
          <?php }?>      

        </div>
      </div>
    </div>
    <?php }?>
    <?php }?>
    <div class="shop_con_list" id="main-nav-holder">
      <nav class="sort-bar" id="main-nav">
      <div class="pagination"><?php echo $output['show_page1']; ?> </div>
      <div class="nch-all-category">
        <div class="all-category">
            <?php require template('layout/home_goods_class');?>
        </div>
      </div>
        <div class="nch-sortbar-array"> 排序方式：
          <ul>
            <li <?php if(!$_GET['key']){?>class="selected"<?php }?>><a href="<?php echo dropParam(array('order', 'key'));?>"  title="<?php echo $lang['goods_class_index_default_sort'];?>"><?php echo $lang['goods_class_index_default'];?></a></li>
            <li <?php if($_GET['key'] == '1'){?>class="selected"<?php }?>><a href="<?php echo ($_GET['order'] == '2' && $_GET['key'] == '1') ? replaceParam(array('key' => '1', 'order' => '1')):replaceParam(array('key' => '1', 'order' => '2')); ?>" <?php if($_GET['key'] == '1'){?>class="<?php echo $_GET['order'] == 1 ? 'asc' : 'desc';?>"<?php }?> title="<?php echo ($_GET['order'] == '2' && $_GET['key'] == '1')?$lang['goods_class_index_sold_asc']:$lang['goods_class_index_sold_desc']; ?>"><?php echo $lang['goods_class_index_sold'];?><i></i></a></li>
            <li <?php if($_GET['key'] == '2'){?>class="selected"<?php }?>><a href="<?php echo ($_GET['order'] == '2' && $_GET['key'] == '2') ? replaceParam(array('key' => '2', 'order' => '1')):replaceParam(array('key' => '2', 'order' => '2')); ?>" <?php if($_GET['key'] == '2'){?>class="<?php echo $_GET['order'] == 1 ? 'asc' : 'desc';?>"<?php }?> title="<?php  echo ($_GET['order'] == '2' && $_GET['key'] == '2')?$lang['goods_class_index_click_asc']:$lang['goods_class_index_click_desc']; ?>"><?php echo $lang['goods_class_index_click']?><i></i></a></li>
            <li <?php if($_GET['key'] == '3'){?>class="selected"<?php }?>><a href="<?php echo ($_GET['order'] == '2' && $_GET['key'] == '3') ? replaceParam(array('key' => '3', 'order' => '1')):replaceParam(array('key' => '3', 'order' => '2')); ?>" <?php if($_GET['key'] == '3'){?>class="<?php echo $_GET['order'] == 1 ? 'asc' : 'desc';?>"<?php }?> title="<?php echo ($_GET['order'] == '2' && $_GET['key'] == '3')?$lang['goods_class_index_price_asc']:$lang['goods_class_index_price_desc']; ?>"><?php echo $lang['goods_class_index_price'];?><i></i></a></li>
          </ul>
        </div>
        <div class="nch-sortbar-owner">商品类型： <span><a href="<?php echo dropParam(array('type'));?>" <?php if (!isset($_GET['type']) || !in_array($_GET['type'], array(1,2))) {?>class="selected"<?php }?>><i></i>全部</a></span> <span><a href="<?php echo replaceParam(array('type' => '1'));?>" <?php if ($_GET['type'] == 1) {?>class="selected"<?php }?>><i></i>商城自营</a></span> <span><a href="<?php echo replaceParam(array('type' => '2'));?>" <?php if ($_GET['type'] == 2) {?>class="selected"<?php }?>><i></i>商家加盟</a></span> </div>
        <div class="nch-sortbar-location">商品所在地：
          <div class="select-layer">
            <div class="holder"><em nc_type="area_name"><?php echo $lang['goods_class_index_area']; ?><!-- 所在地 --></em></div>
            <div class="selected"><a nc_type="area_name"><?php echo $lang['goods_class_index_area']; ?><!-- 所在地 --></a></div>
            <i class="direction"></i>
            <ul class="options">
              <?php require(BASE_TPL_PATH.'/home/goods_class_area.php');?>
            </ul>
          </div>
        </div>

      </nav>
      <!-- 商品列表循环  -->

      <div>
        <?php require_once (BASE_TPL_PATH.'/home/goods.squares.php');?>
      </div>
      <div class="tc mt20 mb20">
        <div class="pagination"> <?php echo $output['show_page']; ?> </div>
      </div>
    </div>
  </div>
</div>
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