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

class Database extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'part'  =>  'require|number',  
        'compress'  =>  'require|in:0,1',
    ];
    /**
     * 提示消息
     */
    protected $message = [
        'part.require' => '分卷大小必须',
        'part.number'     => '分卷大小必须为数字',
        'compress.require'     => '压缩值必须',
        'compress.in'     => '压缩值必须为0或1',
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => [],
        'edit' => [],
    ];
    
}
