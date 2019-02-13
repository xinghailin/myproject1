define(function(require) {
    require('../../base/validation-proxy');
    require('art-dialog')($);
	$(function() {
		$("#editBtn").bind("click", edit);
		$("#resetBtn").bind("click", reset);
	});
    
	function edit() {
		if (validateForm()) {
			var editUrl = $("#editUrl").val();
			$.ajax({
				type : "POST",
				url : editUrl + ".json",
				dataType : "json",
				data : $("#editForm").serialize(),
				async : false,
				success : function(response) {
					if (response.status) {
						$.dialog('保存成功', function(){
							refreshParent();
						});
					} else {
						$.dialog('保存失败', function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('请稍后重试!', function(){});
				}
			});
		}
	}
    
	// 重置form
	function reset() {
		$("#editForm")[0].reset();
	}
	
	function refreshParent() {
		window.opener.location.href = window.opener.location.href;
		window.close();
	}

	function validateForm() {
		$("#editForm").validate({
			rules : {
				type : {
					required : true
				},
				dvalue : {
					required : true
				}
			},
			messages : {
				type : {
					required : "类型为空"
				},
				dvalue: {
					required : "值为空"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				if(element.is("#type")){
					  error.appendTo($('#type').parent().parent());
				 }else{
					 error.appendTo(p);
				 }
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#editForm").valid();
	}
});