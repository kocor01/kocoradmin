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

class Config extends Model
{
    //开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    
	public static function getCategoryType(){
		return config('site.categorytype');
	}

    public static function getTypeList(){
        return [
            'string' => '字符串',
            'text'   => '文本',
            'number' => '数字',
            'datetime' => '日期时间',
            'select' => '列表',
            'selects' => '列表(多选)',
            'image' => '图片',
            'images' => '图片(多选)',
            'file' => '文件',
            'files' => '文件(多选)',
            'checkbox' => '复选',
            'radio' => '单选',
            'array' => '数组',
        ];
    }
	

}