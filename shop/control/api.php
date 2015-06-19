<?php
/**
 * api接口
 */
defined('InShopNC') or exit('Access Invalid!');
class apiControl extends BaseHomeControl{
	//验证key
	public function __construct(){
		$key=$_POST['key'];
		if($key!=MEMBER_SYSTEM_KEY){
			exit('Access Invalid!');
		}
	}
	// 激活会员的接口
	public function activeMemberOp(){
		$model_member	= Model('member');
		$array=array();
		$array['member_name']	= $_POST['username'];
		$array['member_passwd']	= $_POST['password'];
		$is_live=intval($_POST['is_live']);

		$member_info = $model_member->infoMember($array);
		if(empty($member_info)) {
			exit('username or password is error');
		}
		$result = $model_member->updateMember(array('is_live'=>$is_live),intval($member_info['member_id']));
		exit($result);
	}

}
