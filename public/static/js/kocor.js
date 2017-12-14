// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

});

//获取url组成参数
var urlName = $('#tb_departments').attr('data-url-name');


//bootstrap table Button的点击事件
var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        $("#btn_add").click(function () {
            layer.open({
                type: 2,
                title: '增加',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['800px' , '520px'],
                content: '/admin/'+urlName+'/add',
                end: function () {
                    $("#tb_departments").bootstrapTable('refresh');
                }
            });
        });

        $("#btn_edit").click(function () {
            var arrselections = $("#tb_departments").bootstrapTable('getSelections');
            if (arrselections.length > 1) {
                layer.alert('只能选择一行进行编辑',{icon: 2});
                return false;
            }
            if (arrselections.length <= 0) {
                layer.alert('请选择有效数据',{icon: 2});
                return false;
            }
            layer.open({
                type: 2,
                title: '编辑',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['800px' , '520px'],
                content: '/admin/'+urlName+'/edit/id/'+arrselections[0].id,
                end: function () {
                    $("#tb_departments").bootstrapTable('refresh');
                }
            });
        });

        $("#btn_del").click(function () {
            var arrselections = $("#tb_departments").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                layer.alert('请选择有效数据',{icon: 2});
                return false;
            }

            layer.confirm('确认要删除选择的数据吗？', {btn: ['确定','取消']}, function(){

                var ids = getIdSelections();
                $.ajax({ url: '/admin/'+urlName+'/del/ids/'+ids, success: function(result){
                    if(result.status == 1){
                        layer.alert(result.msg,{icon: 1});
                    }else{
                        layer.alert(result.msg,{icon: 2});
                    }
                    $("#tb_departments").bootstrapTable('refresh');
                }});
            });
        });
    };

    return oInit;
};


//bootstrap table 操作按钮
function operateFormatter(value, row, index) {
    return [
        '<a href="javascript:;" class="btn btn-xs btn-success" id="tableEditor"><i class="fa fa-pencil"></i></a> ',
        '<a href="javascript:;" class="btn btn-xs btn-danger" id="tableDelete"><i class="fa fa-trash"></i></a>',
    ].join('');
}

//bootstrap table 操作按钮事件
window.operateEvents = {
	//编辑
    "click #tableEditor" : function(e,value,row,index){
        layer.open({
            type: 2,
            title: '编辑',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['800px' , '520px'],
            content: '/admin/'+urlName+'/edit/id/'+row.id,
            end: function () {
                $("#tb_departments").bootstrapTable('refresh');
            }
        });
    },
    //删除
    "click #tableDelete" : function(e,value,row,index){
        layer.confirm('确认要删除选择的数据吗？', {btn: ['确定','取消']}, function(){

            var ids = row.id;
            $.ajax({ url: '/admin/'+urlName+'/del/ids/'+ids, success: function(result){
                if(result.status == 1){
                    layer.alert(result.msg,{icon: 1});
                }else{
                    layer.alert(result.msg,{icon: 2});
                }
                $("#tb_departments").bootstrapTable('refresh');
            }});
        });
    }
}

//获取多选框ID
function getIdSelections() {
    return $.map($("#tb_departments").bootstrapTable('getSelections'), function (row) {
        return row.id;
    });
}


//Status显示
function getDefaultStatus(value, row, index) {
    if(value ==1 || value =='正常'){
        return '<span class="label label-success">正常</span>';
    }else{
        return '<span class="label label-danger">禁止</span>';
    };
}

//Status显示
function getWhetherStatus(value, row, index) {
    if(value ==1 || value =='正常'){
        return '<span class="label label-info">是</span>';
    }else{
        return '<span class="label label-default">否</span>';
    };
}

//Icon显示
function getIconShow(value, row, index) {
    return '<i class="'+value+'"></i>';
}

//Icon显示
function getLabels(value, row, index) {
    var lavelArr = new Array();
    var arr=value.split(',');
    for(var i=0;i<arr.length;i++){
        lavelArr.push('<span class="label label-primary">'+arr[i]+'</span> ');
    }
    return lavelArr.join("");
}



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

