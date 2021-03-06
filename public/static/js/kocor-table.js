// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

document.write("<link rel='stylesheet' href='/static/libs/bootstrap-table/dist/bootstrap-table.min.css'>"); 
document.write("<script src='/static/libs/bootstrap-table/dist/bootstrap-table.js'><\/script>"); 
document.write("<script src='/static/libs/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js'><\/script>"); 
document.write("<script src='/static/libs/bootstrap-table/dist/extensions/export/bootstrap-table-export.js'><\/script>"); 
document.write("<script src='/static/libs/tableExport.jquery.plugin/tableExport.min.js'><\/script>"); 


//获取url组成参数
var controller_path = $('#tb_departments').attr('data-controller-path');

var Table = {

    // Bootstrap-table 基础配置
    Defaults: {
        url: '/admin/'+controller_path+'/index',         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        undefinedText: "-",    //当数据为 undefined 时显示的字符
        striped: true,    //设置为 true 会有隔行变色效果
        sortName: 'id',    //定义排序列,通过url方式获取数据填写字段名，否则填写下标
        sortOrder: "desc",    //定义排序方式 'asc' 或者 'desc'
        cache: false,    //设置为 false 禁用 AJAX 数据缓存
        contentType: "application/json",    //发送到服务器的数据编码类型
        dataType: "json",    //服务器返回的数据类型
        //queryParams: Table.queryParams,    //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果 queryParamsType = 'limit' ,返回参数必须包含limit, offset, search, sort, order 否则, 需要包含: pageSize, pageNumber, searchText, sortName, sortOrder. 返回false将会终止请求
        queryParamsType: "limit",    //设置为 'limit' 则会发送符合 RESTFul 格式的参数.
        pagination: true,    //设置为 true 会在表格底部显示分页条
        paginationLoop: false,    //设置为 true 启用分页条无限循环的功能。
        onlyInfoPagination: false,    //设置为 true 只显示总数据数，而不显示分页按钮。需要 pagination='True'
        sidePagination: "server",    //设置在哪里进行分页，可选值为 'client' 或者 'server'。设置 'server'时，必须设置 服务器数据地址（url）或者重写ajax方法
        pageNumber: 1,    //如果设置了分页，首页页码
        pageSize: 25,    //如果设置了分页，页面数据条数
        pageList: [10, 25, 50, 100],    //如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
        selectItemName: "btSelectItem",    //radio or checkbox 的字段名
        smartDisplay: true,    //设置为 true可以在分页和卡片视图快速切换
        search: true,    //是否启用搜索框
        searchOnEnterKey: true,    //设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
        strictSearch: true,    //设置为 true启用 全匹配搜索，否则为模糊搜索
        //searchText: "请输入搜索关键字",    //定义排序列
        trimOnSearch: false,    //设置为 true 将允许空字符搜索
        showColumns: true,    //是否显示 内容列下拉框
        showRefresh: true,    //是否显示 刷新按钮
        showToggle: true,    //是否显示 切换试图（table/card）按钮
        showPaginationSwitch: true,    //是否显示 数据条数选择框
        idField: "id",    //指定主键列
        uniqueId: "ID",    //为每一行指定唯一的标识符
        detailView: false,    //设置为 true 可以显示详细页面模式。
        cardView: false,    //设置为 true将显示card视图，适用于移动设备。否则为table试图，适用于pc
        paginationPreText: "上一页",    //指定分页条中上一页按钮的图标或文字
        paginationNextText: "下一页",    //指定分页条中下一页按钮的图标或文字
        clickToSelect: true,    //设置true 将在点击行时，自动选择rediobox 和 checkbox
        singleSelect: false,    //设置True 将禁止多选
        toolbar: "#toolbar",    //工具按钮用哪个容器
        checkboxHeader: true,    //设置false 将在列头隐藏check-all checkbox .
        maintainSelected: true,    //设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
        sortable: true,    //设置为false 将禁止所有列的排序
        silentSort: false,    //设置为 false 将在点击分页按钮时，自动记住排序项。仅在 sidePagination设置为 server时生效.

        //列配置项,
        columns: [
            {checkbox: false}, 
            {field:'id',title:'ID',titleTooltip:"ID"}, 
        ],
    },
    //接口
    Api: {
        Init: function(CtrlName,TableConfig){
            var TableConfig = $.extend( true,{},Table.Defaults,TableConfig);
            $('#'+CtrlName).bootstrapTable(TableConfig);

            //初始化Button的点击事件
            var oButtonInit = new ButtonInit();
            oButtonInit.Init();
        },
        //注册按钮事件
        OperateEvents: {
            //编辑
            "click #tableEditor" : function(e,value,row,index){
                layer.open({
                    type: 2,
                    title: '编辑',
                    maxmin: true,
                    shadeClose: true, //点击遮罩关闭层
                    area : ['800px' , '520px'],
                    content: '/admin/'+controller_path+'/edit/id/'+row.id,
                    end: function () {
                        $("#tb_departments").bootstrapTable('refresh');
                    }
                });
            },
            //删除
            "click #tableDelete" : function(e,value,row,index){
                layer.confirm('确认要删除选择的数据吗？', {btn: ['确定','取消']}, function(){

                    var ids = row.id;
                    $.ajax({ url: '/admin/'+controller_path+'/del/ids/'+ids, success: function(result){
                        if(result.status == 1){
                            layer.alert(result.msg,{icon: 1});
                        }else{
                            layer.alert(result.msg,{icon: 2});
                        }
                        $("#tb_departments").bootstrapTable('refresh');
                    }});
                });
            }
        },
        //自定义方法，添加操作按钮
        OperateFormatter: function(value, row, index) {
            return [
                '<a href="javascript:;" class="btn btn-xs btn-success" id="tableEditor"><i class="fa fa-pencil"></i></a> ',
                '<a href="javascript:;" class="btn btn-xs btn-danger" id="tableDelete"><i class="fa fa-trash"></i></a>',
            ].join('');
        },
        formatter:{
            //图标
            Icon:function(value, row, index) {
                return '<i class="'+value+'"></i>';
            },
            //Label显示
            Label:function(value, row, index) {
                var lavelArr = new Array();
                var arr=value.split(',');
                for(var i=0;i<arr.length;i++){
                    lavelArr.push('<span class="label label-primary">'+arr[i]+'</span> ');
                }
                return lavelArr.join("");
            },
            //Status显示  正常、禁止
            DefaultStatus:function(value, row, index) {
                if(value ==1 || value =='正常'){
                    return '<span class="label label-success">正常</span>';
                }else{
                    return '<span class="label label-danger">禁止</span>';
                };
            },
            //Status显示  是、否
            OtherStatus:function(value, row, index) {
                if(value ==1 || value =='正常'){
                    return '<span class="label label-info">是</span>';
                }else{
                    return '<span class="label label-default">否</span>';
                };
            },
            //images显示
            Image:function(value, row, index) {
                return '<img src="'+value+'" width=50 height=50></i>';
            },
        }
    },
}


//bootstrap table Button的点击事件
var ButtonInit = function () {
    var oInit = new Object();

    oInit.Init = function () {
        $("#btn_add").click(function () {
            layer.open({
                type: 2,
                title: '增加',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['800px' , '520px'],
                content: '/admin/'+controller_path+'/add',
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
                content: '/admin/'+controller_path+'/edit/id/'+arrselections[0].id,
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
                $.ajax({ url: '/admin/'+controller_path+'/del/ids/'+ids, success: function(result){
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

//获取多选框ID
function getIdSelections() {
    return $.map($("#tb_departments").bootstrapTable('getSelections'), function (row) {
        return row.id;
    });
}



