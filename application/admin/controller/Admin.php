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
use app\admin\model\AuthGroup;

use app\admin\controller\Backend;

class Admin extends Backend
{

    public function _initialize()
    {
        parent::_initialize();
		$this->tree = new Tree;
        $this->serachName = 'user_name';            //搜索字段
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

			$list = $this->model->where($where)->order($params['sort']." ".$params['order'])->limit($params['offset'].','.$params['limit'])->select();
			$total = $this->model->where($where)->count();

			//处理管理员组
			$AuthGroupList = model('AuthGroup')->field('id,title')->where(['status'=>1])->column('title','id');
			$AuthGroupAccessList = model('AuthGroupAccess')->select();
			foreach ($list as &$value) {
				$AuthGroupName = [];
				foreach ($AuthGroupAccessList as $val) {
					if($val['uid'] == $value['id']){
						$AuthGroupName[] = $AuthGroupList[$val['group_id']];
					}
				}
				$value['auth_group_name'] = implode(',', $AuthGroupName);
			}

            $result = array("total" => $total, "rows" => $list);
		
			return $result;
		}

		return $this->fetch('');
	}


	/**
	 *  管理员增加操作
	 */
	public function add(){

		if(request()->isPost()){

			$params = Request::instance()->post('row/a'); //获取post变量

			$params['salt'] = $this->model->getSalt();
			$params['token'] = $this->model->getToken();

			if(!$this->validate->check($params)){
			    $this->error($this->validate->getError());
			}else{
				if(!empty($params['password'])){
					if($params['password'] != $params['repassword']){
						$this->error('密码与确认密码不一致！');
					}else{
						$params['password'] = $this->model->getPasswordMd5Str($params['password'],$params['salt']);
					}
				}
				
				$this->model->data($params);
				$result = $this->model->allowField(true)->save();

				//权限组数组
				$group_arr = [];
				foreach ($params['group'] as $value) {
					$group_arr[] = ['group_id'=>$value];
				}

				//更新权限组
				$Admin = model('Admin')->get($this->model->id);
				//关联删除
				$Admin->group_access()->delete();
				//关联添加
				$Admin->group_access()->saveAll($group_arr);

				if($result){
					$this->success('新增成功');
				}else{
					$this->error('新增失败');
				}
			}
		}

        //权限组节点树
        $where['status'] = 1;
        $list = model('AuthGroup')->where($where)->select()->toArray();
        $this->tree->init($list);
        $tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>");
        $this->view->assign("tree_list", $tree_list);

		return $this->fetch('');
	}


	/**
	 *  管理员编辑操作
	 */
	public function edit(){

		$id = Request::instance()->param('id/d');
		$row = $this->model->get($id);
		if(request()->isPost()){

			$params = Request::instance()->post('row/a'); // 获取post变量

			$params['salt'] = $row['salt'];
			if(empty($params['password'])){
				unset($params['password']);
			}else if($params['password'] != $params['repassword']){
				$this->error('密码与确认密码不一致！');
			}

			if(!$this->validate->check($params)){
			    $this->error($this->validate->getError());
			}else{
				$row->data($params,true);
				$result = $row->allowField(true)->save();

				//权限组数组
				$group_arr = [];
				foreach ($params['group'] as $value) {
					$group_arr[] = ['group_id'=>$value];
				}

				//更新权限组
				$Admin = model('Admin')->get($id);
				//关联删除
				$Admin->group_access()->delete();
				//关联添加
				$Admin->group_access()->saveAll($group_arr);

				if($result){
					$this->success('更新成功');
				}else{
					$this->error('更新失败');
				}
			}
		}

        //权限组节点树
        $where['status'] = 1;
        $list = model('AuthGroup')->where($where)->select()->toArray();
        $this->tree->init($list);
        $tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>");
        $this->view->assign("tree_list", $tree_list);


		//关联已有查询权限组
		$AuthGroupOwn = $row->group_access()->select()->toArray();
		$AuthGroupOwn_arr = [];
		foreach ($AuthGroupOwn as $value) {
			$AuthGroupOwn_arr[] = $value['group_id'];
		}
		$AuthGroupOwn_str = implode(',', $AuthGroupOwn_arr);

		//全部原始数据 获取器
		$row = $row->getData();

        $this->view->assign("row", $row);
        $this->view->assign("AuthGroupOwn_str", $AuthGroupOwn_str);
		return $this->fetch('');
	}

}