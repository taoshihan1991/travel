<?php defined('InShopNC') or exit('Access Invalid!');?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>跳转提示</title> 
<body>
<!-- 弹窗 -->
<style type="text/css">
.alertBoxBg{
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: #000;
    opacity: 0.5;
    filter: alpha(opacity=50);
    z-index: 999;
}
.alertBoxContainer{
    position: fixed;
    width: 380px;
    height: 160px;
    left: 50%;
    top: 40%;
    margin-left: -190px;
    margin-top: -80px;
    background: #fff;
    color: #444;
    border-radius: 5px;
    border:6px solid #707070;
    z-index: 9999;
}
.alertBoxContainer .alertBoxTitle{
    font-size: 14px;
    font-weight: 700;
    color: #369;
    height: 38px;
    line-height: 38px;
    overflow: hidden;
}
.alertBoxContainer .alertBoxTitle span{
    padding-left: 10px;
}
.alertBoxContainer .alertBoxTitle .ico{
    display: block;
    float: right;
    padding:2px 4px;
    background: #ddd;
    font-style: normal;
    line-height: 12px;
    text-align: center;
    margin-right: 10px;
    margin-top: 5px;
    cursor: pointer;
    color: #fff;
    border-radius: 1px;

}
.alertBoxContainer .alertBoxTitle .ico:hover{
    background: #369;
    color: #fff;
}
.alertBoxContainer .alertBoxInfo{
    height: 70px;
    border-bottom: 1px solid #ccc;
    margin-top: 10px;
    text-align: center;
    color: #444;
    font-size: 16px;
    padding-top: 10px;
    font-weight: bold;

}
.icon-ok-sign,.icon-info-sign{
	font-size: 20px;
	font-weight: bold;
}
.alertBoxContainer .alertBoxBtn{
	display: block;
    background:#0b60a1;
    padding: 5px 7px;
    color: #fff;
    border-bottom: 1px solid #095188;
    border-radius: 1px;
    font-size: 12px;
    text-decoration: none;
}
.alertBoxContainer .alertBoxBtn:hover{
}
.alertBoxContainer .alertBoxBottom{
    position: relative;
}
.alertBoxContainer .alertBoxBottom .alertBoxBtn{
    position: absolute;
    right: 10px;
    top: 5px;
}
</style>
<div class="alertBoxBg"></div>
<div class="alertBoxContainer">
    <div class="alertBoxTitle">
        <span>提示信息</span>
        <a class="ico" href="<?php echo $output['url'];?>">x</a>
    </div>
    <div class="alertBoxInfo">
        <div class="msg">
	      	<?php if($output['msg_type'] == 'error'){ ?>
	     	 <i class="icon-info-sign" style="color: #D93600;">X</i>
	        <?php }else { ?>
	      	<i class="icon-ok-sign" style=" color: #27AE61;">√</i>
	        <?php } ?>
	        <?php require_once($tpl_file);?>
		</div>
    </div>
    <div class="alertBoxBottom">
        <a href="<?php echo $output['url'];?>" class="alertBoxBtn">确定</a>
    </div>
</div>

<script type="text/javascript">
<?php if (!empty($output['url'])){
?>
	window.setTimeout("javascript:location.href='<?php echo $output['url'];?>'", <?php echo $time;?>);
<?php
}else{
?>
	window.setTimeout("javascript:history.back()", <?php echo $time;?>);
<?php
}?>
</script>
</body> 
</html> 
<?php die;?>



<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>">
<title><?php echo $output['html_title'];?></title>
<meta name="keywords" content="<?php echo $GLOBALS['setting_config']['site_keywords']; ?>" />
<meta name="description" content="<?php echo $GLOBALS['setting_config']['site_description']; ?>" />
<meta name="author" content="ShopNC">
<meta name="copyright" content="ShopNC Inc. All Rights Reserved">
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/base.css" rel="stylesheet" type="text/css">
<link href="<?php echo SHOP_TEMPLATES_URL;?>/css/home_header.css" rel="stylesheet" type="text/css">
<link href="<?php echo SHOP_RESOURCE_SITE_URL;?>/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
  <link rel="stylesheet" href="<?php echo SHOP_RESOURCE_SITE_URL;?>/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="<?php echo RESOURCE_SITE_URL;?>/js/html5shiv.js"></script>
      <script src="<?php echo RESOURCE_SITE_URL;?>/js/respond.min.js"></script>
<![endif]-->
<style type="text/css">
body, .header-wrap { background-color: #FAFAFA;}
.wrapper { width: 1000px;}
#faq { display: none;}
.msg { font: 100 36px/48px arial,"microsoft yahei"; color: #555; background-color: #FFF; text-align: center; width: 100%; border: solid 1px #E6E6E6; margin-bottom: 10px; padding: 120px 0;}
.msg i { font-size: 48px; vertical-align: middle; margin-right: 10px;}
</style>
<script>var COOKIE_PRE = '<?php echo COOKIE_PRE;?>';var _CHARSET = '<?php echo strtolower(CHARSET);?>';var SITEURL = '<?php echo SHOP_SITE_URL;?>';var SHOP_RESOURCE_SITE_URL = '<?php echo SHOP_RESOURCE_SITE_URL;?>';var RESOURCE_SITE_URL = '<?php echo RESOURCE_SITE_URL;?>';var SHOP_TEMPLATES_URL = '<?php echo SHOP_TEMPLATES_URL;?>';</script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#details").children('ul').children('li').click(function(){
		$(this).parent().children('li').removeClass("current");
		$(this).addClass("current");
		$('#search_act').attr("value",$(this).attr("act"));
	});
	var search_act = $("#details").find("li[class='current']").attr("act");
	$('#search_act').attr("value",search_act);
	$("#keyword").blur();
});
</script>
</head>
<body>
<?php require_once template('layout/layout_top');?>
<div class="header-wrap"><header class="public-head-layout wrapper">
  <h1 class="site-logo"><a href="<?php echo SHOP_SITE_URL;?>"><img src="<?php echo UPLOAD_SITE_URL.DS.ATTACH_COMMON.DS.$GLOBALS['setting_config']['site_logo']; ?>" class="pngFix"></a></h1></header></div>
<div class="msg">
      <?php if($output['msg_type'] == 'error'){ ?>
      <i class="icon-info-sign" style="color: #D93600;"></i>
        <?php }else { ?>
      <i class="icon-ok-sign" style=" color: #27AE61;"></i>
        <?php } ?>
        <?php require_once($tpl_file);?>
</div>
<script type="text/javascript">
<?php if (!empty($output['url'])){
?>
	//window.setTimeout("javascript:location.href='<?php echo $output['url'];?>'", <?php echo $time;?>);
<?php
}else{
?>
	//window.setTimeout("javascript:history.back()", <?php echo $time;?>);
<?php
}?>
</script>
<?php
require_once template('footer');
?>
</body>
</html>
