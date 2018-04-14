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
use think\Request;
use think\SESSION;

class AdminLog extends Model
{
    //开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    // 关闭自动写入update_time字段
    protected $updateTime = false;

    /**
     * 写入日志
     */
    public static function record(){

        $admin = SESSION::get("admin");
        if($admin){
            $admin_id = $admin->id;
            $user_name = $admin->user_name;
        }else{
            $admin_id = 0;
            $user_name = '';
        }

        $params = Request::instance()->param();

        foreach ($params as $key => $value) {
            if(is_array($value)){
                foreach ($value as $k => $val) {
                    if( is_string($val) && (strlen($val) > 200 || strpos($k,'password') !== false)){
                        unset($params[$key][$k]);
                    }
                }
            }else{
                if( is_string($value) && (strlen($value) > 200 || strpos($value,'password') !== false)){
                    unset($params[$key]);
                }
            }
        }

        $adminLog = AdminLog::create([
            'admin_id'  =>  $admin_id,
            'user_name' =>  $user_name,
            'url' =>  Request::instance()->url(),
            'params' =>  json_encode($params),
            'useragent' =>  request()->server('HTTP_USER_AGENT'),
            'ip' =>  Request::instance()->ip(),
        ]);
    }

}
