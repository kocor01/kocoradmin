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

class Config extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'type'  =>  'require',
        'group'  =>  'require',
        'name'  =>  'require|alpha|length:3,30',
        'title'  =>  'require|chsDash|max:100',    //一个汉字3个字符（UTF-8）
    ];

    /**
     * 提示消息
     */
    protected $message = [
        'type.require' => '类型必须',
        'group.require' => '分组必须',
        'name.require' => '变量名必须',
        'name.alpha' => '变量名只能是字母',
        'name.length' => '变量名长度在3与30字符之间',
        'title.require' => '变量标题必须',
        'title.chsDash' => '变量标题只能是汉字、字母、数字和下划线_及破折号-',
        'title.max' => '变量标题长度最大100字符',
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => [],
        'edit' => [],
    ];
}
