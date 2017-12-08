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

class AuthRule extends Backend
{

    public function _initialize()
    {
        parent::_initialize();
		$this->tree = new Tree;
    }



	/**
	 *  列表方法
	 */
	public function index(){

		

		// $data = $this->model->select()->toArray();
		// $Tree = new Tree;


		// $Tree->init($data);

		// echo $Tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$name</option>",1);

		// print_r($Tree->get_tree_json(0));

		// exit;


		

		if(request()->isAjax()){
			
			//列表请求参数
			$params = $this->get_lists_params();

			$where = [];
			if(!empty($params['search'])){
				$where[$this->serachName] = ['like','%'.$params['search'].'%'];
			}

			$list = $this->model->where($where)->order($params['sort']." ".$params['order'])->limit($params['offset'].','.$params['limit'])->select()->toArray();
			$total = $this->model->where($where)->count();

			$this->tree->init($list);
			$list = $this->tree->get_tree_json(0);
			//print_r($list);exit;

            $result = array("total" => $total, "rows" => $list);
		
			return $result;
		}

		return $this->fetch('');
		

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

		//规则节点树
		$where['status'] = 1;
		$list = $this->model->where($where)->select()->toArray();
		$this->tree->init($list);
		$tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>");
        $this->view->assign("tree_list", $tree_list);

		return $this->fetch('');
	}


	/**
	 *  基础编辑方法
	 */
	public function edit(){

		$id = Request::instance()->param('id/d');
		$row = $this->model->get($id);
		if(request()->isPost()){

			$params = Request::instance()->post('row/a'); // 获取post变量

			if(!$this->validate->check($params)){
			    $this->error($this->validate->getError());
			}else{
				$row->data($params,true);
				$result = $row->allowField(true)->save();
				if($result){
					$this->success('更新成功');
				}else{
					$this->error('更新失败');
				}
			}
		}

		//全部原始数据 获取器
		$row = $row->getData();

		$where['status'] = 1;
		$list = $this->model->where($where)->select()->toArray();
		$this->tree->init($list);
		$tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>",$row['pid']);
        $this->view->assign("tree_list", $tree_list);

        $this->view->assign("row", $row);
		return $this->fetch('');
	}

	public function str(){
		//$this->view->engine->layout(false);
		// 	$where['status'] = 1;
		// 	$list = $this->model->field('id,pid,title,name')->where($where)->select()->toArray();
		// $this->tree->init($list);
		// $tree_list = $this->tree->get_treeview_arr('3,5');
		// print_r($tree_list);
		// //echo $tree_list;
		// exit;

		if(request()->isPost()){
			$arr = [
				'Simple root node',
				[
					'text'=>'Root node 2',
					'state'=>[
						'opened'=>true,
						'selected'=>true,
					],
					'children'=>[
						[
							'text'=>'Child 1',
						],
						'Child 2',
					],
				],
			];
			//$str = json_encode($arr);//"

			//['Simple root node',{'text':'Root node 2','state':{'opened':true,'selected':true},'children':[{'text':'Child 1'},'Child 2']}]";
			//["Simple root node",{"text":"Root node 2","state":{"opened":true,"selected":true},"children":[{"text":"Child 1"},"Child 2"]}]

			$where['status'] = 1;
			$list = $this->model->field('id,pid,title')->where($where)->select()->toArray();

			//
			$this->tree->init($list);
			$tree_arr = $this->tree->get_treeview_arr('3,5');
    		return $tree_arr;
		}
		return $this->fetch('');


	}



}
