<?php

namespace app\admin\controller;
use think\Db;
use think\Request;

use app\admin\controller\Backend;

class AuthGroup extends Backend
{

	//无需登录方法
	protected $noNeedLogin = ['index'];

	//无需鉴权方法
	protected $noNeedAuth = ['index'];


    public function _initialize()
    {
        parent::_initialize();
    }


}