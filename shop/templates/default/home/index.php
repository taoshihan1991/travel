<?php defined('InShopNC') or exit('Access Invalid!');?>
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/index.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ie6.js" charset="utf-8"></script>
<![endif]-->
<style type="text/css">
.category { display: block !important;}
</style>
  <div class="clear"></div>

<!-- HomeFocusLayout Begin-->
<div class="home-focus-layout">
    <?php echo $output['web_html']['index_pic'];?>
  <div class="right-sidebar">

    <div class="policy">
      <ul>
        <li class="b1">七天包退</li>
        <li class="b2">正品保障</li>
        <li class="b3">闪电发货</li>
      </ul>
    </div>
    <?php if(!empty($output['group_list']) && is_array($output['group_list'])) { ?>
    <div class="groupbuy">
      <div class="title"><i>团</i>近期团购</div>
      <ul>
        <?php foreach($output['group_list'] as $val) { ?>
        <li>
          <dl style=" background-image:url(<?php echo gthumb($val['groupbuy_image1'], 'small');?>)">
            <dt><?php echo $val['groupbuy_name']; ?></dt>
            <dd class="price"><span class="groupbuy-price"><?php echo ncPriceFormatForList($val['groupbuy_price']); ?></span><span class="buy-button"><a href="<?php echo urlShop('show_groupbuy','groupbuy_detail',array('group_id'=> $val['groupbuy_id']));?>">立即团</a></span></dd>
            <dd class="time"><span class="sell">已售<em><?php echo $val['buy_quantity'];?></em></span>
                <span class="time-remain" count_down="<?php echo $val['end_time']-TIMESTAMP; ?>"> <em time_id="d">0</em><?php echo $lang['text_tian'];?><em time_id="h">0</em><?php echo $lang['text_hour'];?>
                    <em time_id="m">0</em><?php echo $lang['text_minute'];?><em time_id="s">0</em><?php echo $lang['text_second'];?> </span></dd>
          </dl>
        </li>
        <?php } ?>
      </ul>
    </div>
    <?php } ?>
    <div class="proclamation">
      <ul class="tabs-nav">
        <li class="tabs-selected">
          <h3><?php echo $output['show_article']['notice']['ac_name'];?></h3>
        </li>
        <li>
          <h3>招商入驻</h3>
        </li>
      </ul>
      <div class="tabs-panel">
        <ul class="mall-news">
          <?php if(!empty($output['show_article']['notice']['list']) && is_array($output['show_article']['notice']['list'])) { ?>
          <?php foreach($output['show_article']['notice']['list'] as $val) { ?>
            <li><i></i><a target="_blank" href="<?php echo empty($val['article_url']) ? urlShop('article', 'show',array('article_id'=> $val['article_id'])):$val['article_url'] ;?>" title="<?php echo $val['article_title']; ?>"><?php echo str_cut($val['article_title'],24);?> </a>
            <time>(<?php echo date('Y-m-d',$val['article_time']);?>)</time> </li>
          <?php } ?>
          <?php } ?>
        </ul>
      </div>
      <div class="tabs-panel tabs-hide">
        <a href="<?php echo urlShop('store_joinin', 'index');?>" title="申请商家入驻；已提交申请，可查看当前审核状态。" class="store-join-btn" target="_blank">&nbsp;</a>
        <a href="<?php echo urlShop('document', 'index', array('code' => 'open_store'));?>" target="_blank" class="store-join-help"><i class="icon-question-sign"></i>查看开店协议</a>

        </div>
    </div>
  </div>
</div>
<!--HomeFocusLayout End-->
<script type="text/javascript" src="<?php echo SHOP_RESOURCE_SITE_URL;?>/js/home_index.js" charset="utf-8"></script>

<!-- [主体内容] -->
<div class="content_box">
  <div id="content" class="content_main clearfix">
      <div id="Preferential">
    <h3>每日特惠</h3>
    <div class="infocon">
      <div class="prel">
        <ul>
          <div id="portal-block-708469721524" class="udiyblock"  type="CommonSource">             
            <li>
              <a href="http://www.ly.com/zizhuyou/qingdao292/70887-xianlu/#Resys=104_E5_L8aXrL_1_C_101" title="青岛海上观光+微笑如家商务酒店（青岛温馨店）" target="_blank" onclick="_tcTraObj._tcTrackEvent('15353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                          <i>1.8折</i>
                <img src="images/j06er3_150x150_00.jpg" alt="青岛海上观光+微笑如家商务酒店（青岛温馨店）" /></div>
        <div class="pro_des">
        <p>青岛海上观光+微笑如家商务酒店（青岛温馨店）</p>
        <span><em>¥</em>99<i>起</i><i class="item_type">周边游</i></span> 
        </div>  
      </a>  
    </li>
          <li>
              <a href="http://www.ly.com/zizhuyou/qingdao292/54691-xianlu/#Resys=104_E5_L8aXrL_2_C_102" title="第一海水浴场+青岛市南区新天桥宾馆2晚" target="_blank" onclick="_tcTraObj._tcTrackEvent('25353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                          <i>2.2折</i>
                <img src="images/IpvCIc_150x150_00.jpg" alt="第一海水浴场+青岛市南区新天桥宾馆2晚" /></div>
        <div class="pro_des">
        <p>第一海水浴场+青岛市南区新天桥宾馆2晚</p>
        <span><em>¥</em>129<i>起</i><i class="item_type">周边游</i></span>  
        </div>  
      </a>  
    </li>
          <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_7545.html#Resys=104_E5_L8aXrL_1_C_103" title="沂蒙山旅游区（龟蒙景区）" target="_blank" onclick="_tcTraObj._tcTrackEvent('35353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                        <img src="images/ing0Fs_160x120_00.jpg" alt="沂蒙山旅游区（龟蒙景区）" /></div>
        <div class="pro_des">
        <p>沂蒙山旅游区（龟蒙景区）</p>
        <span><em>¥</em>0<i>起</i><i class="item_type">景点</i></span> 
        </div>  
      </a>  
    </li>
          <li class="mr0">
              <a href="http://www.ly.com/HotelInfo-22864.html#Resys=104_E5_L8aXrL_1_C_104" target="_blank" title="临沂衡山智圣汤泉度假村" onclick="_tcTraObj._tcTrackEvent('45353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                          <i>热卖</i>
                <img src="images/0742ce44b46a468eba4ec10d4eb954bd_400x300_01.jpg" alt="临沂衡山智圣汤泉度假村" /></div>
        <div class="pro_des">
        <p>临沂衡山智圣汤泉度假村</p>
        <span><em>¥</em>358<i>起</i><i class="item_type">酒店</i></span> 
        </div>  
      </a>  
    </li>
          <li>
              <a href="http://www.ly.com/dujia/tours/213143.html#Resys=104_E5_XrHSa5_1_S_105" target="_blank" title="[【限量特惠】普吉岛4晚6天自由行]上海直飞，入住芭东区精品度假村（含早），赠接机服务" onclick="_tcTraObj._tcTrackEvent('55353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                          <i>7.8折</i>
                <img src="images/t6xpdp.jpg" alt="[【限量特惠】普吉岛4晚6天自由行]上海直飞，入住芭东区精品度假村（含早），赠接机服务" /></div>
        <div class="pro_des">
        <p>[【限量特惠】普吉岛4晚6天自由行]上海直飞，入住芭东区精品度假村（含早），赠接机服务</p>
        <span><em>¥</em>3099<i>起</i><i class="item_type">出境</i></span>  
        </div>  
      </a>  
    </li>
          <li>
              <a href="http://www.ly.com/dujia/tours/66949.html#Resys=104_E5_Tefn1S_2_S_106" target="_blank" title="[【特推线路】韩国首尔4日游]深圳直飞，免费升级一晚五花酒店，汉江游船，涂鸦秀，南山公园和华克山庄" onclick="_tcTraObj._tcTrackEvent('65353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                          <i>4.5折</i>
                <img src="http://pic3.40017.cn/line/admin/2015/01/27/14/dcPnfX.jpg" alt="[【特推线路】韩国首尔4日游]深圳直飞，免费升级一晚五花酒店，汉江游船，涂鸦秀，南山公园和华克山庄" /></div>
        <div class="pro_des">
        <p>[【特推线路】韩国首尔4日游]深圳直飞，免费升级一晚五花酒店，汉江游船，涂鸦秀，南山公园和华克山庄</p>
        <span><em>¥</em>1799<i>起</i><i class="item_type">出境</i></span>  
        </div>  
      </a>  
    </li>
          <li>
                      <a href="http://gny.ly.com/guoneiyou/tours/1347.html#Resys=104_E5_L8aXrL_1_C_107" target="_blank" title="【无忧体验】西安兵马俑华清池华山法门寺双飞5日跟团游" onclick="_tcTraObj._tcTrackEvent('75353temaifirst', 'Pcblock', 'CN首页','30');">
                  <div>
                          <i>7.8折</i>
                <img src="http://pic3.40017.cn/gny/line/2015/02/06/10/VV7pxb.jpg" alt="【无忧体验】西安兵马俑华清池华山法门寺双飞5日跟团游" /></div>
        <div class="pro_des">
        <p>【无忧体验】西安兵马俑华清池华山法门寺双飞5日跟团游</p>
        <span><em>¥</em>2499<i>起</i><i class="item_type">国内游</i></span> 
        </div>  
      </a>  
    </li>
          <li class="mr0">
              <a href="http://www.ly.com/youlun/tours-71916.html#Resys=104_E5_HKmf90_1_S_108" target="_blank" title="【海上端午】【歌诗达邮轮-维多利亚号】2015年6月19日 上海-济州-福冈-上海 4晚5日游" onclick="_tcTraObj._tcTrackEvent('85353temaifirst', 'Pcblock', 'CN首页','30');">
            <div>
                          <i>7.5折</i>
                <img src="http://pic3.40017.cn/cruises/2015/01/22/16/qI7rMt.jpg" alt="【海上端午】【歌诗达邮轮-维多利亚号】2015年6月19日 上海-济州-福冈-上海 4晚5日游" /></div>
        <div class="pro_des">
        <p>【海上端午】【歌诗达邮轮-维多利亚号】2015年6月19日 上海-济州-福冈-上海 4晚5日游</p>
        <span><em>¥</em>2999<i>起</i><i class="item_type">邮轮</i></span>  
        </div>  
      </a>  
    </li>
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
    <div class="scenicPnel" id="scenicPnel">
        <h3>景点门票</h3>
        <div class="infocon">
            <div class="slpnel">
                <div id="portal-block-139299479305" class="udiyblock"  type="CommonSource"> 
      <div class="hotsec">
    <h4>热门目的地</h4>
    <ul>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_287__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_1_C" target="_blank" title="济南" onclick="_tcTraObj._tcTrackEvent('scenery15353hotdestiny', 'Pcblock', 'CN首页','30');">济南</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_292__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_2_C" target="_blank" title="青岛" onclick="_tcTraObj._tcTrackEvent('scenery25353hotdestiny', 'Pcblock', 'CN首页','30');">青岛</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_294__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_3_C" target="_blank" title="泰安" onclick="_tcTraObj._tcTrackEvent('scenery35353hotdestiny', 'Pcblock', 'CN首页','30');">泰安</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_291__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_4_C" target="_blank" title="临沂" onclick="_tcTraObj._tcTrackEvent('scenery45353hotdestiny', 'Pcblock', 'CN首页','30');">临沂</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_284__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_5_C" target="_blank" title="德州" onclick="_tcTraObj._tcTrackEvent('scenery55353hotdestiny', 'Pcblock', 'CN首页','30');">德州</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_297__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_6_C" target="_blank" title="烟台" onclick="_tcTraObj._tcTrackEvent('scenery65353hotdestiny', 'Pcblock', 'CN首页','30');">烟台</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_295__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_7_C" target="_blank" title="威海" onclick="_tcTraObj._tcTrackEvent('scenery75353hotdestiny', 'Pcblock', 'CN首页','30');">威海</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_298__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_8_C" target="_blank" title="枣庄" onclick="_tcTraObj._tcTrackEvent('scenery85353hotdestiny', 'Pcblock', 'CN首页','30');">枣庄</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_288__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_9_C" target="_blank" title="济宁" onclick="_tcTraObj._tcTrackEvent('scenery95353hotdestiny', 'Pcblock', 'CN首页','30');">济宁</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_296__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_10_C" target="_blank" title="潍坊" onclick="_tcTraObj._tcTrackEvent('scenery105353hotdestiny', 'Pcblock', 'CN首页','30');">潍坊</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_299__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_11_C" target="_blank" title="淄博" onclick="_tcTraObj._tcTrackEvent('scenery115353hotdestiny', 'Pcblock', 'CN首页','30');">淄博</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_293__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_12_C" target="_blank" title="日照" onclick="_tcTraObj._tcTrackEvent('scenery125353hotdestiny', 'Pcblock', 'CN首页','30');">日照</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_16_226__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_13_C" target="_blank" title="苏州" onclick="_tcTraObj._tcTrackEvent('scenery135353hotdestiny', 'Pcblock', 'CN首页','30');">苏州</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_3_53__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_14_C" target="_blank" title="北京" onclick="_tcTraObj._tcTrackEvent('scenery145353hotdestiny', 'Pcblock', 'CN首页','30');">北京</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_285__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_15_C" target="_blank" title="东营" onclick="_tcTraObj._tcTrackEvent('scenery155353hotdestiny', 'Pcblock', 'CN首页','30');">东营</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_283__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_16_C" target="_blank" title="滨州" onclick="_tcTraObj._tcTrackEvent('scenery165353hotdestiny', 'Pcblock', 'CN首页','30');">滨州</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_27_343__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_17_C" target="_blank" title="天津" onclick="_tcTraObj._tcTrackEvent('scenery175353hotdestiny', 'Pcblock', 'CN首页','30');">天津</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_16_232__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_18_C" target="_blank" title="扬州" onclick="_tcTraObj._tcTrackEvent('scenery185353hotdestiny', 'Pcblock', 'CN首页','30');">扬州</a>
      </li>
            <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_22_290__0_0_0_0_0_0_0.html#Resys=89_E5_v5WzHO_19_C" target="_blank" title="聊城" onclick="_tcTraObj._tcTrackEvent('scenery195353hotdestiny', 'Pcblock', 'CN首页','30');">聊城</a>
      </li>
          </ul>
    <div class="clearfix"></div>
  </div>
  </div>
                <div id="portal-block-695721559470" class="udiyblock"  type="CommonSource">     <div class="hotsec">
    <h4>主题景点</h4>
    <ul>
                                                                  <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100303.html#Resys=88_100303_5" target="_blank" title="主题乐园" onclick="_tcTraObj._tcTrackEvent('theme15353scenery', 'Pcblock', 'CN首页','30');">主题乐园</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100104.html#Resys=88_100104_6" target="_blank" title="园林" onclick="_tcTraObj._tcTrackEvent('theme25353scenery', 'Pcblock', 'CN首页','30');">园林</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100311.html#Resys=88_100311_7" target="_blank" title="城市观光" onclick="_tcTraObj._tcTrackEvent('theme35353scenery', 'Pcblock', 'CN首页','30');">城市观光</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100313.html#Resys=88_100313_8" target="_blank" title="温泉" onclick="_tcTraObj._tcTrackEvent('theme45353scenery', 'Pcblock', 'CN首页','30');">温泉</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100101.html#Resys=88_100101_9" target="_blank" title="名胜古迹" onclick="_tcTraObj._tcTrackEvent('theme55353scenery', 'Pcblock', 'CN首页','30');">名胜古迹</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100308.html#Resys=88_100308_10" target="_blank" title="植物园" onclick="_tcTraObj._tcTrackEvent('theme65353scenery', 'Pcblock', 'CN首页','30');">植物园</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100321.html#Resys=88_100321_11" target="_blank" title="展览" onclick="_tcTraObj._tcTrackEvent('theme75353scenery', 'Pcblock', 'CN首页','30');">展览</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100314.html#Resys=88_100314_12" target="_blank" title="游船" onclick="_tcTraObj._tcTrackEvent('theme85353scenery', 'Pcblock', 'CN首页','30');">游船</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100312.html#Resys=88_100312_13" target="_blank" title="影视基地" onclick="_tcTraObj._tcTrackEvent('theme95353scenery', 'Pcblock', 'CN首页','30');">影视基地</a>
      </li>
                        <li>
        <a href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100103.html#Resys=88_100103_14" target="_blank" title="博物馆" onclick="_tcTraObj._tcTrackEvent('theme105353scenery', 'Pcblock', 'CN首页','30');">博物馆</a>
      </li>
                                                                                                    </ul>
    <div class="clearfix"></div>
  </div>
  </div>
            </div>
            <div class="srpnel">
                <div id="portal-block-788868113099" class="udiyblock"  type="CommonSource">     <div>
    <ul>
                                  <li  class='cur' theme-id="100102" theme-name="古镇" theme-number="1" more-url="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100102.html">古镇</li>
                                        <li  theme-id="100307" theme-name="动物园" theme-number="2" more-url="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100307.html">动物园</li>
                                        <li  theme-id="100201" theme-name="自然风光" theme-number="3" more-url="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100201.html">自然风光</li>
                                        <li  theme-id="100310" theme-name="海洋馆" theme-number="4" more-url="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100310.html">海洋馆</li>
                                                                                                                                                                                        </ul>
    <a class="m-scenic"  target="_blank" href="http://www.ly.com/scenery/scenerysearchlist_0_0__0_0_0_0_0_0_100102.html" clickname="more5353scenerytab" onclick="_tcTraObj._tcTrackEvent('more5353scenerytab1', 'Pcblock', 'CN首页','30');">更多景点</a>
    <span class="clearfix"></span>
  </div>
  </div>
                <div>
          <div class="proscenic-list pnel">
                        <ul>
            <div id="portal-block-623789962195" class="udiyblock"  type="CommonSource">                                                                                                                                                                                                                                                                                                             <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_27189.html#Resys=88_E5_rbvfvL_1_B_1" title="台儿庄古城" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery15353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/18/08/x1ijqm_218x147_00.jpg" alt="台儿庄古城"/>
          <span>台儿庄古城</span>
          <p><i>¥</i>5</p>
        </a>
      </li>
                        <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_7605.html#Resys=88_E5_rbvfvL_2_B_2" title="朱家峪风景区" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery25353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/18/11/zmdlnb_218x147_00.jpg" alt="朱家峪风景区"/>
          <span>朱家峪风景区</span>
          <p><i>¥</i>30</p>
        </a>
      </li>
                        <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_6344.html#Resys=88_E5_rbvfvL_3_B_3" title="周村古商城" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery35353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/17/22/djfjgg_218x147_00.jpg" alt="周村古商城"/>
          <span>周村古商城</span>
          <p><i>¥</i>50</p>
        </a>
      </li>
                        <li class="mr0">
              <a href="http://www.ly.com/scenery/BookSceneryTicket_179472.html#Resys=88_E5_rbvfvL_4_B_4" title="蒙山人家" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery45353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/18/08/c3lqm8_218x147_00.jpg" alt="蒙山人家"/>
          <span>蒙山人家</span>
          <p><i>¥</i>1</p>
        </a>
      </li>
                        <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_28998.html#Resys=88_E5_rbvfvL_5_B_5" title="窑湾古镇" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery55353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/19/12/i44y4r_218x147_00.jpg" alt="窑湾古镇"/>
          <span>窑湾古镇</span>
          <p><i>¥</i>50</p>
        </a>
      </li>
                        <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_29326.html#Resys=88_E5_rbvfvL_6_B_6" title="羊山古镇国际军事旅游度假区" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery65353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/18/15/macmdh_218x147_00.jpg" alt="羊山古镇国际军事旅游度假区"/>
          <span>羊山古镇国际军事旅游度假区</span>
          <p><i>¥</i>28</p>
        </a>
      </li>
                        <li>
              <a href="http://www.ly.com/scenery/BookSceneryTicket_29577.html#Resys=88_E5_rbvfvL_7_B_7" title="泰安戴村坝" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery75353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/17/12/5vuktr_218x147_00.jpg" alt="泰安戴村坝"/>
          <span>泰安戴村坝</span>
          <p><i>¥</i>24</p>
        </a>
      </li>
                        <li class="mr0">
              <a href="http://www.ly.com/scenery/BookSceneryTicket_30712.html#Resys=88_E5_rbvfvL_1_R_8" title="济南跑马岭野生动物世界" target="_blank" onclick="_tcTraObj._tcTrackEvent('scenery85353scenerytab1', 'Pcblock', 'CN首页','30');">
                              <img src="http://pic3.40017.cn/scenery/destination/2015/04/19/08/it6rsu_218x147_00.jpg" alt="济南跑马岭野生动物世界"/>
          <span>济南跑马岭野生动物世界</span>
          <p><i>¥</i>1</p>
        </a>
      </li>
                          </div>
            </ul>
                        <div class="clearfix"></div>
                    </div>
          <div class="proscenic-list pnel none">
                        <ul>
            </ul>
                    </div>
          <div class="proscenic-list pnel none">
                        <ul>
            </ul>
                    </div>
          <div class="proscenic-list pnel none">
                        <ul>
            </ul>
                    </div>
          <div id="portal-block-953937325421" class="udiyblock"  type="CommonSource"> <div class="prpsecpic">
                        <a href="http://www.ly.com/scenery/BookSceneryTicket_79.html"  target="_blank" onclick="_tcTraObj._tcTrackEvent('sceneryad5353', 'Pcblock', 'CN首页','30');">
                            <img src="http://upload.17u.com/uploadfile/2015/05/12/33/2015051217423746698.jpg" alt="" class="bpicsc-last"/>
                        </a>
                    </div></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>


  <div id="bustour" class="scenicPnel" style="display:none">
    <h3>巴士跟团游</h3>
    <div class="infocon">
      <div class="slpnel">
                <div class="hotsec">
          <h4>热门出发地</h4>
          <ul>
            <div id="portal-block-1313429191539" class="udiyblock"  type="AdModel">                             <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__224.html?refid=55469767" target="_blank" title="南京出发">南京</a>
                            </li>
               <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__53.html?refid=55469767" target="_blank" title="北京出发">北京</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__226.html?refid=55469767" target="_blank" title="苏州出发">苏州</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__80.html?refid=55469767" target="_blank" title="广州出发">广州</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__321.html?refid=55469767" target="_blank" title="上海出发">上海</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__383.html?refid=55469767" target="_blank" title="杭州出发">杭州</a>
                            </li>
               <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__343.html?refid=55469767" target="_blank" title="天津出发">天津</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__163.html?refid=55469767" target="_blank" title="郑州出发">郑州</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__91.html?refid=55469767" target="_blank" title="深圳出发">深圳</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__229.html?refid=55469767" target="_blank" title="无锡出发">无锡</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__384.html?refid=55469767" target="_blank" title="湖州出发">湖州</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__388.html?refid=55469767" target="_blank" title="宁波出发">宁波</a>
                            </li>

              <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__42.html?refid=55469767" target="_blank" title="合肥出发">合肥</a>
                            </li>
              
              <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__192.html?refid=55469767" target="_blank" title="武汉出发">武汉</a>
                            </li>
              
              <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__287.html?refid=55469767" target="_blank" title="济南出发">济南</a>
                            </li>
              <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist__133.html?refid=55469767" target="_blank" title="三亚出发">三亚</a>
                            </li>
                            </div>
          </ul>
          <div class="clearfix"></div>
        </div>
        <div class="hotsec">
          <h4>热门景点</h4>
          <ul>
            <div id="portal-block-20661012088" class="udiyblock"  type="AdModel">                             <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E8%A5%BF%E5%A1%98_0.html?refid=55469767" target="_blank" title="到西塘游玩线路">西塘</a>
                            </li>
               <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E6%AC%A2%E4%B9%90%E8%B0%B7_0.html?refid=55469767" target="_blank" title="到欢乐谷游玩线路">欢乐谷</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E8%A5%BF%E6%B9%96_0.html?refid=55469767" target="_blank" title="到西湖游玩线路">西湖</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E7%81%B5%E5%B1%B1%E5%A4%A7%E4%BD%9B_0.html?refid=55469767" target="_blank" title="到灵山大佛游玩线路">灵山大佛</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E9%BB%84%E5%B1%B1_0.html?refid=55469767" target="_blank" title="到黄山游玩线路">黄山</a>
                            </li>
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E6%99%AE%E9%99%80%E5%B1%B1_0.html?refid=55469767" target="_blank" title="到普陀山游玩线路">普陀山</a>
                            </li>
               <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E4%B9%90%E5%9B%AD_0.html?refid=55469767" target="_blank" title="到乐园游玩线路">乐园</a>
                            </li>
              
                           <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E9%A1%BA%E5%BE%B7%E9%95%BF%E9%B9%BF%E5%86%9C%E5%BA%84_0.html?refid=55469767" target="_blank" title="到顺德长鹿农庄游玩线路">顺德长鹿农庄</a>
                            </li>
                            
                            <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E6%B7%B1%E5%9C%B3%E4%B8%96%E7%95%8C%E4%B9%8B%E7%AA%97_0.html?refid=55469767" target="_blank" title="到深圳世界之窗游玩线路">深圳世界之窗</a>
                            </li>
              <li>
                                <a href="http://www.ly.com/scenery/yrysearchlist_%E7%8B%AE%E5%AD%90%E6%9E%97_0.html?refid=55469767" target="_blank" title="到狮子林游玩线路">狮子林</a>
                            </li></div>
          </ul>
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="srpnel">
        <div id="portal-block-1401160868671" class="udiyblock"  type="CommonSource"> <div>
  <ul>
    <li class="cur" method="yry" typeid="1" more-url="http://www.ly.com/scenery/yrysearchlist.html">一日游</li>
      <li method="erry" typeid="2" more-url="http://www.ly.com/zizhuyou/linesearchlistbus.aspx">二日游</li>
  </ul>
  <a class="m-scenic"  target="_blank" href="http://www.ly.com/scenery/yrysearchlist.html" clickname="more5353bustourtab" onclick="_tcTraObj._tcTrackEvent('more5353bustourtab1', 'Pcblock', 'CN首页','30');">更多巴士游线路</a>
  <span class="clearfix"></span>
</div></div>
        <div>
          <div class="proscenic-list pnel">
            <ul>
              <div id="portal-block-70240019335" class="udiyblock"  type="CommonSource">                <li>
              <a href="http://www.ly.com/bustour/ProductDetail_3079.html" title="<杭州-上海>上海东方明珠塔+蜡像馆+城隍庙+外滩跟团1日游" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour15353bustourtab1', 'Pcblock', 'CN首页','30');">   
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/oP76tD_250x173_00.jpg" alt="<杭州-上海>上海东方明珠塔+蜡像馆+城隍庙+外滩跟团1日游"/>
        <span><杭州-上海>上海东方明珠塔+蜡像馆+城隍庙+外滩跟团1日游</span>
                        <p><i>¥</i>146</p>
              </a>
    </li>
                    <li>
              <a href="http://www.ly.com/bustour/ProductDetail_3078.html" title="<三亚一日游>【远海潜水+三亚热带天堂森林公园+亚龙湾海底世界】跟团一日游" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour25353bustourtab1', 'Pcblock', 'CN首页','30');">    
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/kUqvuU_250x173_00.jpg" alt="<三亚一日游>【远海潜水+三亚热带天堂森林公园+亚龙湾海底世界】跟团一日游"/>
        <span><三亚一日游>【远海潜水+三亚热带天堂森林公园+亚龙湾海底世界】跟团一日游</span>
                        <p><i>¥</i>518</p>
              </a>
    </li>
                    <li>
              <a href="http://www.ly.com/bustour/ProductDetail_3077.html" title="<杭州-上海>上海东方明珠+蜡像馆+外滩+城隍庙+南京步行街跟团一日游" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour35353bustourtab1', 'Pcblock', 'CN首页','30');">    
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/ars7gW_250x173_00.jpg" alt="<杭州-上海>上海东方明珠+蜡像馆+外滩+城隍庙+南京步行街跟团一日游"/>
        <span><杭州-上海>上海东方明珠+蜡像馆+外滩+城隍庙+南京步行街跟团一日游</span>
                        <p><i>¥</i>178</p>
              </a>
    </li>
                        <li class="mr0">
            <a href="http://www.ly.com/bustour/ProductDetail_3076.html" title="【热卖】三亚亚龙湾森林公园+亚龙湾沙滩跟团1日游" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour45353bustourtab1', 'Pcblock', 'CN首页','30');">   
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/SEbyRM_250x173_00.jpg" alt="【热卖】三亚亚龙湾森林公园+亚龙湾沙滩跟团1日游"/>
        <span>【热卖】三亚亚龙湾森林公园+亚龙湾沙滩跟团1日游</span>
                        <p><i>¥</i>158</p>
              </a>
    </li>
                    <li>
              <a href="http://www.ly.com/bustour/ProductDetail_3075.html" title="<三亚一日游>【三亚热带天堂森林公园+亚龙湾沙滩+自助养生餐】跟团一日游（三亚出发）" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour55353bustourtab1', 'Pcblock', 'CN首页','30');">   
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/95pkO8_250x173_00.jpg" alt="<三亚一日游>【三亚热带天堂森林公园+亚龙湾沙滩+自助养生餐】跟团一日游（三亚出发）"/>
        <span><三亚一日游>【三亚热带天堂森林公园+亚龙湾沙滩+自助养生餐】跟团一日游（三亚出发）</span>
                        <p><i>¥</i>188</p>
              </a>
    </li>
                    <li>
              <a href="http://www.ly.com/bustour/ProductDetail_3072.html" title="<桂林北线乐满地1日游>【乐满地AAAAA主题乐园】（含车接送-桂林出发）无自费无购物" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour65353bustourtab1', 'Pcblock', 'CN首页','30');">    
                        <img src="http://pic3.40017.cn/shortTour/2015/04/17/10/Cmh6TA_250x173_00.jpg" alt="<桂林北线乐满地1日游>【乐满地AAAAA主题乐园】（含车接送-桂林出发）无自费无购物"/>
        <span><桂林北线乐满地1日游>【乐满地AAAAA主题乐园】（含车接送-桂林出发）无自费无购物</span>
                        <p><i>¥</i>168</p>
              </a>
    </li>
                    <li>
              <a href="http://www.ly.com/bustour/ProductDetail_3071.html" title="<北海一日游>【游北海海洋之窗+渔家乐】（北海出发）" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour75353bustourtab1', 'Pcblock', 'CN首页','30');">   
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/Sr6XNW_250x173_00.jpg" alt="<北海一日游>【游北海海洋之窗+渔家乐】（北海出发）"/>
        <span><北海一日游>【游北海海洋之窗+渔家乐】（北海出发）</span>
                        <p><i>¥</i>188</p>
              </a>
    </li>
                        <li class="mr0">
            <a href="http://www.ly.com/bustour/ProductDetail_3070.html" title="<徐州一日游>【游龟山汉墓+云龙湖+淮塔园林+汉文化景区公园】（徐州出发）" target="_blank" onclick="_tcTraObj._tcTrackEvent('bustour85353bustourtab1', 'Pcblock', 'CN首页','30');">    
                        <img src="http://pic3.40017.cn/shortTour/2015/04/09/17/7dQhzM_250x173_00.jpg" alt="<徐州一日游>【游龟山汉墓+云龙湖+淮塔园林+汉文化景区公园】（徐州出发）"/>
        <span><徐州一日游>【游龟山汉墓+云龙湖+淮塔园林+汉文化景区公园】（徐州出发）</span>
                        <p><i>¥</i>248</p>
              </a>
    </li>
                  </div>
            </ul>
            <div class="clearfix"></div>
          </div>
          <div class="proscenic-list pnel none">
            <ul>
            </ul>
          </div>
          <div id="portal-block-1024300158331" class="udiyblock"  type="CommonSource"> <div class="prpsecpic">
                            <a href="http://www.ly.com/zizhuyou/suzhou226/70021-xianlu?refid=55469767"  target="_blank" onclick="_tcTraObj._tcTrackEvent('bustourad5353', 'Pcblock', 'CN首页','30');">
                                <img src="images/2015417113103.jpg" alt="" class="bpicsc-last"/>
                            </a>
                        </div></div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
  </div>
 
  <?if(is_array($output['categoryTabFloor'])){foreach($output['categoryTabFloor'] as $category){?>
  <div class="inbound" id="inbound">
        <h3><?php echo $category[0]['gc_name']?></h3>
        <div class="infocon">
      <div class="slpnel">
      <div class="udiyblock"  type="CommonSource"> <h4>热门目的地</h4>
      <ul>
        <?if(is_array($category)){foreach($category as $cate){?>
            <li><a href="" des="<?php echo $cate['gc_name']?>" target="_blank" title="<?php echo $cate['gc_name']?>"><?php echo $cate['gc_name']?></a>
            </li>
        <?php }}?>
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
                        <a class="m-scenic" href="" >更多<?php echo $category[0]['gc_name']?></a>
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
    <a href="http://www.ly.com/zhuanti/lyjhz/?from=CNhome" target="_blank" rel="nofollow">
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
