<?php
/**
 * 商品分类
 *
 *
 *
 * @copyright  Copyright (c) 2007-2013 ShopNC Inc. (http://www.shopnc.net)
 * @license    http://www.shopnc.net
 * @link       http://www.shopnc.net
 * @since      File available since Release v1.1
 */
defined('InShopNC') or exit('Access Invalid!');
class article_classControl extends mobileHomeControl{

	public function __construct() {
        parent::__construct();
    }

	public function indexOp() {
        if(!empty($_GET['gc_id']) && intval($_GET['gc_id']) > 0) {
            $this->_get_class_list($_GET['gc_id']);
        }
	}
    /**
     * 根据分类编号返回下级分类列表
     */
    private function _get_class_list($gc_id) {
        $article_classModel=Model('article_class');
        $acList=$article_classModel->getClassList(array('ac_parent_id'=>$gc_id));
        if(empty($acList)) {
            //无下级分类返回0
            output_data(array('class_list' => '0'));
        } else {
            //返回下级分类列表
            $class_list = array();
            foreach ($acList as $v) {
                $class_item = array();
                $class_item['gc_id'] .= $v['ac_id'];
                $class_item['gc_name'] .= $v['ac_name'];
                $class_list[] = $class_item;
            }
            output_data(array('class_list' => $class_list));
        }
    }
}
