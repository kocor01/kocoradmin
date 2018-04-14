// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

document.write("<link rel='stylesheet' href='/static/libs/select2/dist/css/select2.min.css'\/>"); 
document.write("<script src='/static/libs/select2/dist/js/select2.full.min.js'><\/script>"); 

var Select2 = {
    Api:{
        Init:function(CtrlName,Title){
            $('.'+CtrlName).select2({
                placeholder: Title
            });
        },
        SetVal:function(CtrlName,Value){
            $('.'+CtrlName).select2().val(Value).trigger('change');
        },
    },
};