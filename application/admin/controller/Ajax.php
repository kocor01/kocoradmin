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
     *  CKEDITOR上传图片
     */
    public function ckUpload(){

         $fileType = Request::instance()->param('type');

        $file = request()->file('upload');
        // 上传图片处理
        $info = self::fileSave($file,$fileType);
        if($info){
            $savePath = self::fileShowPath($fileType,$info->getSaveName());
            return '{"fileName":"'.$savePath.'","uploaded":1,"url":"'.$savePath.'"}';
        }else{
            // 上传失败获取错误信息 通知ck失败消息 
            return '{"fileName":"上传失败","uploaded":1,"url":"上传失败"}';
        }
    }


    /**
     *  fileInput上传图片
     */
    public function fileInputUpload(){
        $fileType = 'images';
        $file = request()->file('upload');
        // 移动到框架应用根目录/public/uploads/ 目录下
         // 上传图片处理
        $info = self::fileSave($file,$fileType);
        if($info){
            $savePath = self::fileShowPath($fileType,$info->getSaveName());
            return ['pic_url' => $savePath];
        }else{
            return ['0'=>$file->getError()];
        }
    }


    /**
     *  fileInput删除图片
     */
    public function fileInputDelete(){
        return 1;
    }


    /**
     *  文件上传保存基础地址
     */
    private function fileSaveBathPath($type){
        $path = DS . 'uploads'. DS.$type. DS;
        return $path;
    } 


    /**
     *  文件上传保存地址
     *  $type string 上传文件类型
     */
    private function fileSavePath($type){
        $path = ROOT_PATH . 'public' . self::fileSaveBathPath($type);
        return $path;
    } 


    /**
     *  文件显示地址
     *  $type string 上传文件类型
     *  $path string 文件保存位置
     */
    private function fileShowPath($type,$path){
        $path = self::fileSaveBathPath($type).$path;
        if(IS_WIN){
            $path = str_replace('\\', '/', $path);
        }
        return $path;
    } 


    /**
     *  文件上传处理
     *  $type string 上传文件对象
     *  $type string 上传文件类型
     */
    private function fileSave($file,$type){
        switch ($type) {
            case 'images':
                $validate = self::imageValidate();
                break;
            
            default:
                $validate = [];
                break;
        }
        $savePath = self::fileSavePath($type);
        $info = $file->validate($validate)->move($savePath);
        return $info;
    } 


    /**
     *  图片验证规则
     */
    private function imageValidate(){
        $validate = [
            'size'=>1024*1024*2,
            'ext'=>'jpg,png,gif',
        ];
        return $validate;
    } 





}






































