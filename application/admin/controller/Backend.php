<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;
use kocor\Auth;
use app\admin\model\Login;
use app\admin\model\Admin;
use think\Session;


/**
 *  后台控制器基类
 */

class Backend extends Controller
{
	//无需登录方法
	protected $noNeedLogin = [];

	//无需鉴权方法
	protected $noNeedAuth = [];

	//登录管理员信息
	protected $adminInfo = [];

	//绑定模型
	protected $model = '';

	//绑定验证器
	protected $validate = '';

	//绑定搜索字段
	protected $serachName = '';

    public function _initialize()
    {

        parent::_initialize();
        $this->request->filter(['strip_tags']);     //设置过滤方法

        $request = Request::instance();
        $module = $request->module();
		$controller = $request->controller();
		$action = $request->action();
		$path = $request->controller().'/'.$request->action();


		//以下绑定信息可以在继承该类时重新指定
		if(!$this->model){
			$this->model = model($request->controller());              //绑定模型
		}
		if(!$this->validate){
			$this->validate = validate($request->controller());        //绑定验证器
		}
		if(!$this->serachName){
			$this->serachName = 'title';            //绑定搜索字段
		}
        
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
				if(!$this->auth->check($path,$this->adminInfo['id'])){
					$this->error("你没有权限！",'admin/index/nopermissions');
				}
	        }
        }

        //登录信息
        $adminInfo = Session::get('admin');
        $this->view->assign("adminInfo", $adminInfo);

        //左侧菜单
		$list = $this->model->select()->toArray();
		$menu_tree = getTree($list,0);
        $this->view->assign("menu_tree", $menu_tree);
    }

    
	/**
	 *  基础列表方法
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


	/**
	 *  列表请求参数
	 */
	protected function get_lists_params(){

		$params['offset'] = intval(input('offset'));
		$params['limit'] = intval(input('limit'));
		$params['sort'] = addslashes(input('sort'));
		$params['order'] = addslashes(input('order'));
		$params['search'] = addslashes(input('search'));

		return $params;
	}


}