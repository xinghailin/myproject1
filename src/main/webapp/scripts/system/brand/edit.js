define(function(require) {
    require('../../base/validation-proxy');
    require('art-dialog')($);require('jquery-css');
	$(function() {
		$("#editBtn").bind("click", edit);
		$("#resetBtn").bind("click", reset);
	});
    
	function edit() {
		if (validateForm()) {
			var oldvalue=$('#oldbrandName').val();
			var newvalue=$('#brandName').val();
			if(oldvalue==newvalue){window.close();return false;}
			var editUrl = $("#editUrl").val();
			$.ajax({
				type : "POST",
				url : editUrl + ".json",
				dataType : "json",
				data : $("#editForm").serialize(),
				async : false,
				success : function(response) {
					if (response.status==1) {
						$.dialog('保存成功', function(){
							refreshParent();
						});
					} else {
						$.dialog(response.msg, function(){});
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
				brandName : {
					required : true
				}
			},
			messages : {
				brandName : {
					required : "品牌名必填"
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
});