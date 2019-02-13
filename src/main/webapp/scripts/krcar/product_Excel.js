define(function(require) {
//	'use strict';
//	require('art-dialog')($);
//	require('./base/validation-proxy');
//  require('./base/ajaxfileupload');
  //上传EXCEL文件
  function uploadExcel() {
     if(validateAddForm()){
    	 $("#fileuploadForm").submit();//alert(window.document.getElementById("hideiframe").getElementByTagName("body")[0].innerHTML);
//    	 alert(window.document.getElementByTagName("iframe")[0].document.body.innerHTML);
//    	 setTimeout(notice,200);
//    	 $.dialog($(window.frames["hideiframe"].document).find("body").html(), function(){});
     }
  }
  function notice(){
  var $bd=$(window.frames["hideiframe"].document).find("body");
	 var co=$bd.html();
	 if(co){//$.dialog(co, function(){$bd.html('')});
	 alert(co)}
	 else setTimeout(notice,200);
  }
	/**
	 * 表单校验
	 */
	function validateAddForm() {
		var file=$("#excelFile").prop('files').length;
		if(file==0){alert("请选择Excel文件！");return false;}return true;
	}
	function uploadExcel1() {
	    /* if(validateAddForm1()){*/
//		alert(123456)
	    	 $("#fileuploadForm1").submit();
	    	 setTimeout(notice1,200);//两百毫秒执行
	  }
	function notice1(){
		 var co= $(window.frames["hideiframe1"].document).find("body").html();
		 if(co){$.dialog(co, 
				 function(){
			 $(window.frames["hideiframe1"].document).find("body").html('')
			 });
		 }
		 else setTimeout(notice1,200);
	  }
//	$(function() {
	$("#submitButton").bind("click", uploadExcel);
//	});
});