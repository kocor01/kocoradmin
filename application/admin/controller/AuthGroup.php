<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use think\Db;
use think\Request;
use kocor\Tree;

use app\admin\controller\Backend;

class AuthGroup extends Backend
{

	//无需登录方法
	//protected $noNeedLogin = ['index'];

	//无需鉴权方法
	//protected $noNeedAuth = ['index'];


    public function _initialize()
    {
        parent::_initialize();
		$this->tree = new Tree;
    }


	/**
	 *  基础增加方法
	 */
	public function add(){

		if(request()->isPost()){

			$params = Request::instance()->post('row/a'); // 获取post变量

			if(!$this->validate->check($params)){
			    $this->error($this->validate->getError());
			}else{
				
				$this->model->data($params);
				$result = $this->model->allowField(true)->save();
				if($result){
					$this->success('添加成功');
				}else{
					$this->error('添加失败');
				}
			}
		}

		$where['status'] = 1;
		$list = $this->model->where($where)->select()->toArray();
		$this->tree->init($list);
		$tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>");
        $this->view->assign("tree_list", $tree_list);

		return $this->fetch('');
	}


	//获取角色权限树
	public function get_rule_tree(){

		if(request()->isPost()){

			//读取角色权限
			$where['status'] = 1;
			$list = $this->model->field('id,pid,title')->where($where)->select()->toArray();

			//获取jstree所需格式数据
			$this->tree->init($list);
			$tree_arr = $this->tree->get_treeview_arr('3,5');
    		return $tree_arr;
		}
		return $this->fetch('');


	}



}