<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\model;
use think\Model;
use think\Session;
use think\Cookie;
use app\admin\model\Admin;


class Login extends Model
{


	//登录操作
	public function login($user_name,$password,$remember)
    {
    	$adminModel = model('Admin');
    	$admin = Admin::get(['user_name' => $user_name]);
    	if(!$admin){
    		return false;
    	}

    	//获取密码加密串
    	$passwordMd5Str = $adminModel->getPasswordMd5Str($password,$admin['salt']);

    	//登录失败
    	if($passwordMd5Str != $admin['password']){
    		$admin->login_failure++;
    		$admin->save();
    		return false;
    	}

    	//登录成功
    	$admin->login_failure = 0;
    	$admin->last_login_time = time();
    	$admin->save();

    	if($remember){
    		$this->keepLogin($admin['id'],$admin['token'],$keepTime='86400');
    	}

    	//写入SESSION
    	Session::set('admin',$admin);
    	return true;
    }

    //是否登录
    public function isLogin()
    {
        return Session::has('admin') ? true : false;
    }

    //注销登录
    public function loginout(){
    	Cookie::delete('keepLogin');
    	Session::delete('admin');
    	return true;
    }

    //获取密码盐
    public function getSalt(){
		return Str::random(6);
    }

    //保持登录状态
    public function keepLogin($admin_id,$token,$keepTime='86400'){
    	$expireTime = time() + $keepTime;
    	$key = md5(md5($admin_id).md5($expireTime).$token);
    	$data = [$admin_id,$keepTime,$expireTime,$key];
    	$keepLogin = implode('|', $data);
    	Cookie::set('keepLogin',$keepLogin,$keepTime);
    	return true;
    }

    //自动登录
    public function autoLogin(){
    	$keepLogin = Cookie::get('keepLogin');

    	//是否存在Cookie-keepLogin
    	if($keepLogin){
    		list($admin_id,$keepTime,$expireTime,$key) = explode('|', $keepLogin);

    		if($admin_id && $keepTime && $expireTime && $key && $expireTime > time()){

	    		$admin = Admin::get($admin_id);
	    		//判断keepLogin参数是否合法
	    		if($key == md5(md5($admin_id).md5($expireTime).$admin['token'])){
	    			
	    			Session::set('admin',$admin);

	    			//刷新保持登录状态时效
	    			$this->keepLogin($admin['id'],$admin['token']);
	    			return true;
	    		}else{
	    			return false;
	    		}
    		}else{
    			return false;	
    		}
    	}else{
    		return false;
    	}
    }

    //检测是否需要验证登录
    public function isNeedLogin($action,$noNeedLogin){
        return in_array($action, $noNeedLogin)?false:true;
    }



}