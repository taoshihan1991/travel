<?php
/**
 * cms首页
 *
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
defined('InShopNC') or exit('Access Invalid!');
class indexControl extends mobileHomeControl{

	public function __construct() {
        parent::__construct();
    }

	public function indexOp(){
        $model_mb_ad = Model('mb_ad');
        $model_mb_home = Model('mb_home');

        $datas = array();

        //广告
        $adv_list = array();
        $mb_ad_list = $model_mb_ad->getMbAdList(array(), null, 'link_sort asc');
        foreach ($mb_ad_list as $value) {
            $adv = array();
            $adv['image'] = $value['link_pic_url'];
            $adv['keyword'] = $value['link_keyword'];
            $adv_list[] = $adv;
        }
        

        //首页
        $home_type1_list = array();
        $home_type2_list = array();
        //$mb_home_list = $model_mb_home->getMbHomeList(array(), null, 'h_sort asc');

        // @tsh
        $advList=array();
        $list=Model('adv')->getList(array('ap_id'=>373));
        foreach($list as $v){
            $advContent=unserialize($v['adv_content']);
            $advContent['keyword']=$v['adv_title'];
            $advContent['image']=UPLOAD_SITE_URL.'/shop/adv/'.$advContent['adv_pic'];
            $advList[]=$advContent;
        }
        $datas['adv_list'] = $advList;

        $mb_home_list=Model('goods')->select();
        foreach ($mb_home_list as $value) {
            $home = array();
            $home['image'] = thumb($value,160);
            $home['title'] = $value['goods_name'];
            $home['desc'] = $value['goods_jingle'];
            $home['keyword1'] = '';
            $home_type1_list[] = $home;
        }

        $datas['home1'] = $home_type1_list;
        $datas['home2'] = $home_type1_list;

        output_data($datas);
	}
}
