<?php defined('InShopNC') or exit('Access Invalid!');?>

<?php if (is_array($output['code_sale_list']['code_info']) && !empty($output['code_sale_list']['code_info'])) { $i=0;?>
<?php foreach ($output['code_sale_list']['code_info'] as $key => $val) { ?>
    <?php foreach ($val['goods_list'] as $v) { $i++;if($i>=9) break;?>
     
            <li class="<?php if($i%4==1){?>mr0<?php }?>">
              <a href="<?php echo urlShop('goods','index',array('goods_id'=>$v['goods_id'])); ?>" title="<?php echo $v['goods_name']; ?>" target="_blank" onclick="_tcTraObj._tcTrackEvent('15353temaifirst', 'Pcblock', 'CN首页','30');">
              <div><i><?php echo round(10 / ($v['market_price'] / $v['goods_price']), 1);?>折</i>
              <img src="<?php echo strpos($v['goods_pic'],'http')===0 ? $v['goods_pic']:UPLOAD_SITE_URL."/".$v['goods_pic'];?>" alt="<?php echo $v['goods_name']; ?>" /></div>
              <div class="pro_des">
              <p><?php echo $v['goods_name']; ?></p>
              <span><em>¥</em><?php echo $v['goods_price'];?><i>起</i><i class="item_type">周边游</i></span> 
              </div>  
              </a>  
            </li>
    <?php }?>
<?php }}?>

