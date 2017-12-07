<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'user_name'  =>  'require|chsDash|max:100',
        'nick_name'  =>  'require|chsDash|max:100',
        'email' =>  'require|email',
        'mobile' =>  'require|mobile',
    ];
    /**
     * 提示消息
     */
    protected $message = [
        'user_name.require' => '用户名必须',
        'user_name.chsDash'     => '用户名只能是汉字、字母、数字和下划线_及破折号-',
        'user_name.max'     => '用户名最多100字符',
        'nick_name.require' => '昵称必须',
        'nick_name.chsDash'     => '昵称只能是汉字、字母、数字和下划线_及破折号-',
        'nick_name.max'     => '昵称最多100字符',
        'email'   => '邮箱格式错误',
        'mobile'  => '手机格式错误2', 
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => [],
        'edit' => [],
    ];

    //验证手机 自定义验证规则
    protected function mobile($value,$rule,$data){
        return preg_match("/^1[3465789]{1}\d{9}$/",$value) ? true : '手机格式错误1';
    }
    
}
