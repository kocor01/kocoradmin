// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

document.write("<style>#chooseicon {margin:10px;}#chooseicon ul {margin:5px 0 0 0;}#chooseicon ul li{width:30px;height:30px;line-height:30px;border:1px solid #ddd;padding:1px;margin:1px;text-align: center;}#chooseicon ul li:hover{border:1px solid #2c3e50;cursor:pointer;}</style>"); 
document.write('<script id="chooseicontpl" type="text/html"><div id="chooseicon"><div><form onsubmit="return false;"><div class="input-group input-groupp-md"><div class="input-group-addon">搜索图标</div><input class="js-icon-search form-control" type="text" placeholder=""></div></form></div><div><ul class="list-inline"><% for(var i=0; i<iconlist.length; i++){ %><li data-font="<%=iconlist[i]%>" title="<%=iconlist[i]%>"><i class="fa fa-<%=iconlist[i]%>"></i></li><% } %></ul></div></div></script>'); 
document.write("<script src='/static/js/template-native.js'><\/script>");  

var TemplateNative = {
    Api:{
        Init:function(CtrlName){
            //图标选择页面
            var iconlist = [];
            $(document).on('click', "#"+CtrlName, function () {
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
        },
    },
};