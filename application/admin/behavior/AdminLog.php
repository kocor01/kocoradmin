<?php
namespace app\admin\behavior;

use think\Request;

class AdminLog {
    public function run(&$params){
        if (request()->isPost()){
            \app\admin\model\AdminLog::record();
        }
    }
}