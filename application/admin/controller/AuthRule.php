<?php

namespace app\admin\controller;
use think\Db;
use think\Request;
use kocor\Tree;

use app\admin\controller\Backend;

class AuthRule extends Backend
{

    public function _initialize()
    {
        parent::_initialize();
    }



	/**
	 *  列表方法
	 */
	public function index(){

		$data = $this->model->select();
		$Tree = new Tree;

		$data = array(
1 => array('id'=>'1','parentid'=>0,'name'=>'一级栏目一'),
2 => array('id'=>'2','parentid'=>0,'name'=>'一级栏目二'),
3 => array('id'=>'3','parentid'=>1,'name'=>'二级栏目一'),
4 => array('id'=>'4','parentid'=>1,'name'=>'二级栏目二'),
5 => array('id'=>'5','parentid'=>2,'name'=>'二级栏目三'),
6 => array('id'=>'6','parentid'=>3,'name'=>'三级栏目一'),
7 => array('id'=>'7','parentid'=>3,'name'=>'三级栏目二')
);
		$Tree->init($data);

		//echo $Tree->get_tree_multi(1,"<option value=\$id \$selected>\$spacer\$name</option>");

		print_r($Tree->creat_sub_json(0));

		exit;

	}



}
