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
            if(!$params){
                $this->success('请选择清理项');
            }
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


    /**
     *  上传图片
     */
    public function ckUpload(){

        $cknum = Request::instance()->param('CKEditorFuncNum');
   

        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('upload');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>1024*1024*2,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            $savePath = DS."uploads".DS.$info->getSaveName();
            if(IS_WIN){
                $savePath = str_replace('\\', '/', $savePath);
            }
            // 成功上传后 获取上传信息
            echo "<script>window.parent.CKEDITOR.tools.callFunction(".$cknum.", '".$savePath."', '');</script>";
        }else{
            // 上传失败获取错误信息 通知ck失败消息 
            echo "<script>window.parent.CKEDITOR.tools.callFunction($cknum, '', $file->getError());</script>";
        }
    }


    /**
     *  上传图片
     */
    public function fileInputUpload(){


        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('upload');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $fileSavePath = ROOT_PATH . 'public' . DS . 'uploads';
        $validate = [
            'size'=>1024*1024*2,
            'ext'=>'jpg,png,gif'
        ];
        $info = $file->validate($validate)->move($fileSavePath);
        if($info){
            $savePath = DS."uploads".DS.$info->getSaveName();
            if(IS_WIN){
                $savePath = str_replace('\\', '/', $savePath);
            }
            return ['pic_url' => $savePath];
        }else{
            return ['0'=>$file->getError()];
        }
    }





}






































