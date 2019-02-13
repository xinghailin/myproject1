define(function(require) {
//	require('jquery-css');
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
				userName : {
					required : true
				},
				roleId : {
					required : true
				}
			},
			messages : {
				userName : {
					required : "用户名必须填写"
				},
				roleId : {
					required : "角色必须选择"
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