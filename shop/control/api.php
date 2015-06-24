<?php
/**
 * api接口
 */
defined('InShopNC') or exit('Access Invalid!');
class apiControl extends BaseHomeControl{
	//验证key
	public function __construct(){
		// $key=$_POST['key'];
		// if($key!=MEMBER_SYSTEM_KEY){
		// 	exit('Access Invalid!');
		// }
	}
	// 激活会员的接口
	public function activeMemberOp(){
		$model_member	= Model('member');
		$member_name = htmlspecialchars($_GET['UserCode']);
		$Status = intval($_GET['Status']);
		$is_live= $Status==1 ? 1 : 0;
		$member_info = $model_member->getMemberInfo(array('member_name'=>$member_name));

		$result = $model_member->updateMember(array('is_live'=>$is_live),intval($member_info['member_id']));
		header("content-type:text/html;charset=utf-8");
		exit('操作成功');
	}
	/**
	 * 对接好客会员系统回调
	 */
	public function MemberSystemCallBackOp() {
		$data=$_GET;
		$str='';
		$time=date("Y-m-d H:i:s",time());
		foreach($data as $k=>$v){
		    $str.=$k.':'.$v."|";
		}
		$str.="{$time} \n ";
		file_put_contents('2.txt', $str,FILE_APPEND);
		echo 'ok';
	}
}
