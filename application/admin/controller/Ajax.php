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
use app\admin\controller\Backend;

class Ajax extends Backend
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
     *  清理缓存
     */
    public function cache(){

        if(request()->isPost()){

            $params = Request::instance()->post('row/a'); //获取post变量
            foreach ($params as $key => $value) {
                if($value == 'on'){
                    switch ($key) {
                        case 'temp':
                            //模板编译缓存
                            delDirAndFile(TEMP_PATH);
                            break;
                        case 'cache':
                            //站点数据缓存
                            delDirAndFile(CACHE_PATH);
                            break;
                        case 'log':
                            //网站日志文件
                            delDirAndFile(LOG_PATH);
                            break;
                    }
                }
            }
            $this->success('删除缓存成功');
        }
        return $this->fetch('');
    }


    /**
     *  清理所有缓存
     */
    public function cacheAll(){
        //模板编译缓存
        delDirAndFile(TEMP_PATH);
        //站点数据缓存
        delDirAndFile(CACHE_PATH);
        //网站日志文件
        delDirAndFile(LOG_PATH);

        return ['status'=>1,'msg'=>'删除缓存成功'];
    }





}






































