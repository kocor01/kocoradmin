<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use think\Db;
use think\Request;
use kocor\Tree;
use app\admin\model\AuthGroup;

use app\admin\controller\Backend;

class Config extends Backend
{
	public function index(){
		$getCategoryType = $this->model->getCategoryType();
        $this->view->assign("getCategoryType", $getCategoryType);

        $getGroupList = $getCategoryType;
        foreach ($getGroupList as $key => $value) {
            $getGroupList[$key] = [];
        }

        $configList = $this->model->all()->toArray();
        foreach ($configList as $value) {
            switch ($value['type']) {
                //case 'array':
                    //$value['value'] = json_decode($value['value'],true);
                    //$getGroupList[$value['group']][] = $value;
                    //break;
                
                default:
                    $getGroupList[$value['group']][] = $value;
                    break;
            }
        }
        $this->view->assign("getGroupList", $getGroupList);
        $this->view->assign("configList", $configList);



		return $this->fetch('');
	}

	//更新静态系统配置文件
	public function reFlashConfig(){
		$configList = $this->model->all()->toArray();
		$configFilePath = CONF_PATH.'admin/extra/site.php';

		$config = [];
		foreach ($configList as $key => $value) {
			if($value['type'] == 'array'){
				$config[$value['name']] = json_decode($value['value'],true);
			}else{
				$config[$value['name']] =  $value['value'];
			}
		}
		$result = file_put_contents($configFilePath, "<?php\n\nreturn " . var_export($config, true) . ";\n\n?>");
	}




    /**
     *  编辑方法
     */
    public function edit(){

        if(request()->isPost()){

            $params = Request::instance()->post('row/a'); // 获取post变量

            $configAll = $this->model->all();

            $updateData = [];
            foreach ($configAll as $key => $value) {
                if(isset($params[$value['name']])){
                    $updateData[] = [
                        'id' => $value['id'],
                        'value' => $params[$value['name']],
                    ];    
                }
            }
            //print_r($updateData);exit;

            $this->model->saveAll($updateData);

            try{
                $this->reFlashConfig();
                $this->success('更新成功');
            }catch (Exception $e){
                $this->error($e->getMessage());
            }
        }
    }



}