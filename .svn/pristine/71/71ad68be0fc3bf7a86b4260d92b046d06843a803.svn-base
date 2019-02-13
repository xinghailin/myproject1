define(function(require) {
    require('../../base/validation-proxy');
//	require('validationCSS');
//	require('validation')($);
    require('art-dialog')($);
	$(function() {
		$("#submitBtn").bind("click", edit);
		$("#resetBtn").bind("click",reset);
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
						$.dialog('修改成功', function(){
							refreshParent();
						});
					} else {
						$.dialog(response.message, function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('请稍后重试！', function(){});
				}
			});
		}
	}

	function refreshParent() {
		window.opener.location.href = window.opener.location.href;
		window.close();
	}

	function validateForm() {
		$("#editForm").validate({
			rules : {
				name : {
					required : true
				},
				uri: {
					required : true
				}
			},
			messages : {
                name : {
					required : "资源名称为空"
				},
				uri: {
					required : "URI不能为空"
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
	
	//重置按钮
	function reset(){
		$("#editForm")[0].reset();
	}
});