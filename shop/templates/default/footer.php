<?php defined('InShopNC') or exit('Access Invalid!');?>
<!-- [底部] -->
<div id="footer">
  <ul class="clearfix">
    <!-- 反馈 -->
    <li>
      <dl class="clearfix question_icon">
        <dt></dt>
        <dd>意见反馈</dd>
      </dl>
      <dl class="clearfix tel24">
        <dt></dt>
        <dd><p>24小时服务热线</p><p>4007-777-777</p></dd>
      </dl>
    </li>


    <?php if(is_array($output['article_list']) && !empty($output['article_list'])){ ?>
    <?php foreach ($output['article_list'] as $k=> $article_class){ ?>
    <?php if(!empty($article_class)){ ?>
    <!-- 关于同程 -->
    <li>
      <ul class="tcAboat">
        <li>
          <h3><?php if(is_array($article_class['class'])) echo $article_class['class']['ac_name'];?></h3>
        </li>

        <?php if(is_array($article_class['list']) && !empty($article_class['list'])){ ?>
        <?php foreach ($article_class['list'] as $article){ ?>
        <li>
          <a target="_blank" title="<?php echo $article['article_title']?>" href="<?php echo urlShop('article', 'article',array('ac_id'=> $article['ac_id']));?>" rel="nofollow"><?php echo $article['article_title']?></a>
        </li>
        <?php }}?>
 
        </li>
      </ul>
    </li>
    <?php }}}?>
  </ul>
  <div class="friendLink">
      <div class="friendMain clearfix">
        <dl class="friendAnchor" id="fdLinklist">
          <dt>友情链接：</dt>
          <dd>
            <a target="_blank" href="http://www.feiren.com">腾邦国际</a>
            <a target="_blank" href="http://www.daodao.com">到到网</a>
            <a target="_blank" href="http://www.8264.com">户外运动</a>
            <a href="http://www.mapbar.com/" target="_blank">地图查找</a>
            <a target="_blank" href="http://lvyou.baidu.com">百度旅游</a>
            <a target="_blank" href="http://www.cncn.com">欣欣旅游网</a>
            <a target="_blank" href="http://trip.elong.com">艺龙旅游指南</a>
            <a target="_blank" href="http://www.mipang.com/">米胖网</a>
            <a target="_blank" href="http://www.cdyou.net">长岛旅游</a>
            <a target="_blank" href="http://www.5fen.com/">五分旅游网</a>
            <a target="_blank" href="http://www.lvmama.com/">驴妈妈旅游网</a>
            <a target="_blank" href="http://www.tujia.com">途家网</a>
            <a target="_blank" href="http://www.ctcnn.com/">劲旅网</a>
            <a target="_blank" href="http://www.tianqi.com">天气网</a>
            <a target="_blank" href="http://www.utourworld.com">众信旅游</a>
            <a target="_blank" href="http://www.zglxw.com">北京中国国旅</a>
            <a target="_blank" href="http://www.edushi.com">e都市</a>
            <a target="_blank" href="http://www.9tour.cn">九游网</a>
            <a target="_blank" href="http://www.goldenholiday.com">黄金假日旅游网</a>
            <a target="_blank" href="http://www.qianzhengdaiban.com">中国签证资讯网</a>
            <a target="_blank" href="http://www.177dj.net">北京旅行社</a>
            <a target="_blank" href="http://www.yododo.com">游多多自助游</a>
            <a target="_blank" href="http://www.huoche.net">火车网</a>
            <a target="_blank" href="http://www.51you.com">新华旅行网</a>
            <a target="_blank" href="http://www.qyer.com/">穷游网</a>
            <a target="_blank" href="http://www.byecity.com">佰程旅行网</a>
            <a target="_blank" href="http://www.gwyou.com">昆明旅行社</a>
            <a target="_blank" href="http://www.ctcnn.com">旅游新媒体</a>
            <a target="_blank" title="中国经济网" href="http://travel.ce.cn">中国经济网</a>
            <a target="_blank" title="春秋航空" href="http://www.china-sss.com">春秋航空</a>
            <a target="_blank" href="http://www.19lou.com">19楼</a>
            <a target="_blank" href="http://www.becod.com">百酷特色住宿</a>
            <a target="_blank" href="http://www.sipjinjilake.com">金鸡湖景区</a>
            <a target="_blank" href="http://www.zhuna.cn">酒店预订</a>
            <a target="_blank" href="http://www.youbian.com">邮编生活网</a>
            <a target="_blank" href="http://www.sunnychina.com">阳光旅行网</a>
            <a target="_blank" href="http://jipiao.ly.com">同程机票查询</a>
            <a target="_blank" href="http://www.keyunzhan.com">客运站</a>
            <a target="_blank" href="http://dujia.qunar.com">旅游度假</a>
            <a target="_blank" href="http://www.city8.com">中国地图</a>
            <a target="_blank" href="http://www.fotosay.com">图说天下</a>
            <a target="_blank" href="http://www.uzai.com">悠哉旅游网</a>
            <a target="_blank" href="http://www.mafengwo.cn">蚂蜂窝旅游攻略</a>
            <a target="_blank" href="http://www.lvye.cn">绿野户外网</a>
            <a target="_blank" href="http://www.ethainan.com">三亚旅游</a>
            <a target="_blank" href="http://www.kuxun.cn">酷讯旅游网</a>
            <a target="_blank" href="http://www.beibaotu.com">背包兔旅游行程</a>
            <a target="_blank" href="http://www.tuniu.com">途牛旅游网</a>
            <a target="_blank" href="http://www.springtour.com">春秋旅游</a>
            <a target="_blank" href="http://www.cngaosu.com/">中国高速网</a>
            <a target="_blank" href="http://www.guolv.com/">北京神舟国旅</a>
            <a target="_blank" href="http://www.xialv.com/">侠侣周边游</a>
            <a target="_blank" href="http://you.ctrip.com/">携程旅游社区</a>
            <a target="_blank" href="http://www.autonavi.com/">高德地图</a>
          </dd>
        </dl>
        <a href="javascript:;" id="showLinkMore"><i></i></a>
      </div>
  </div>
  <p class="foot_info c9">
      Copyright © 2002-2015&nbsp;&nbsp;版权所有&nbsp;&nbsp;<a class="c9" href="" target="_blank" title="网络科技股份有限公司">科技股份有限公司</a><br>
      <a class="c9" target="_blank" href="<?php echo SHOP_TEMPLATES_URL;?>/images/20141103174615.jpg" title="苏ICP证B2-20100204">苏ICP证B2-20100204</a>&nbsp;&nbsp;[乙测资字32005078]<br>
      <a class="c9" target="_blank" href="" title="旅行社业务许可证：L-JS-CJ00070">旅行社业务许可证：L-JS-CJ00070</a>
  </p>
  <ul class="tcHonour clearfix">
      <li class="expImg">
        <span class="expIco"></span>
        <a target="_blank" title="首批商务部电商示范企业" href="" rel="nofollow">
          首批商务部
          <br>电商示范企业</a>
      </li>
      <li class="travelImg">
        <span class="trlIco"></span>
        <a target="_blank" title="2014中国旅游集团20强" href="" rel="nofollow">
          2014中国
          <br>旅游集团20强</a>
      </li>
      <li class="wellMark">
        <span class="wekIco"></span>
        <a ref="nofollow" href="" class="" target="_blank" title="可信网站">
          同程旅游
          <br>电子营业执照</a>
      </li>
      <li class="creditImg">
        <span class="crtIco thrbg"></span>
        <a target="_blank" title="AAA级信用企业" href="" rel="nofollow">
          AAA级
          <br>信用企业</a>
      </li>
    </ul></div>
</div>
<!-- [//底部] -->

<?php //echo getChat($layout);?>

<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.mousewheel.js"></script>
<script language="javascript">
$(function(){
	// Membership card
	$('[nctype="mcard"]').membershipCard({type:'shop'});
});
</script>
