<?php defined('InShopNC') or exit('Access Invalid!');?>
<!-- [底部] -->
<div id="footer">
  <ul class="footerArticleBox">
    <!-- 反馈 -->
    <li class="footerArticle">
      <dl class="clearfix question_icon">
        <dt></dt>
        <dd>意见反馈</dd>
      </dl>
      <dl class="clearfix tel24">
        <dt></dt>
        <dd><p>4007-777-777</p></dd>
      </dl>
    </li>


    <?php if(is_array($output['article_list']) && !empty($output['article_list'])){ ?>
    <?php foreach ($output['article_list'] as $k=> $article_class){ ?>
    <?php if(!empty($article_class)){ ?>
    <!-- 关于同程 -->
    <div class="footerArticle">
        <h3><?php if(is_array($article_class['class'])) echo $article_class['class']['ac_name'];?></h3>
        <ul>
        <?php if(is_array($article_class['list']) && !empty($article_class['list'])){ ?>
        <?php foreach ($article_class['list'] as $article){ ?>
        <li>
          <a target="_blank" title="<?php echo $article['article_title']?>" href="<?php echo urlShop('article', 'article',array('ac_id'=> $article['ac_id']));?>" rel="nofollow"><?php echo $article['article_title']?></a>
        </li>
        <?php }}?>
        </li>
      </ul>
    </div>
    <?php }}}?>
    <div class="clearfix"></div>
  </ul>
  <div class="friendLink">
      <div class="friendMain clearfix">
        <dl class="friendAnchor" id="fdLinklist">
          <dt>友情链接：</dt>
          <dd>
          <?php if(!empty($output['friendLink'])){foreach($output['friendLink'] as $v){?>
            <a target="_blank" href="<?php echo $v['link']?>"><?php echo $v['text']?></a>
          <?php }}?>
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
<div class="side_nav fixed side_nav_green">
    <a style="visibility: visible;" class="back_top" href="javascript:;" title="返回顶部"></a>
</div>

  
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.mousewheel.js"></script>
<script language="javascript">
$(function(){
	// Membership card
	$('[nctype="mcard"]').membershipCard({type:'shop'});
});
</script>
