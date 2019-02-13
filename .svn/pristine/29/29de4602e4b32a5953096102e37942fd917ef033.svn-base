define(function(require) {
    require('../../base/validation-proxy');
    require('art-dialog')($);
    
	$(function() {
		$("#addBtn").bind("click", addData);
		$("#resetBtn").bind("click", reset);
	});
	function addData() {
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
				type : {
					required : true
				},
				dvalue : {
					required : true
				}
			},
			messages : {
				type : {
					required : "类型为空"
				},
				dvalue : {
					required : "值不能为空"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				if(element.is("#type")){
					  error.appendTo($('#type').parent().next());
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