// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

document.write("<link rel='stylesheet' href='/static/libs/bootstrap-fileinput/css/fileinput.min.css'>"); 
document.write("<script src='/static/libs/bootstrap-fileinput/js/fileinput.min.js'><\/script>"); 
document.write("<script src='/static/libs/bootstrap-fileinput/js/plugins/sortable.min.js'><\/script>"); 
document.write("<script src='/static/libs/bootstrap-fileinput/js/locales/zh.js'><\/script>"); 

var Upload = {
    //上传文件插件基础配置
    Defaults:{
        language:'zh',//多语言设置
        required:true,//上传之前是否强制选择文件
        rtl:false,//是否在右（左）模式下定位小部件
        hiddenThumbnailContent:false,//是否隐藏预览图像
        showCaption:true,//是否显示被选文件的简介
        showPreview:true,//是否显示预览区域
        showRemove:true,//是否显示移除按钮
        showUpload:true,//是否显示上传按钮
        showCancel:true,//是否显示取消按钮
        showClose:true,//是否显示关闭按钮
        showUploadedThumbs:true,//是否在预览窗口中继续显示上传的文件缩略图
        showBrowse:true,//是否显示浏览按钮
        captionClass:'',//添加简介按钮的类属性
        previewClass:'',//添加预览按钮的类属性
        //frameClass:'krajee-default',//添加到每个文件缩略图框中
        //purifyHtml:true,//布尔值，是否要在预览中为HTML内容类型显示HTML内容。默认为true。此功能需要dompurify cure53插件被加载。
        //fileSizeGetter:function (bytes) {
        //    var i = Math.floor(Math.log(bytes) / Math.log(1024)),
        //        sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
        //    return (bytes / Math.pow(1024, i)).toFixed(2) * 1 + ' ' + sizes[i];
        //},//回调生成基于字节参数人类友好的文件大小
        initialPreview:[],//初始预览显示内容
        //initialPreviewCount:0//初始预览项的计数
        //initialPreviewDelimiter:'*$$*',//用来分裂的初始预览内容
        initialPreviewAsData:false,//是否将初始预览内容集解析为数据，而不是原始标记
        initialPreviewFileType:'image',//识别用于显示特定文件内容的模板
        initialPreviewConfig:[],//initialpreview设置
        initialPreviewShowDelete:true,//是否显示预览删除按钮
        removeFromPreviewOnError:true,//是否应该从错误预览中删除文件缩略图
        //previewThumbTags:{},//缩略图模板中使用的标记列表
        initialPreviewThumbTags:[],//预览缩略图模板中使用的标记列表
        deleteExtraData:{},//删除图片时额外传入的参数
        deleteUrl:'/admin/ajax/fileInputDelete',//删除图片时的请求路径
        initialCaption:'',//显示的初始预览标题文本
        overwriteInitial:true,//是否要覆盖初始预览内容和标题设置 
        //layoutTemplates :{
        //    actionDelete:'', //去除上传预览的缩略图中的删除图标
        //},//用于呈现布局的每个部分的模板配置
        //previewTemplates:{},//用于呈现每个预览文件类型的模板配置
        //previewSettings:{},//对象用于呈现上面设置的每个预览文件类型的CSS样式设置
        //previewSettingsSmall:{},//类似于previewsettings，但CSS样式应用只有与屏幕宽度小于400px小型设备
        //previewzoomsettings:{},//用于在缩放模式预览中显示的内容的HTML属性的配置
        //previewzoombuttonicons:{},//用于在详细预览中为各种缩放控件按钮显示的图标
        //previewZoomButtonClasses:{},//详细预览中为缩放控件按钮设置的CSS类
        preferIconicPreview:false,//是否强制标志性的预览在预览区文件的缩略图
        preferIconicZoomPreview:false,//是否强制标志性的预览在详细预览区文件的缩略图
        //previewZoomButtonTitles:{},//在详细预览中为缩放控件按钮设置的标题
        allowedFileTypes:['image', 'html', 'text', 'video', 'audio', 'flash', 'object'],//允许的文件类型,不填将支持上传所有文件类型
        allowedFileExtensions:['jpg', 'gif', 'png', 'txt'],//允许的文件扩展名
        allowedPreviewTypes:['image', 'html', 'text', 'video', 'audio', 'flash', 'object'],//允许的预览类型列表
        //allowedpreviewmimetypes:null,//预览数组允许的MIME类型列
        //defaultPreviewContent:'',//预览窗口中显示默认内容/标记
        //customLayoutTags:{},//布局模板中替换的附加自定义标记列表
        //customPreviewTags:{},//对象将在预览模板中替换的附加自定义标记列表
        //fileTypeSettings:{},//选择一个文件上传时验证和识别每个文件类型
        //previewFileIcon:'<i class="glyphicon glyphicon-file"></i>',//字符串、图标在预览文件的缩略图显示在预览不可读的文件类型检测
        //previewFileIconClass:'file-other-icon',//预览文件图标容器的CSS类
        //previewFileIconSettings:{},//每个文件扩展名（类型）预览图标标记设置
        //previewFileExtSettings:{},//每个文件扩展名（类型）自动派生的扩展名
        //buttonLabelClass:'hidden-xs',//按钮标签的CSS类
        //browseLabel:'浏览',//文件选择器/浏览按钮显示的标签
        //browseIcon:'<i class="glyphicon glyphicon-folder-open"></i>&nbsp;',//文件选择器/浏览按钮的标签之前显示的图标
        //browseClass:'btn btn-primary',//文件选择器/浏览按钮的CSS类
        //removeLabel:'删除',//删除按钮显示的标签
        //removeIcon:'<i class="glyphicon glyphicon-trash"></i>',//删除按钮的标签之前显示的图标
        //removeClass:'btn btn-default',//删除按钮的CSS类
        //removeTitle:'删除',//文件删除按钮上悬停显示的标题
        //uploadLabel:'上传',//上传按钮显示的标签
        //uploadIcon:'<i class="glyphicon glyphicon-trash"></i>',//上传按钮的标签之前显示的图标
        //uploadClass:'btn btn-default',//上传按钮的CSS类
        //uploadTitle:'上传',//文件上传按钮上悬停显示的标题
        enctype:'multipart/form-data',
        uploadUrl:'/admin/ajax/fileInputUpload',//上传文件路径
        //uploadThumbUrl:''//每个单独的文件缩略图分别上传
        uploadAsync:true,//是否为异步上传
        uploadExtraData:{},//上传文件时额外传递的参数设置
        zoomModalHeight:480,//显示缩放预览内容的模式窗口中的默认高度
        minImageWidth:null,//图片的最小宽度
        minImageHeight:null,//图片的最小高度
        maxImageWidth:null,//图片的最大宽度
        maxImageHeight:null,//图片的最大高度
        resizeImage:false,//是否添加调整上传图像的能力
        resizePreference:'width',//按宽度或高度调整图像大小的首选项
        resizeQuality:0.92,//图像质量
        resizeDefaultImageType:'image/jpeg',//在缩放后转换图像的默认图像MIME类型
        //resizeIfSizeMoreThan:0,//文件超出尺寸调整。
        minFileSize:0,//单位为kb，上传文件的最小大小值
        maxFileSize:0,//单位为kb，如果为0表示不限制文件大小
        maxFilePreviewSize:0,//最大预览文件大小
        minFileCount:0,//表示同时最小上传的文件个数
        maxFileCount:0,//表示允许同时上传的最大文件个数
        validateInitialCount:false,//初始预览文件数
        ajaxOperations:'',//友好信息提示
        //progressClass:'progress-bar progress-bar-success progress-bar-striped active',//应用上传进度条CSS类 
        //progressCompleteClass:'progress-bar progress-bar-success',进度条成功CSS类 
        //progressErrorClass:'progress-bar progress-bar-danger',进度条错误CSS类 
        //progressUploadThreshold:99,//进度百分比阈值
        previewFileType:'image',//预览文件类型,内置['image', 'html', 'text', 'video', 'audio', 'flash', 'object',‘other‘]等格式
        //zoomIndicator:'<i class="glyphicon glyphicon-zoom-in"></i>',//对zooming图标的文件内容的一个新的模态对话框
        //elerrorcontainer:'',//对容器元素显示错误的标识符
        //elCaptionContainer:'',//对容器元素显示错误的标识符
        //elCaptionText:'',//标题文本的容器元素的标识符
        //elpreviewcontainer:'',//预览容器元素的标识符
        //elpreviewimage:'',//图像预览缩略图的元素的标识符
        //elpreviewstatus:'',//预览进步状态元素的标识符
        //slugcallback:'',//使用回调函数将文件名转换为字符串字符串，消除特殊字符
        dropzoneenabled:true,//是否允许拖放文件的区域
        //dropzonetitleclass:'file-drop-zone-title',//拖放区域标题的字符串、CSS类
        //fileactionsettings:{},//在预览窗口中为新选择的文件缩略图设置文件操作的对象配置
        //otheractionbuttons:{},//用于在初始预览缩略图中显示的附加动作按钮的字符串、标记
        textEncoding:'UTF-8',//编码设置
        //ajaxSettings:{},//在提交Ajax请求上传之前，将附加Ajax设置附加到插件
        //ajaxDeleteSettings:{},//在每个初始预览缩略图中提交删除Ajax请求之前，要将其他Ajax设置传递给插件。
        //showAjaxErrorDetails:true,//是否通过Ajax响应遇到错误时从服务器日志中显示错误堆栈的详细信息。
        //mergeAjaxCallbacks:false,//是否合并设置在ajaxsettings与插件的默认回调beforesend
        //mergeAjaxDeleteCallbacks:false,//是否合并设置在ajaxdeletesettings与插件的默认回调beforesend
        //retryErrorUploads:true,//是否允许重试文件缩略图
    },
    //接口
    Api:{
        Init:function(CtrlName,FileConfig){
            var FileConfig = $.extend( true,{},Upload.Defaults,FileConfig);
            $('#upload-'+CtrlName).fileinput(FileConfig)
            .on("filebatchselected", function(event, files) {
                $('#upload-'+CtrlName).fileinput("upload");
            }).on("fileuploaded", function (event, data, previewId, index){
                $('#row-'+CtrlName).val(data.response.pic_url);       
            }).on('filepredelete', function(event, key, jqXHR, data) {
                console.log('Key = ' + key);
                console.log(data);
                console.log(jqXHR);
            });
        },
    }
}