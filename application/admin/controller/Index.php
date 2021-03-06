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
use app\admin\model\Login;
use kocor\Tree;
use app\admin\validate\Login as validateLogin;
use app\admin\controller\Backend;

class Index extends Backend
{

	//无需登录方法
	protected $noNeedLogin = ['login','nopermissions','captcha_src'];

	//无需鉴权方法
	protected $noNeedAuth = ['index','loginout'];

	/**
	 *  初始化
	 */
	public function _initialize()
    {
        $this->request->filter(['strip_tags']);     //设置过滤方法
        $this->model = model('Login');              //绑定模型
        $this->validate = validate('Login');        //绑定验证器
		$this->tree = new Tree;
        parent::_initialize();
    }


	/**
	 *  后台系统主页
	 */
	public function index(){

		$this->view->engine->layout('layout/layout');

		//管理员权限
		$AdminRules = $this->auth->getAdminAuthList($this->adminInfo['id']);
		$this->tree->init($AdminRules);

		//生成树
		$menu_tree = $this->tree->get_treemenu(0);

        $this->view->assign("menu_tree", $menu_tree);

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
			$captcha = $this->request->post('captcha');

			$data = [
			    'user_name'  => $user_name,
			    'password'   => $password,
			    'captcha'   => $captcha,
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
	 *  验证码
	 */
	public function captcha_src(){
		return captcha_img();
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






































