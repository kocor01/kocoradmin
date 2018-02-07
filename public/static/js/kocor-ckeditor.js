// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

document.write("<script src='/static/libs/ckeditor/ckeditor.js'><\/script>"); 

var CkEditor = {
    //基础配置
    Defaults:{
        height: 350,   
        filebrowserUploadUrl: "/admin/ajax/ckUpload", //设置图片上传请求地址  
    },
    //接口
    Api:{
        Init:function(CtrlName){
            CKEDITOR.replace(CtrlName, {   
                height: 350,   
                filebrowserUploadUrl: "/admin/ajax/ckUpload", //设置图片上传请求地址  
            });

            // $("#btn_submit").click(function () {
            //     $("#"+CtrlName).val(getContenet());
            // });

            // function getContenet(){
            //     return CKEDITOR.instances.CtrlName.getData();    //获取textarea的值
            // }
        },
    },
};