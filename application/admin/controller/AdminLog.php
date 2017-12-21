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
use think\SESSION;

use app\admin\controller\Backend;

class AdminLog extends Backend
{

    public function _initialize()
    {
        $this->serachName = 'user_name';            //搜索字段
        $this->request->filter(['strip_tags']);     //设置过滤方法
        parent::_initialize();
    }

    /**
     *  列表方法
     */
    public function index(){

        if(request()->isAjax()){
            
            //列表请求参数
            $params = $this->get_lists_params();

            $where = [];
            if(!empty($params['search'])){
                $where[$this->serachName] = ['like','%'.$params['search'].'%'];
            }

            $where['admin_id'] = $this->adminInfo->id;

            $list = $this->model->where($where)->order($params['sort']." ".$params['order'])->limit($params['offset'].','.$params['limit'])->select();
            $total = $this->model->where($where)->count();

            $result = array("total" => $total, "rows" => $list);
        
            return $result;
        }

        return $this->fetch('');
    }


    /**
     *  详情
     */
    public function view(){

        $id = Request::instance()->param('id/d');
        $row = $this->model->get($id);

        //全部原始数据 获取器
        //$row = $row->getData();
        $this->view->assign("row", $row);
        return $this->fetch('');
    }


}