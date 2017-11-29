<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;
use kocor\Auth;
use app\admin\model\Login;
use app\admin\model\Admin;

class Backend extends Controller
{
	//无需登录方法
	protected $noNeedLogin = [];

	//无需鉴权方法
	protected $noNeedAuth = [];

	//登录管理员信息
	protected $adminInfo = [];

    public function _initialize()
    {
        parent::_initialize();
        $this->request->filter(['strip_tags']);     //设置过滤方法

        $request = Request::instance();
        $module = strtolower($request->module());
		$controller = strtolower($request->controller());
		$action = $request->action();

        $login = model('Login');

        //检测是否需要验证登录
        if($login->isNeedLogin($action,$this->noNeedLogin)){
	        //判断是否登录
	        if(!$login->isLogin()){
	        	$this->success("你还未登录",'admin/index/login');
	        }
	        
	        //获取登录管理员信息
	        $this->adminInfo = model('Admin')->getAdminLoginInfo();

			$this->auth = new Auth;
	        //检测是否需要验证权限
	        if($this->auth->isNeedAuth($action,$this->noNeedAuth)){
		        //权限控制
				$path = $controller.'/'.$action;
				if(!$this->auth->check($path,$this->adminInfo['id'])){
					$this->error("你没有权限！");
				}
	        }
        }

    }

    
	/**
	 *  基础列表方法
	 */
	public function index(){

		if(request()->isAjax()){

			$offset = intval(input('offset'));
			$limit = intval(input('limit'));
			$sort = addslashes(input('sort'));
			$order = addslashes(input('order'));
			$search = addslashes(input('search'));

			$where = [];
			if(!empty($search)){
				$where[$this->serachName] = ['like','%'.$search.'%'];
			}

			$list = $this->model->where($where)->order($sort." ".$order)->limit($offset.','.$limit)->select();
			$total = $this->model->where($where)->count();

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
					foreach ($list as $k => $v){
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

}