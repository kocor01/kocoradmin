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
use kocor\Tree;

class AuthGroup extends Model
{
	//开启自动写入时间戳字段
	protected $autoWriteTimestamp = true;

    /**
     * 权限组节点树
     * @return array
     */
    public function getGroupTree(){

        $list = AuthGroup::all(function($query){
            $query->where(['status'=>1])->select();
        })->toArray();

        $tree = new Tree;
        $tree->init($list);
        $tree_list = $tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$title</option>");

        return $tree_list;
    }

}