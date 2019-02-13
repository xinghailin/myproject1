define(function(require, exports, module) {
	require('../../js/bootstrap.min');
	require('../../js/fileinput2.min');
	var uploadurl=$("#uploadUrl").val(),picArr=[],previewIdArr=[],totalpic,upfin=false,haserror=false,formGroup;
    function saveFun(){
//    	var file1=$("#file-01").prop('files').length;
//		if(file1==0){alert("请上传申请表");return;}
//		var file2=$("#file-02").prop('files').length;
//		if(file2==0){alert("请上传身份证（正反面）");return;}
//		else if(file2<2){alert("身份证（正反面）上传数量不足"+file2);return;}
//		var file3=$("#file-03").prop('files').length;
//		if(file3==0){alert("请上传驾驶证");return;}
//		var file4=$("#file-04").prop('files').length;
//		if(file4==0){alert("请上传工作证明");return;}
//		var file5=$("#file-05").prop('files').length;
//		if(file5==0){alert("请上传征信报告");return;}
//		var file6=$("#file-06").prop('files').length;
//		if(file6==0){alert("请上传工资卡或经营走账卡（正面）");return;}
//		var file7=$("#file-07").prop('files').length;
//		if(file7==0){alert("请上传流水（多图）");return;}
//		var file8=$("#file-08").prop('files').length;
//		if(file8==0){alert("请上传房产证（多图）");return;}
//    	$('#editForm').submit();
		$.ajax({
            url:$("#formUrl").val(),
            data:picArr,
            type:'post',
            success:function (data){
                console.log(data)
            }
        })
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
    function initFileInput(ctrlName,type) {
        var control = $('#' + ctrlName);
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadurl, //上传的地址
            allowedFileExtensions: ['jpg','png','jpeg','bmp'],//接收的文件后缀
//            maxFilesNum: 5,//上传最大的文件数量
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
//            overwriteInitial: true,
            //minFileCount: 0,
//            maxFileCount: 3, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            layoutTemplates:{
                //actionUpload:"",   //去掉单独上传按钮
//                actionDelete:"",
//                actionZoom:""
            }
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
//            alert(1)
//        	console.log(data.response);
//        	console.log(event);console.log(data);console.log(previewId);console.log(index);
        	if(data.response.add)
            {
        		data.response.pid=index;picArr.push(data.response);
//            }
//            previewIdArr.push(previewId);//console.log('文件上传成功！');
            if(picArr.length==totalpic){
            	subm();
//            	upfin=true;
            }
            }
        	else {console.log('文件上传失败');haserror=true;subm();}
//            console.log(previewIdArr);
//            console.log(picArr);
        }).on('fileerror', function (event, data, msg) {  //一个文件上传失败
            console.log('文件上传失败！' + data.msg);haserror=true;subm();
        })
//        .on('filesuccessremove', function(event, data, previewId, index)  {
////            console.log(data);
//        	console.log(event);console.log(data);console.log(previewId);console.log(index);
//            for(var i=0;i<previewIdArr.length;i++){
//                if(previewIdArr[i]==data){
////                    alert(1);
//                    previewIdArr.splice(i,1);
//                    picArr.splice(i,1);
//                    break;
//                }
//            }
////            console.log(previewIdArr);
////            console.log(picArr);
//        });
    }
//	$(function () {
	for(var i=1;i<10;i++){
		initFileInput("file-0"+i,i);
	}
	initFileInput("file-10",10);
//    })
	//绑定新增按钮事件
//	$('#saveBtn').bind("click",saveFun);
	$("#backBtn").bind("click", back);

//var upload=$('.upload');
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
//    var oldNum=upload.eq(index).find('img').length;
    var text=$('#editForm h4').eq(index).html();
    if(addNum>2){
        alert(text+"数量["+addNum+"]超出限制2张，请移除不需要的图片")
        return true;
    }else if(addNum<2){
        alert(text+'上传数量不足2张！');
        return true;
    }return false;
}
//上传一张图
function multipleOne(index){
    var addNum=formGroup.eq(index).find('.file-preview-frame').length;
//    var oldNum=upload.eq(index).find('img').length;
    var text=$('#editForm h4').eq(index).html();
    if(addNum>1){
        alert(text+"数量["+addNum+"]超出限制1张，请移除不需要的图片")
        return true;
    }else if(addNum<1){
        alert(text+'上传数量不足1张！');
        return true;
    }
    return false;
}
//必须有图
function hasone(index){
    var addNum=formGroup.eq(index).find('.file-preview-frame').length;
//    var oldNum=upload.eq(index).find('img').length;
    var text=$('#editForm h4').eq(index).html();
    if(addNum==0){
        alert(text+'至少上传1张！')
        return true;
    }return false;
}
$('#saveBtn').click(function(){
	if(!formGroup)
	formGroup=$('.form-group');
    if(multipleOne(0)){}
    else if(multipleTwo(1)){}
    else if(multipleOne(2)){}
    else if(multipleOne(3)){}
    else if(hasone(4)){}
    else if(hasone(5)){}
    else if(hasone(6)){}
    else if(hasone(7)){}
//    else if(multipleOne(8)){}
    else {
//        $.ajax({
//            url:'1.json',
//            data:arr,
//            success:function(data){
//
//            }
//        });
//        $('#dels').val(JSON.stringify(arr));
    	totalpic=$('.file-preview-frame').length;
    	$('.mask').show()
        $('.kv-file-upload').click();
//    	if(!haserror)
//    	setTimeout(
//        	subm()
//        ,1000);
    }
})
function subm(){
/*	var ss=$('.file-preview-frame');
	if(ss.length==picArr.length){*/
	if(!haserror){
//		if(upfin)
		{$.ajax({
        url:$("#formUrl").val(),
        data:{conid:$('#conid').val(),concode:$('#concode').val(),str:JSON.stringify(picArr)},
        type:'post',
        success:function (data){
            console.log(data)
        	if(data.status){$('.mask').hide()
        	alert("保存成功！");
        	back();}
        	else {$('.mask').hide();alert(data.message);}
        }
    })}
//		else{
//    	setTimeout(
//            	subm()
//            ,1000)
//    }
	}
	else {
		$('.mask').hide();alert("上传图片出现异常，请检查！");
	}
//    }
}
});