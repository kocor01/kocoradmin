<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use think\Request;
use kocor\Tree;
use app\admin\model\AuthRule;

use app\admin\controller\Backend;

class AuthGroup extends Backend
{

	//无需登录方法
	//protected $noNeedLogin = ['index'];

	//无需鉴权方法
	protected $noNeedAuth = ['get_rule_tree'];


    public function _initialize()
    {
        parent::_initialize();
		$this->tree = new Tree;
    }

	/**
	 *  列表方法
	 */
	public function index(){

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
	 *  增加方法
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


	/**
	 *  编辑方法
	 */
	public function edit(){

		$id = Request::instance()->param('id/d');
		$row = $this->model->get($id);
		if(request()->isPost()){

			$params = Request::instance()->post('row/a'); // 获取post变量


			if($id == 1){
				$this->error('不能编辑超级管理员权限');
			}

			if(!$this->validate->check($params)){
			    $this->error($this->validate->getError());
			}else{

				//权限组父级不能是自己及其下级
				$list = $this->model->select()->toArray();
				$this->tree->init($list);
				$AuthGroupChind = $this->tree->get_child_id($id,true);

				if(in_array($params['pid'], $AuthGroupChind)){
					$this->error('权限组父级不能是自己及其下级');
				}

				$row->data($params,true);
				$result = $row->allowField(true)->save();
				if($result){
					$this->success('更新成功');
				}else{
					$this->error('更新失败');
				}
			}
		}

		$where['status'] = 1;
		$list = $this->model->where($where)->select()->toArray();
		$this->tree->init($list);
		$tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>",$row['pid']);
        $this->view->assign("tree_list", $tree_list);

		//全部原始数据 获取器
		$row = $row->getData();
        $this->view->assign("row", $row);
		return $this->fetch('');
	}


	/**
	 *  基础删除方法
	 */
	public function del($ids=''){
		if($ids){

			if(request()->isAjax()){

				$pk = $this->model->getPk();
				$list = $this->model->where($pk, 'in', $ids)->select();
				$count = 0;
				if($list){

					//初始化规则树
			        $tree_list = $this->model->select()->toArray();
			        $this->tree->init($tree_list);

					foreach ($list as $k => $v){

						if($v['id'] == 1){
							$this->error('不能删除超级管理员');
						}
						
				        $child = $this->tree->get_child($v['id']);
		                if(is_array($child)){ 
		                    return ['status'=>0,'msg'=>'不能删除含有子级的权限组'];
		                }

		                $count += $v->delete();
		            }
					if ($count){
		                return ['status'=>1,'msg'=>'删除成功'];
		            }else{
		                return ['status'=>0,'msg'=>'删除失败'];
		            }
				}else{
					return ['status'=>0,'msg'=>'数据不存在'];
				}
			}else{
				return ['status'=>0,'msg'=>'非法操作'];
			}
		}else{
			return ['status'=>0,'msg'=>'请选择有效数据'];
		}
		
	}


	//获取角色权限树
	public function get_rule_tree(){

		if(request()->isPost()){

			$id = Request::instance()->request('id/d');
			$pid = Request::instance()->param('pid/d');
	
			//父级权限
			$AuthRuleParent = $this->model->where(array('id'=>$pid))->find();

			//读取父级角色权限
			$where['status'] = 1;
			if($AuthRuleParent['rules'] != '*'){
				$where['id'] = ['in',$AuthRuleParent['rules']];
			}
			$list = model('AuthRule')->field('id,pid,title')->where($where)->select()->toArray();

			//初始化权限树
			$this->tree->init($list);

			//已选择的权限
			$rules_selected = '';
			if($id){
				//自己权限
				$AuthRule = $this->model->where(array('id'=>$id))->find();
				$rules_selected = $AuthRule->rules;
			}

			//获取jstree所需格式数据
			$tree_arr = $this->tree->get_treeview_arr($rules_selected);
    		return $tree_arr;
		}
		return $this->fetch('');
	}

  

}