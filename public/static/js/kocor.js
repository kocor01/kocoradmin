// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

//------------图标选择 START--------------

//图标选择页面
var iconlist = [];
$(document).on('click', ".btn-search-icon", function () {
    if (iconlist.length == 0) {
        $.get("/static/libs/font-awesome/less/variables.less", function (ret) {

            var exp = /fa-var-(.*):/ig;
            var result;
            while ((result = exp.exec(ret)) != null) {
                iconlist.push(result[1]);
            }
            layer.open({
                type: 1,
                area: ['460px', '300px'], //宽高
                content: template('chooseicontpl', {iconlist: iconlist})
            });
        });
    } else {
        layer.open({
            type: 1,
            area: ['460px', '300px'], //宽高
            content: template('chooseicontpl', {iconlist: iconlist})
        });
    }
});

//图标选择
$(document).on('click', '#chooseicon ul li', function () {
    $("input[name='row[icon]']").val('fa fa-' + $(this).data("font"));
    layer.closeAll();
});

//打开图标选择页面
$(document).on('keyup', 'input.js-icon-search', function () {
    $("#chooseicon ul li").show();
    if ($(this).val() != '') {
        $("#chooseicon ul li:not([data-font*='" + $(this).val() + "'])").hide();
    }
});

//------------图标选择 END--------------


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

