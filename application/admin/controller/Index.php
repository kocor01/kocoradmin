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
use think\Validate;
use think\Controller;
use app\admin\model\Login;
use app\admin\validate\Login as validateLogin;
use app\admin\controller\Backend;

class Index extends Backend
{

	//无需登录方法
	protected $noNeedLogin = ['login','nopermissions'];

	//无需鉴权方法
	protected $noNeedAuth = ['index','loginout'];

	/**
	 *  初始化
	 */
	public function _initialize()
    {
        $this->model = model('Login');              //绑定模型
        $this->validate = validate('Login');        //绑定验证器
        parent::_initialize();
    }


	/**
	 *  后台系统主页
	 */
	public function index(){


		$this->view->engine->layout('layout/layout');

		return $this->fetch('');

	}


	/**
	 *  后台登录
	 */
	public function login(){
		$this->view->engine->layout(false);

		if($this->model->isLogin()){
			$this->success("已经是登录状态",'admin/index/index');
		}
		
		//检测自动登录
		if($this->model->autoLogin()){
			$this->success("自动登录",'admin/index/index');
		}

		if(request()->isPost()){
			$user_name = $this->request->post('user_name');
			$password = $this->request->post('password');
			$remember = $this->request->post('remember');

			$data = [
			    'user_name'  => $user_name,
			    'password'   => $password,
			];

			$result   = $this->validate->check($data);
			if(!$result){
			    $this->error($this->validate->getError());
			}else{
				if($this->model->login($user_name,$password,$remember)){
					$this->success("登录成功",'admin/index/index');
				}else{
			    	$this->error("登录失败");
				}
			}
		}

		return $this->fetch('');
	}


	/**
	 *  注销登录
	 */
	public function loginout(){

		$this->model->loginout();

		$this->success("注销成功",'admin/index/login');
	}


	/**
	 *  没有权限页面
	 */
	public function nopermissions(){
		return $this->fetch('');
	}



}






































