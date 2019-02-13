define(function(require) {
    require('../../base/validation-proxy');
//	require('validationCSS');
//	require('validation')($);
    require('art-dialog')($);
	$(function() {
		$("#addBtn").bind("click", addRole);
		$("#resetBtn").bind("click", reset);
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
						$.dialog('新增成功', function(){
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

	// 重置form
	function reset() {
		 $("#addForm")[0].reset();
	}

	function refreshParent() {
		window.opener.location.href = window.opener.location.href;
		window.close();
	}

	function validateAddForm() {
		$("#addForm").validate({
			rules : {
				name : {
					required : true
				},
				uri : {
					required : true
				},
				appId : {
					required : true
				},
				status : {
					required : true
				}
			},
			messages : {
				name : {
					required : "资源名称为空"
				},
				uri : {
					required : "资源URL为空"
				},
				appId : {
					required : "请选择所属平台"
				},
				status : {
					required : "请选择状态"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				if(element.is("#appId")){
					  error.appendTo($('#appId').parent().next());
				 }else if(element.is("#status")){
					  error.appendTo($('#status').parent().next());
				 }else{
					 error.appendTo(p);
				 }
				
			},
			validClass : "success",
			onkeyup : false
		});

		return $("#addForm").valid();
	}
});