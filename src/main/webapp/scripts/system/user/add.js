define(function(require) {
//	require('jquery-css');
    require('../../base/validation-proxy');
    require('art-dialog')($);
	$(function() {
		$("#addBtn").bind("click", addData);
		$("#resetBtn").bind("click", reset);
	});
	function addData() {
		if (validateAddForm()) {
			var u=$('#userName'),w=$('#loginPassword')
			u.val($.trim(u.val()));
			w.val($.trim(w.val()));
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
						$.dialog('新增失败', function(){});
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
				userName : {
					required : true
				},
				loginPassword : {
					required : true,
					minlength:6
				},
				roleId : {
					required : true
				}
			},
			messages : {
				userName : {
					required : "用户名必须填写"
				},
				loginPassword : {
					required : "登录密码必须填写",
					minlength:"密码不得少于6位"
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
		return $("#addForm").valid();
	}
});