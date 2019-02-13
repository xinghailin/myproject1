define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#comeshopTime', null, null);
	require('../base/validation-proxy');
    function yesFun(){
    	if(!$('#shopId').val())
    		{$.dialog("您好，您的登录账号尚未关联具体门店，不支持该操作", function(){
    		});return;}
    	if(!$('#carId').val()){
    		$.dialog("请重新选择车辆", function(){
    		});return;}
    	if (validateAddForm()) {
    	$('#editForm').submit();}
}
    function reset() {       
    	$('#editForm')[0].reset();
	}
    function validateAddForm() {
		$("#editForm").validate({
			rules : {
				identify : {
					required : true
					,cardNoCheck:true
				},comeshopTime : {
					required : true,date:true
				}
				,name : {
					required : true,
					maxlength:50
				}				
				,phone : {
					required : true,
					mobile:true
				}
			},
			messages : {
				identify : {
					required : "必填"
					,cardNoCheck:"格式错误"
				},comeshopTime : {
					required : "必填",
					date:"格式错误"
				},name : {
					required : "必填",
					maxlength:50
				}				
				,phone : {
					required : "必填",
					mobile:"格式错误"
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
    function back(){location.href=$('#backUrl').val();}
	//绑定按钮事件
	$('#saveBtn').bind("click",yesFun);$('#resetBtn').bind("click",reset);$('#backBtn').bind("click",back);
//	if(!$('#shopId').val())
//	{
//	$('#saveBtn').css('display','none'); 
//	}
//	$(function() {
//		var msg=$('#hideMsg').val();
//		if(msg)$.dialog(msg, function(){});
//	});
});
