define(function(require, exports, module) {
	require('../../js/fileinput2.min');
	require('../../js/bootstrap.min');
	require('../base/validation-proxy');
	$('#initials').bind('change', selectBrand);
	 $('#brand').bind('change', selectModel);
	 $('#model').bind('change', selectVersion);
		function selectBrand(){
			 $('#brand option').remove();
		     $('#model option').remove();
		     $('#version option').remove();
			 var brandinitial = $("#initials").val();
		     var modelUrl=$('#brandUrl').val();
		        $.ajax(modelUrl,{
		        	type: "post",
		            data: {brandinitial: brandinitial},
		            datatype: "json",
		            success: function (data) {
		            	var brand=data.abrand;
		            	var ddl = $("#brand");
		                 ddl.append("<option value=''>请选择</option>");
		                $.each(brand, function (idx, val) {
		                	ddl.append($("<option value='"+val.brand+"'>" + val.brand + "</option>"))
		                })
		            }
		        })
			}
		function selectModel(){
			 $('#model option').remove();
			 $('#version option').remove();
			 var brand = $("#brand").val();
		     var modelUrl=$('#modelUrl').val();
		        $.ajax(modelUrl,{
		        	type: "post",
		            data: {brand: brand},
		            datatype: "json",
		            success: function (data) {
		            	var model=data.model;
		            	var ddl = $("#model");
		                ddl.append("<option value=''>请选择</option>");
		                $.each(model, function (idx, val) {
		                	ddl.append($("<option value='"+val.model+"'>" + val.model + "</option>"))
		                })
		            }
		        })
			}
			function selectVersion(){
				 $('#version option').remove();
				 var model = $("#model").val();
			     var versionUrl=$('#versionUrl').val();
			        $.ajax(versionUrl,{
			        	type: "post",
			            data: {model:model},
			            datatype: "json",
			            success: function (data) {
			            	var version=data.version;
			            	var ddl = $("#version");
			                 ddl.append("<option value=''>请选择</option>");
			                $.each(version, function (idx, val) {
			                	ddl.append($("<option value='"+val.version+"'>" + val.version + "</option>"))
			                })
			            }
			        })
				}
    function saveFun(){
    	var rwt=$('#realworktype').val();
    	var fo=$('#editForm');
    	if(rwt==1)
    	fo.validate({
			rules : {
				name : {
					required : true,
					maxlength:100
				},address : {
					required : true,
					maxlength:100
				},principle : {
					required : true,
					maxlength:100
				},phone : {
					required : true,
					maxlength:100
				},bname : {
					required : true,
					maxlength:100
				},baddress : {
					required : true,
					maxlength:100
				},bphone : {
					required : true,
					mobile:100
				},identify : {
					required : true,
					cardNoCheck:true
				},brand : {
					required : true,
					maxlength:100
				},model : {
					required : true,
					maxlength:100
				},version : {
					required : true,
					maxlength:100
				},outcolor : {
					required : true,
					maxlength:100
				},incolor : {
					required : true,
					maxlength:100
				},transprice : {
					maxlength:11,
					numberOrSpace:true
				},plateprice : {
					maxlength:11,
					numberOrSpace:true
				},cinsurance : {
					maxlength:11,
					numberOrSpace:true
				},insurance : {
					maxlength:11,
					numberOrSpace:true
				},purchasetax : {
					maxlength:11,
					numberOrSpace:true
				},qualityprice : {
					maxlength:11,
					numberOrSpace:true
				},delayprice : {
					maxlength:11,
					numberOrSpace:true
				},decorateprice : {
					maxlength:11,
					numberOrSpace:true
				},saleprice : {
					required : true,
					maxlength:11,
					numberOrSpace:true
				},
//				downpay : {
//					required : true,
//					maxlength:11,
//					numberOrSpace:true
//				},
//				finance : {
//					required : true
//				},
				note : {
					maxlength:250
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
    	else if(rwt==2){
    		fo.validate({
    			rules : {
    				name : {
    					required : true,
    					maxlength:100
    				},address : {
    					required : true,
    					maxlength:100
    				},principle : {
    					required : true,
    					maxlength:100
    				},phone : {
    					required : true,
    					maxlength:100
    				},bname : {
    					required : true,
    					maxlength:100
    				},baddress : {
    					required : true,
    					maxlength:100
    				},companyname:{
    					required : true,
    					maxlength:100
    				},bphone : {
    					required : true,
    					mobile:100
    				},identify : {
    					required : true,
    					cardNoCheck:true
    				},brand : {
    					required : true,
    					maxlength:100
    				},model : {
    					required : true,
    					maxlength:100
    				},version : {
    					required : true,
    					maxlength:100
    				},outcolor : {
    					required : true,
    					maxlength:100
    				},incolor : {
    					required : true,
    					maxlength:100
    				},transprice : {
    					maxlength:11,
    					numberOrSpace:true
    				},plateprice : {
    					maxlength:11,
    					numberOrSpace:true
    				},cinsurance : {
    					maxlength:11,
    					numberOrSpace:true
    				},insurance : {
    					maxlength:11,
    					numberOrSpace:true
    				},purchasetax : {
    					maxlength:11,
    					numberOrSpace:true
    				},qualityprice : {
    					maxlength:11,
    					numberOrSpace:true
    				},delayprice : {
    					maxlength:11,
    					numberOrSpace:true
    				},decorateprice : {
    					maxlength:11,
    					numberOrSpace:true
    				},saleprice : {
    					required : true,
    					maxlength:11,
    					numberOrSpace:true
    				},
//    				downpay : {
//    					required : true,
//    					maxlength:11,
//    					numberOrSpace:true
//    				},
//    				finance : {
//    					required : true
//    				},
    				note : {
    					maxlength:250
    				}
    			},
    			errorPlacement : function(error, element) {
    				var p = element.parent();
    				error.appendTo(p);
    			},
    			validClass : "success",
    			onkeyup : false
    		});
    	}
    	if(fo.valid()){var fin=$(":radio[name='finance']:checked");
    	if(fin.size()==0){alert("请确定是否金融购车（单位客户只能全款购车）");return;}
    	var dp=$("[name='downpay']"),reg=/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/;
    	if(fin.val()==2&&!reg.test(dp.val())){alert("全款购车时定金金额必填且格式必须符合要求");dp.focus();return;}
    /*	var file1=$("#file-01").prop("files").length;
		if(file1==0){alert("请上传车辆销售合同");return;}
		var file2=$("#file-02").prop("files").length;
		if(file2==0){alert("请上传报价单");return;}
		var file3=$("#file-03").prop("files").length;
		if(file3==0&&fin.val()==2){alert("金融购车为否时必须上传定金POS单");return;}*/
fo.submit();}else{
	alert("请检查并完善不符合要求的字段，如页面太长，请上滑以查看报错详情！");
}
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
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
  //绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	$("#backBtn").bind("click", back);
//	$(function () {
    initFileInput("file-01");
    initFileInput("file-02");
    initFileInput("file-03");
//    })
});
//var b = function() {
//    var b = document.documentElement.clientHeight || document.body.clientHeight;
//    $("body").css("zoom", b / 900)
//};
//window.onload = function() {
//    b()
//};
//$(window).resize(function() {
//    b()
//});