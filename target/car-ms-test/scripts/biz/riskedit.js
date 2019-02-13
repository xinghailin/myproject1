define(function(require, exports, module) {
	require('../../js/bootstrap.min');
	require('../../js/fileinput2.min');
	var uploadurl=$("#uploadUrl").val();
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
  //绑定新增按钮事件
$("#backBtn").bind("click", back);
function initFileInput1(ctrlName) {
    var control = $('#' + ctrlName);
    control.fileinput({
        language: 'zh', //设置语言
        allowedFileExtensions: ['jpg', 'png','jpeg', 'bmp'],//接收的文件后缀
//        uploadUrl: "aa.php", //上传的地址
//        maxFilesNum: 5,//上传最大的文件数量
        //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
        uploadAsync: true, //默认异步上传
        showUpload: false, //是否显示上传按钮
        showRemove: true, //显示移除按钮
        showPreview: true, //是否显示预览
        showCaption: false, //是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: false,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 5120,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        //maxFileCount: 1, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount: true,
        overwriteInitial: false,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        layoutTemplates:{
//            actionUpload:""   //去掉单独上传按钮
        }
    })
}
function initFileInput(ctrlName,type) {
    var control = $('#' + ctrlName);
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: uploadurl, //上传的地址
        allowedFileExtensions: ['jpg','png','jpeg','bmp'],//接收的文件后缀
//        maxFilesNum: 5,//上传最大的文件数量
        uploadExtraData:{"type": type},
        uploadAsync: true, //默认异步上传
        showUpload: false, //是否显示上传按钮
        showRemove: false, //显示移除按钮
        showPreview: true, //是否显示预览
        showCaption: false,//是否显示标题
        showClose:false,
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: false,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 5120,//单位为kb，如果为0表示不限制文件大小
//        overwriteInitial: false,
        //minFileCount: 0,
//        maxFileCount: 3, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount: true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        layoutTemplates:{
            //actionUpload:"",   //去掉单独上传按钮
//            actionDelete:"",
//            actionZoom:""
        }
    }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
//      alert(1)
//    	console.log(data.response);
//    	console.log(event);console.log(data);console.log(previewId);console.log(index);
    	if(data.response.add)
        {
    		data.response.pid=index;picArr.push(data.response);
//        }
//        previewIdArr.push(previewId);//console.log('文件上传成功！');
        if(picArr.length==totalpic){
        	subm();
//        	upfin=true;
        }
        }
    	else {console.log('文件上传失败');haserror=true;subm();}
//        console.log(previewIdArr);
//        console.log(picArr);
    }).on('fileerror', function (event, data, msg) {  //一个文件上传失败
        console.log('文件上传失败！' + data.msg);haserror=true;subm();
    })
}
for(var i=1;i<10;i++){
	initFileInput("file-0"+i,i);
}
initFileInput("file-10",10);
var pictrue = $('.upload img');
var arr=[];
var picArr=[],previewIdArr=[],totalpic,upfin=false,haserror=false;

pictrue.click(pclick);
function pclick() {
    $('body').css('overflow', 'hidden');
    var top = $(window).scrollTop()
    var index = pictrue.index(this);
    var num = pictrue.length;
    var n = 1;
    $("<div class='du-mask' style='margin-top: " + top + "px'><div class='du-tool'><button class='du-prev'>上一张</button><button class='du-next'>下一张</button><button class='du-large'>放大</button><button class='du-small'>缩小</button><button class='du-close'>关闭</button></div><div class='du-contain'><img class='du-main'></div></div>").appendTo('body');
    var src = $(this).attr('src');
    var main = $(".du-main");
    main.attr('src', src);
    var width = main.width();
    main.css("left", ($(window).width() - width) / 2);
    //鼠标拖拽
//    drag(main.get(0));
    function drag(aa) {
        aa.onmousedown = function (e) {
            ev = e || window.event;
            ox = ev.offsetX;
            oy = ev.offsetY;
            document.onmousemove = function (e) {
                ev = e || window.event;
                aa.style.left = ev.clientX - ox + "px";
                aa.style.top = ev.clientY - oy + "px";
                ev.preventDefault();
            }
        };
        aa.onmouseup = function () {
            document.onmousemove = null
        };
    }

//    上一页
    $(".du-prev").click(function () {
        to_left()
    });
    //       向上一页
    function to_left() {
        if (index == 0) {
            alert("已经是第一张");
        } else {
            index = index - 1;
            var psrc = pictrue.eq(index).attr('src');
            main.attr('src', psrc).css("transform", "scale(1,1)");
            var width = main.width();
            main.css({left: ($(window).width() - width) / 2, top: 0});
            n = 1;
        }
    }

//    下一页
    $(".du-next").click(function () {
        to_right();
    });
    //       向下一页
    function to_right() {
        if (num == (index + 1)) {
            alert("已经是最后一张");
        } else {
            index = index + 1;
            var nsrc = pictrue.eq(index).attr('src');
            main.attr('src', nsrc).css("transform", "scale(1,1)");
            var width = main.width();
            main.css({left: ($(window).width() - width) / 2, top: 0});
            n = 1;
        }
    }

//    放大
    $(".du-large").click(function () {
        n = n + 0.2;
        main.css("transform", "scale(" + n, n + ")");
//        drag(main.get(0));
    });
//    缩小
    $(".du-small").click(function () {
        if (n > 0.6) {
            n = n - 0.2;
            main.css("transform", "scale(" + n, n + ")");
//            drag(main.get(0))
        }
    });
//    关闭
    $(".du-close").click(function () {
        $('.du-mask').remove();
        $('body').css('overflow', 'auto');
    });
//    键盘绑定
    var timeoutflag=null;
  		$(document).unbind("keydown").keydown(function(event){
  			if(timeoutflag != null){
  				clearTimeout(timeoutflag);
  			}
  			timeoutflag=setTimeout(function(){
  				if((event.keyCode == 37) || (event.keyCode == 38)){
  					to_left();
  				}else if((event.keyCode == 39) || (event.keyCode == 40)){
  					to_right();
  				}//执行的代码自己写
  			},100);//500毫秒内不会重复触发
  		});
};
var formGroup=$('.form-group');
var upload=$('.upload');
//$("#file-02").change(function(){
//    that=this
//    setTimeout(function(){
//        var index=$(that).attr('v');
//        console.log(index)
//        var addNum=$(that).parents('.form-group').find('.file-live-thumbs').find('.file-preview-frame').length;
//        var oldNum=upload.eq(index).find('img').length;
//        console.log(oldNum);
//        console.log(addNum);
//        if(addNum+oldNum>2){
//            alert('身份证数量超过两张，请移除不需要的图片')
//        }
//    },500)
//});

//上传两张图
function multipleTwo(index){
	var addNum=formGroup.eq(index).find('.file-preview-frame').length;
    var oldNum=upload.eq(index).find('img').length;
    var text=$('#du-form h4').eq(index).html();
    if(addNum+oldNum>2){
        alert(text+'数量['+(addNum+oldNum)+']超出限制2张，请移除不需要的图片')
        return true;
    }else if(addNum+oldNum<2){
        alert(text+'上传数量不足2张！');
        return true;
    }return false;
}
//上传一张图
function multipleOne(index){
	var addNum=formGroup.eq(index).find('.file-preview-frame').length;
    var oldNum=upload.eq(index).find('img').length;
    var text=$('#du-form h4').eq(index).html();
    if(addNum+oldNum>1){
        alert(text+'数量['+(addNum+oldNum)+']超出限制1张，请移除不需要的图片')
        return true;
    }else if(addNum+oldNum<1){
        alert(text+'上传数量不足1张！');
        return true;
    }
    return false;
}
//上传一张图
function multipleOneMarrige(index){
	var addNum=formGroup.eq(index).find('.file-preview-frame').length;
    var oldNum=upload.eq(index).find('img').length;
    var text=$('#du-form h4').eq(index).html();
    if(addNum+oldNum>1){
        alert(text+'数量['+(addNum+oldNum)+']超出限制1张，请移除不需要的图片')
        return true;
    }
    return false;
}
//必须有图
function hasone(index){
	var addNum=formGroup.eq(index).find('.file-preview-frame').length;
    var oldNum=upload.eq(index).find('img').length;
    var text=$('#du-form h4').eq(index).html();
    if(addNum+oldNum==0){
        alert(text+'至少上传1张！')
        return true;
    }return false;
}
//$('#du-submit').click(function(){
//    if(multipleOne(0)){}
//    else if(multipleTwo(1)){}
//    else if(multipleOne(2)){}
//    else if(multipleOne(3)){}
//    else if(hasone(4)){}
//    else if(hasone(5)){}
//    else if(hasone(6)){}
//    else if(hasone(7)){}
//    else if(multipleOne(8)){}
//    else {
////        $.ajax({
////            url:'1.json',
////            data:arr,
////            success:function(data){
////
////            }
////        });
//        $('#dels').val(JSON.stringify(arr));
//        $('#du-form').submit()
//    }
//})

$('#saveBtn').click(function(){
    if(multipleOne(0)){}
    else if(multipleTwo(1)){}
    else if(multipleOne(2)){}
    else if(multipleOne(3)){}
    else if(hasone(4)){}
    else if(hasone(5)){}
    else if(hasone(6)){}
    else if(hasone(7)){}
    else if(multipleOneMarrige(8)){}
    else {
//        $.ajax({
//            url:'1.json',
//            data:arr,
//            success:function(data){
//
//            }
//        });
//        $('#dels').val(JSON.stringify(arr));
//    	$.ajax({
//            url:$("#formUrl").val(),
//            data:{id:$('#id').val(),conid:$('#conid').val(),dels:JSON.stringify(arr),str:JSON.stringify(picArr)},
//            type:'post',
//            success:function (data){
////                console.log(data)
//            	if(data.status){
//            	alert("保存成功！");
//            	back();}
//            	else alert(data.message);
//            }
//        })
        totalpic=$('.file-preview-frame').length;
        if(totalpic){
        	$('.mask').show()
            $('.kv-file-upload').click();	
        }
        else{subm()}
    }
})
function subm(){
	/*	var ss=$('.file-preview-frame');
		if(ss.length==picArr.length){*/
		if(!haserror){
//			if(upfin)
			{$.ajax({
	        url:$("#formUrl").val(),
	        data:{id:$('#id').val(),conid:$('#conid').val(),dels:JSON.stringify(arr),str:JSON.stringify(picArr)},
	        type:'post',
	        success:function (data){
	            console.log(data)
	        	if(data.status){$('.mask').hide()
	        	alert("保存成功！");
	        	back();}
	        	else {$('.mask').hide();alert(data.message);}
	        }
	    })}
//			else{
//	    	setTimeout(
//	            	subm()
//	            ,1000)
//	    }
		}
		else {
			$('.mask').hide();alert("上传图片出现异常，请检查！");
		}
//	    }
	}
//删除
$(".delete").click(function() {var $th=$(this);
//  var type=$(item).siblings('img').attr('type');
  var imgid=$th.siblings('img').attr('imgid');
  if(imgid){arr.push({id:imgid});}
  $th.parent().remove();
//  console.log(arr);
//  pictrue.unbind();
	pictrue = $('.upload img');
//	pictrue.click(pclick);
})
});