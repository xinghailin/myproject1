define(function(require) {
	require('jquery-css');
    require('../base/validation-proxy.js');
    require('art-dialog')($);   
    
	$(function() {
		$("#aTagForForm").bind("click", updatePwd);
		$("#resetBtn").bind("click", reset);
	});
	
    //修改个人密码
	function updatePwd() {
		var flag=validateCommForm();
		if (flag) {
			var updateUrl = $("#actionUrl").val();
			$.ajax({
				type : "POST",
				url : updateUrl + ".json",
				dataType : "json",
				data : $("#updateForm").serialize(),
				async : false,
				success : function(response) {
					if (response.status) {
						$.dialog(response.message, function(){
							refreshParent();
						});
						
					} else {
						$.dialog(response.message, function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('请稍后尝试', function(){});
				}
			});
		}
	}
    
	
	// 重置form
	function reset() {
		$("#updateForm")[0].reset();
	}
    
	// 刷新当前页面
	function refreshParent() {
		location.href = location.href;
	}
	
	/**
	 * 表单校验
	 */
	function validateCommForm() {
		var validate =$("#updateForm").validate({
			rules : {
				name : {
					required : true
				},			
				password : {
					required : true,
					pwdCheck:true
				},
				confirmPassword : {
					required : true,
					equalTo:"#password"
				}
			},
			messages : {
				name : {
					required : "请输入原始密码"
				},
				password : {
					required : "请输入新密码" 
				},
				confirmPassword : {
					required : "请输入确认密码"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				 error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		var ret=$("#updateForm").valid();
		return ret;
	}

});

