// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------




//jquery.validator.min.js配置
$(function(){
    // Custom theme
    $.validator.setTheme('bootstrap', {
        validClass: 'has-success',
        invalidClass: 'has-error',
        bindClassTo: '.form-group',
        formClass: 'n-default n-bootstrap',
        msgClass: 'n-right'
    });
});

//删除缓存按钮点击
$(document).on('click', "[data-toggle='wipecache']", function () {
    $.ajax({
        url: '/admin/ajax/cacheall',
        dataType: 'json',
        cache: false,
        success: function (data) {
            if(data.status){
                layer.msg(data.msg);  
            }else{
                layer.msg('删除缓存成功'); 
            }
            
        }, error: function () {
            layer.msg('删除缓存成功');
        }
    });
});

