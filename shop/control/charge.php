<?php
/**
 * 预存款管理
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
defined('InShopNC') or exit('Access Invalid!');

class chargeControl extends BaseMemberControl {
	public function __construct(){
		Language::read('common,member_layout');
		Tpl::setDir('member');
		Tpl::setLayout('member_layout');
		$this->article();//文章输出
		Tpl::output('header_menu_sign','setting');//默认选中顶部“设置”菜单
		//获取导航
		Tpl::output('nav_list',($nav = H('nav')) ? $nav : H('nav',true));

		Language::read('member_member_predeposit');
		Tpl::setLayout('member_pub_layout');
	}

	/**
	 * 充值添加
	 */
	public function addOp(){
		if (!chksubmit()){
		    //信息输出
		    Tpl::output('menu_sign','predepositrecharge');
		    Tpl::output('menu_sign_url','index.php?act=predeposit');
		    Tpl::output('menu_sign1','predeposit_rechargeadd');
		    Tpl::showpage('charge_pd.add');
		    exit();
		}
		$pdr_amount = abs(floatval($_POST['pdr_amount']));
		if ($pdr_amount <= 0) {
		    showMessage(Language::get('predeposit_recharge_add_pricemin_error'),'','html','error');
		}
        $model_pdr = Model('predeposit');
        $data = array();
        $data['pdr_sn'] = $pay_sn = $model_pdr->makeSn();
        $data['pdr_member_id'] = $_SESSION['member_id'];
        $data['pdr_member_name'] = $_SESSION['member_name'];
        $data['pdr_amount'] = $pdr_amount;
        $data['pdr_add_time'] = TIMESTAMP;
        $insert = $model_pdr->addPdRecharge($data);
        if ($insert) {
            //转向到商城支付页面
            redirect('index.php?act=buy&op=pd_pay&pay_sn='.$pay_sn);
        }
	}

}
