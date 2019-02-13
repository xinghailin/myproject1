define(function(require) {
	require('jquery-css');
    require('../../base/validation-proxy');
    
    //没有validationCSS,注释掉
//	require('validationCSS');
//	require('validation')($);
    
	$(function() {
		$("#submitBtn").bind("click", submit);
		$("#resetBtn").bind("click",reset);
	});

	function submit() {
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
						alert('保存成功!');
						refreshParent();
					} else {
						alert('保存失败!原因：'+response.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert('请稍后重试!');
				}
			});
		}
	}

	function refreshParent() {
		window.opener.location.href = window.opener.location.href;
		window.close();
	}
	
	function reset(){
		$("#editForm")[0].reset();
	}
    
	function validateForm() {
		$("#editForm").validate({
			rules : {
				name : {
					required : true,
					roleNameFormatCheck : true
				},
				description : {
					required : true
				}
			},
			messages : {
				name : {
					required : "必填",
					roleNameFormatCheck : "格式错误"
				},
				description : {
					required : "必填"
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