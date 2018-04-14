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
use kocor\Tree;

use app\admin\controller\Backend;

class Article extends Backend
{

    public function _initialize()
    {
        parent::_initialize();
        $this->tree = new Tree;
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
            $where['status'] = 1;

            $list = $this->model
                    ->with('articleCate')
                    ->where($where)
                    ->order($params['sort']." ".$params['order'])
                    ->limit($params['offset'].','.$params['limit'])
                    ->select();

            $total = $this->model
                    ->with('articleCate')
                    ->where($where)
                    ->count();

            $result = array("total" => $total, "rows" => $list);
        
            return $result;
        }

        return $this->fetch('');
    }

    /**
     *  增加方法
     */
    public function add(){

        if(request()->isPost()){

            $params = Request::instance()->post('row/a'); // 获取post变量

            if(!$this->validate->check($params)){
                $this->error($this->validate->getError());
            }else{
                
                $this->model->data($params);
                $result = $this->model->allowField(true)->save();
                if($result){
                    $this->success('添加成功');
                }else{
                    $this->error('添加失败');
                }
            }
        }

        $where['status'] = 1;
        $list = model('ArticleCate')->where($where)->select()->toArray();
        $this->tree->init($list,'pid','name');
        $tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$name</option>");
        $this->view->assign("tree_list", $tree_list);

        return $this->fetch('');
    }

    /**
     *  编辑方法
     */
    public function edit(){

        $id = Request::instance()->param('id/d');
        $row = $this->model->get($id);
        if(request()->isPost()){

            $params = Request::instance()->post('row/a'); // 获取post变量

            //print_r($params);exit;


            if(!$this->validate->check($params)){
                $this->error($this->validate->getError());
            }else{

                $row->data($params,true);
                $result = $row->allowField(true)->save();
                if($result){
                    $this->success('更新成功');
                }else{
                    $this->error('更新失败');
                }
            }
        }

        $where['status'] = 1;
        $list = model('ArticleCate')->where($where)->select()->toArray();
        $this->tree->init($list,'pid','name');
        $tree_list = $this->tree->get_tree(0,"<option value=\$id \$selected>\$spacer\$name</option>",$row['cate_id']);
        $this->view->assign("tree_list", $tree_list);

        //全部原始数据 获取器
        $row = $row->getData();
        $this->view->assign("row", $row);
        return $this->fetch('');
    }

}