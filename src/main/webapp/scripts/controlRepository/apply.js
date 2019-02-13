define(function(require, exports, module) {	
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	require('../base/validation-proxy');
	var PAGE_SIZE = 10;

	$(function() {	
		
		//确定按钮事件
		$("#addBtn").bind("click",submitForm);
		
		//绑定返回上一页按钮事件
		//$("#backBtn").bind("click",goBack);
//		if(!$('#shop_id').val())
//		{
//		$('#addBtn').css('display','none'); 
//		}
	});
	
	//表单提交
	function submitForm() { 
//		if($("#remark").val().length == 0){
//			alert("请填写移库原因");
//			return;
//		}
		var $shopId=$('#shop_id').val();
		if(!$shopId)
		{$.dialog("您好，您的登录账号尚未关联具体门店，不支持该操作", function(){
		});return;}
		if (validateAddForm()) {
		$.ajax({
			url : $("#addUrl").val() + ".json",
			type : "post",
			data : {
				carId : $("#cId").val(),
				remark : $("#remark").val(),
				shopId : $shopId
				},
			dataType : "json",
			async : false,
			success : function(data){
//				alert(data.message);
				if(data.status==1){
					$.dialog(data.message, function(){
						location.href = $("#listUrl").val()+"?currpage="+$("#currpage").val();
					});return;}
				else if(data.status == '0'){
					$.dialog(data.message, function(){})
				}
			},
			error : function(){
				alert("网络异常，请稍后尝试！");
			}
		});}
	}
	function validateAddForm() {
		$("#editForm").validate({
			rules : {
				remark : {
					required : true,
					maxlength:500
				}
			},
			messages : {
				remark : {
					required : "必填",
					maxlength:"最多输入500字"
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
	
	/**
	 * 返回上一页
	 */
	function goBack(){
		location.href = $("#listUrl").val()+"?currpage="+$("#currpage").val();
	}
	$('img').bigic();	
});
