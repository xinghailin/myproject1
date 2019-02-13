define(function(require) {
	require('jquery-css');
    require('../base/validation-proxy');
//    require('art-dialog')($);
    var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTriggerSimple('#shopFirstCreatTime', null, null);
	function addData() {
		if (validateAddForm()) {
			var len=$("input[name='shopId']:checked").length;
			if(!len){alert("请选择门店");return false;}
			var addUrl = $("#addUrl").val();
			$.ajax({
				type : "POST",
				url : addUrl,
				data : $("#addForm").serialize(),
				async : false,
				success : function(response) {
					if (response.status) {
//						$.dialog('新增成功！', function(){
//							refreshParent();
//						});
						alert('新增成功！');refreshParent();
					} else {
//						$.dialog('新增失败', function(){});
						alert('新增失败！');
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
//					$.dialog(jqXHR.responseText, function(){});
					alert(jqXHR.responseText);
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
		window.close();
		window.opener.searchclick(false);
//		window.opener.location.href = window.opener.location.href;
	}
    
	function validateAddForm() {
		$("#addForm").validate({
			rules : {
				name : {
					required : true
				},
				totalmoney : {
					required : true,
					amount:true
				},bigScale:{
					amount:true
				}
			},
			messages : {
				name : {
					required : "组名必填"
				},
				totalmoney : {
					required : "总额度必填",
					amount:"金额格式错误"
				},bigScale:{
					amount:"金额格式错误"
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
	$("#addBtn").bind("click", addData);
	$("#resetBtn").bind("click", reset);
});