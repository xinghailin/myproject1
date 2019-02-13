define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/validation-proxy');
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	
	require('../base/ajaxfileupload');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;	
	function imagePreview(obj,imgObj){
		var f = obj[0];
		var src = window.URL.createObjectURL(f);
		alert(src);
		$('#'+imgObj).attr('src',src) ;
//		window.URL.revokeObjectURL(src);
	}
    function yesFun(){
    	if (validateAddForm()) {
    		//销售价不小于最低价
//    		var $lowprice=$('#sellerprice').val();
    		/*if($lowprice){//如果有值
    			var $salePrice=$('#salePrice').val();
    			if($salePrice){//如果有值
    				if(parseFloat($lowprice)>parseFloat($salePrice)){$.dialog("车辆销售价不得小于最低销售价！", function(){
    	    		});return false;}
    			}
    		}*/
    		//定金不得大于销售价
    		var $salePrice=$('#salePrice').val();var downpay=$('#downpay').val();
			if($salePrice){//如果有值
				if(downpay){//如果有值
				if(parseFloat(downpay)>parseFloat($salePrice)){$.dialog("定金金额不得大于车辆销售价！", function(){
	    		});return false;}}
				
			}
			else if(downpay){
				$.dialog("定金金额已填写的情况下，车辆销售价必填！", function(){
	    		});return false;}
			
    		var $form=$('#editForm');
    		$form.submit();//$('form').attr('action')
    		setTimeout(notice,200);
//    		$.ajax($form.attr('action')+".json", {
//    			type : 'POST',
//    			dataType : 'json',
//    			data : $form.serialize()
//    		}).done(function(response) {
//    			if (response.status=='1') {
//    				$.dialog("提交审核成功！", function(){location.href=$('#mainUrl').val();});
//    			} else {
//    				$.dialog(response.message, function(){});
//    			}
//    		})}
    	}}
    function notice(){
    	  var $bd=$(window.frames["hideiframe"].document).find("body");
    		 var co=$bd.html();
    		 if(co){$.dialog(co, function(){
//    			 if(co.indexOf('成功')>-1){
    			 location.href=$("#mainUrl").val()+"?currpage="+$('#currpage').val();
    			 }
//    		 }
    		 );
    		 }
    		 else setTimeout(notice,200);
    	  }
//  //视频图片上传
//	function videoUploadPic(){		
//		var uploadUrl = $("#videoUploadUrl").val();
//		$.ajaxFileUpload({
//			url : uploadUrl,
//			fileElementId : 'videoFile',
//			type : 'POST',
//			dataType : 'text',
//			data : {},
//			success : function(data) {
//				alert(data.message);
//				if (data.status == 1) {	
//					$("#videoPic").val(data.picPath);								
//				}
//			},
//			error : function(XMLHttpRequest, textStatus,
//					errorThrown) {
//				alert("服务异常，请稍后尝试");
//			}
//		});
//	}
//    
    function validateAddForm() {
		$("#editForm").validate({
			rules : {
				downpay : {required : true,
					numberOrSpace : true
				}
		,salePrice : {
			required : true,
			numberOrSpace : true
				}
		,insurePrice : {
			numberOrSpace : true
				}
		,buyTax : {
			numberOrSpace : true
				}
		,cardPrice : {
			numberOrSpace : true
				}
		,qualityguarPrice : {
			numberOrSpace : true
				}
		,delayguarPrice : {
			numberOrSpace : true
				}
		,decoratePrice : {
			numberOrSpace : true
				}
			},iden5 : {
				required : true
			},
			messages : {
				downpay : {required : "必填",
					numberOrSpace : "格式错误"
				}
			,salePrice : {
				required : "必填",
				numberOrSpace : "格式错误"
				}
			,insurePrice : {
				numberOrSpace : "格式错误"
					}
			,buyTax : {
				numberOrSpace : "格式错误"
					}
			,cardPrice : {
				numberOrSpace : "格式错误"
					}
			,qualityguarPrice : {
				numberOrSpace : "格式错误"
					}
			,delayguarPrice : {
				numberOrSpace : "格式错误"
					}
			,decoratePrice : {
				numberOrSpace : "格式错误"
					}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#editForm").valid();
	}
    function back() {       
    	location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val();
	
	}
    function showAddForm() {
    	
    	location.href= $("#addUrl").val();
		showDialogue(addUrl, 600, 300);
	}
	//绑定按钮事件
    $("#addBtn").bind("click", showAddForm);
	$('#saveBtn').bind("click",yesFun);$('#backBtn').bind("click",back);
	$('img').bigic();
});
function check(key,id){//var tem='"'+key+'"';
	var t=$(key);//alert(key);alert(t instanceof $);console.log(t);alert(this);
	if(document.getElementById(id).checked){t.removeAttr("readonly");}
	else {t.attr("readonly","readonly");t.val('');}
}
function imagePreview(obj,imgObj){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	alert(src);
	$('#'+imgObj).attr('src',src) ;
//	window.URL.revokeObjectURL(src);
}
