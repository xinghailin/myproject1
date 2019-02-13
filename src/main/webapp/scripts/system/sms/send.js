define(function(require) {
    require('../../base/validation-proxy');
    require('art-dialog')($);
    
	$(function() {
		$("#sendBtn").bind("click", addData);
	});
	function addData() {
		if (validateAddForm()) {
			var addUrl = $("#sendUrl").val();
			$.ajax({
				type : "POST",
				url : addUrl + ".json",
				dataType : "json",
				data : $("#addForm").serialize(),
				async : false,
				success : function(response) {
					$.dialog(response.message, function(){});
					if (response.status == 1) {
						location.href = location.href;
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
		$("#addForm")[0].reset();
	}
	
    /**
     * 关闭窗口
     */
	function refreshParent() {
		window.opener.location.href = window.opener.location.href;
		window.close();
	}
    
	function validateAddForm() {
		$("#addForm").validate({
			rules : {
				mobileStr : {
					required : true
				},
				content : {
					required : true
				}
			},
			messages : {
				mobileStr : {
					required : "请输入手机号"
				},
				content : {
					required : "请输入短信内容"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#addForm").valid();
	}
});