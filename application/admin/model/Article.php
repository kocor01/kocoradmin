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

class Article extends Model
{
    //开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    

    public function articleCate(){
        return $this->belongsTo('ArticleCate','cate_id');
    }
}