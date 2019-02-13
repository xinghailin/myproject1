define(function(require) {
	require('jquery-css');
    require('../../base/validation-proxy');
//	require('validationCSS');
//	require('validation')($);
	$(function() {
		$("#addBtn").bind("click", addRole);
		$("#closeBtn").bind("click", closeWindow);
		$("#resetBtn").bind("click",reset);
	});

	function addRole() {
		if (validateAddForm()) {
			var addUrl = $("#addUrl").val();

			$.ajax({
				type : "POST",
				url : addUrl + ".json",
				dataType : "json",
				data : $("#addForm").serialize(),
				async : false,
				success : function(response) {
					if (response.status) {
						alert('新增成功!');
						refreshParent();
					} else {
//						alert('新增失败!');
						alert("新增失败!原因："+response.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert('请稍后重试!');
				}
			});
		}
	}

	// 重置form
	function reset() {
		$("#addForm")[0].reset();
	}

	function refreshParent() {
		window.opener.location.href = window.opener.location.href;
		window.close();
	}
	
	function closeWindow(){
		window.close();
	}
	function validateAddForm() {
		$("#addForm").validate({
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

		return $("#addForm").valid();
	}
});