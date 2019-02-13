define(function(require, exports, module) {
	require('../../js/fileinput2.min');
	require('../../js/bootstrap.min');
    function saveFun(parm){
    	var pas=parm.data.pas;
    	if(pas==1){
    		var file1=$("#file-01").prop("files").length;
    		if(file1==0){alert("请上传定金POS单");return;}
    		$("#ret").val(1);}
    	else if(pas==2){
    		if($.trim($("#du-reason1").val()).length==0){alert("不同意原因必填！");return false;}
    		$("#ret").val(2);
    	}
    	$('#editForm').submit();
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
  //绑定新增按钮事件
	$('#saveBtn').bind("click",{pas : 1},saveFun);
	$('#savenotBtn').bind("click",{pas : 2},saveFun);
	$("#backBtn").bind("click", back);
	function initFileInput(ctrlName) {
        var control = $('#' + ctrlName);
        control.fileinput({
            language: 'zh', //设置语言
//            uploadUrl: "aa.php", //上传的地址
//            maxFilesNum: 5,//上传最大的文件数量
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
            maxFileSize: 10240,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            //maxFileCount: 1, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            layoutTemplates:{
                actionUpload:""   //去掉单独上传按钮
            }
        })
    }
    initFileInput("file-01");
});