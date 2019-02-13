define(function(require) {
	'use strict';
	require('art-dialog')($);
	require('./base/validation-proxy');
//  require('./base/ajaxfileupload');
    
  //上传EXCEL文件
  function uploadExcel() {
     if(validateAddForm()){
//    	 var uploadUrl = $("#actionUrl").val() ;
//         $.ajaxFileUpload({
//             url : uploadUrl,
//             fileElementId:'excelFile',
//             type : 'POST',
//             dataType : 'json',
//             data:{
//          	    excelFile : $("#excelFile").val()//,
//          	    //accountId:$("#accountId").val()
//      	   },
//             success : function(data,status) {
//            	 if(data.status){
//            	 $.dialog(data.message, function(){});}
//            	 else
//            		 $.dialog(data.message, function(){});
//             },
//             error : function(data,status,e) {
////            	 console.log(data);console.log(status);console.log(e);
//            	 $.dialog("导入失败，请确认上传的文件内容合法", function(){});
//             }
//         });
    	 $("#fileuploadForm").submit();//alert(window.document.getElementById("hideiframe").getElementByTagName("body")[0].innerHTML);
//    	 alert(window.document.getElementByTagName("iframe")[0].document.body.innerHTML);
    	 setTimeout(notice,200);
//    	 $.dialog($(window.frames["hideiframe"].document).find("body").html(), function(){});
     }
  }
  function notice(){
	  var $bd=$(window.frames["hideiframe"].document).find("body");
		 var co=$bd.html();
		 if(co){$.dialog(co, function(){$bd.html('')});}
	 else setTimeout(notice,200);
  }
	/**
	 * 表单校验
	 */
	function validateAddForm() {
		$("#fileuploadForm").validate({
			rules : {
//				userType : {
//					required : true
//				},
				file1 :{
					required : true
				}
			},
			messages : {
//				userType : {
//					required : "请选择会员类型"
//				},
				file1 :{
					required : "请选择文件"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
//				if(element.is("input[name=userType]")){
//					  error.appendTo(p.parent());
//				 }else{
					  error.appendTo(p);
//				 }
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#fileuploadForm").valid();
	}
	function validateAddForm1() {
		$("#fileuploadForm1").validate({
			rules : {
				file2 :{
					required : true
				}
			},
			messages : {
				file2 :{
					required : "请选择文件"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
					  error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#fileuploadForm1").valid();
	}
	function uploadExcel1() {
	     if(validateAddForm1()){
	    	 $("#fileuploadForm1").submit();
	    	 setTimeout(notice1,200);
	     }
	  }
	function notice1(){
		 var co= $(window.frames["hideiframe1"].document).find("body").html();
		 if(co){$.dialog(co, function(){$(window.frames["hideiframe1"].document).find("body").html('')});}
		 else setTimeout(notice1,200);
	  }
//	$(function() {
	$("#submitButton").bind("click", uploadExcel);$("#submitButton1").bind("click", uploadExcel1);
//	});
});

