<?php

namespace app\admin\validate;

use think\Validate;

class Login extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
	    'user_name'  => 'require|max:50',
	    'password'   => 'require|max:50',
    ];
    /**
     * 提示消息
     */
    protected $message = [
	    'user_name.require' => '用户名必须',
	    'user_name.max'     => '用户名最多不能超过50个字符',
	    'password.require'   => '密码必须',
	    'age.between'  => '用密码最多不能超过50个字符',
    ];

    /**
     * 验证场景
     */
    protected $scene = [
        'login'  => [],
    ];
    
}
