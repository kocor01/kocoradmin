<?php

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\model;
use think\helper\Str;
use think\Model;
use think\Session;

class Admin extends Model
{
	//开启自动写入时间戳字段
	protected $autoWriteTimestamp = true;


    //获取器:Status
    public function getStatusAttr($value){
        $status = [0=>'禁用',1=>'正常'];
        return $status[$value];
    }

    //获取器:last_login_time
    public function getLastLoginTimeAttr($value){
        return $value?date('Y-m-d H:i:s',$value):'-';
    }

    //修改器:Password
    public function setPasswordAttr($value,$data){
        return md5($value.$data['salt']);
    }

    //获取密码盐
    public function getSalt(){
        return Str::random(6);
    }

    //获取Token
    public function getToken(){
        return Str::random(32);
    }

    //获取密码加密串
    public function getPasswordMd5Str($value,$salt='')
    {
        return md5($value.$salt);
    }

    //获取登录SESSION信息
    public function getAdminLoginInfo(){
        return Session::get('admin');
    }

    //关联auth_group
    public function group_access()
    {
        return $this->hasMany('auth_group_access','uid')->field('uid,group_id');
    }

    /**
     * 更新管理员权限
     * @param string $id 管理员ID
     * @param array $groups 赋权权限组
     * @return bool
     */
    public function reAdminGroupAccess($id,$groups){
        //权限组数组
        $group_arr = [];
        foreach ($groups as $value) {
            $group_arr[] = ['group_id'=>$value];
        }

        //更新权限组
        $Admin = Admin::get($id);
        //关联删除
        $Admin->group_access()->delete();
        //关联添加
        $Admin->group_access()->saveAll($group_arr);

        return true;
    }

















}