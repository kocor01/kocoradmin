<?php

namespace app\admin\controller;
use think\Db;
use think\Request;

use app\admin\controller\Backend;

class Admin extends Backend
{

    public function _initialize()
    {
        parent::_initialize();
        $this->serachName = 'user_name';            //搜索字段
    }


	/**
	 *  列表方法
	 */
	public function index(){

		//$Admin = model('Admin')->get(6);
		//dump($Admin->group_access()->select());exit;

		if(request()->isAjax()){
			
			//列表请求参数
			$params = $this->get_lists_params();

			$where = [];
			if(!empty($params['search'])){
				$where[$this->serachName] = ['like','%'.$params['search'].'%'];
			}

			$list = $this->model->where($where)->order($params['sort']." ".$params['order'])->limit($params['offset'].','.$params['limit'])->select();
			$total = $this->model->where($where)->count();

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

			$params = Request::instance()->post('row/a'); // 获取post变量
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
				if($result){
					$this->success();
				}else{
					$this->error();
				}
			}
		}

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
				if($result){
					$this->success('更新成功');
				}else{
					$this->error('更新失败');
				}
			}
		}

		//全部原始数据 获取器
		$row = $row->getData();
        $this->view->assign("row", $row);
		return $this->fetch('');
	}

}