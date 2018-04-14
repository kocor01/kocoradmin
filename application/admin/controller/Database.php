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
use kocor\Backup as BackupModel;

class Database extends Backend
{

    //无需登录方法
    protected $noNeedLogin = [];

    //无需鉴权方法
    protected $noNeedAuth = [];

    //配置
    protected $config = [];

    /**
     *  初始化
     */
    public function _initialize()
    {
        $this->request->filter(['strip_tags']);     //设置过滤方法
        parent::_initialize();

        $this->config = [
            'path'     => RUNTIME_PATH.'/Backup/',//数据库备份路径
            'part'     => 20971520,//20M 数据库备份卷大小
            'compress' => 1,//数据库备份文件是否启用压缩 0不压缩 1 压缩
            'level'    => 9 //数据库备份文件压缩级别 1普通 4 一般  9最高
        ];

    }


    /**
     *  备份数据库
     */
    public function index(){


        if(request()->isPost()){

            set_time_limit(0);
            $params = Request::instance()->post('row/a'); //获取post变量

            if(!$this->validate->check($params)){
                $this->error($this->validate->getError());
            }else{
                $this->config['part'] = $params['part'];
                $this->config['compress'] = $params['compress'];
            }

            $backup = new BackupModel($this->config);
            foreach ($params['tables'] as $key => $value) {
                $start= $backup->backup($value, 0);
                if($start !== 0){
                    bleak;
                }
            }
            $this->success('数据备份成功');
        }

        $backup = new BackupModel($this->config);
        $tableList = $backup->dataList();
        $this->view->assign("tableList", $tableList);
        return $this->fetch('');

    }


    /**
     *  导入数据库
     */
    public function restore(){

        if(request()->isAjax()){

            $backup = new BackupModel($this->config);
            $tableList = array_reverse($backup->fileList());

            $newTableList = [];
            $id = 1;
            foreach ($tableList as $key => $value) {
                $valueid = $id;
                $value['id'] = $valueid;
                $value['pid'] = 0;
                $value['num'] = 0;
                $part = $value['part'];
                $newTableList[] = $value;
                $id++;
                if($part != 1){
                    for ($i=0; $i < $part; $i++) { 
                        $value['part'] = '-';
                        $value['size'] = '-';
                        $value['num'] = $i;
                        $value['id'] = $id;
                        $value['pid'] = $valueid;
                        $newTableList[] = $value;
                        $id++;
                    }
                }
            }
            $result = array("total" => count($newTableList), "rows" => $newTableList);
            return $result;
        }
        return $this->fetch('');
        
    }


    /**
     *  导入数据库
     */
    public function import($part=0){

        set_time_limit(0);
        $time = Request::instance()->param('time/s');
        $compress = Request::instance()->param('compress/d');
        $part = Request::instance()->param('part/d');
        $backup = new BackupModel($this->config);

        $files = $backup->getFile('time',$time);
        //print_r($files);
        $count = count($files);
        $part = $part + 1;

        if($part <= $count){
            $file = ['name' => date('Ymd-His',$time), 'part' => ($part)];
            $backup->setFile($file)->import($compress);
            if($part < $count){
                $link = "/admin/database/import/time/{$time}/compress/{$compress}/part/{$part}";
            }else{
                $link = "/admin/database/restore";
            }
            $this->success('成功还原：'.($part).'卷，总卷数：'.$count, $link);
        }else{
            $this->error('非法操作');
        }
    }

    /**
     *  删除备份
     */
    public function del($ids=''){
        $time = Request::instance()->param('time/s');
        $backup = new BackupModel($this->config);
        $tableList = $backup->delFile($time);
        $this->success('数据备份删除成功');
    }


    /**
     *  下载备份
     */
    public function download(){
        $time = Request::instance()->param('time/s');
        $part = Request::instance()->param('part/d');
        $backup = new BackupModel($this->config);
        $tableList = $backup->downloadFile($time,$part);
    }


    /**
     *  修复表
     */
    public function repair(){
        $db->repair($tables);
    }


    /**
     *  优化表
     */
    public function optimize(){
        $db->optimize($tables);
    }

}








































