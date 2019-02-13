define(function(require, exports, module) {	
	require('jquery-css');
	require('../base/validation-proxy');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	$(function() {					
		//确定按钮事件
		$("#btnOk").bind("click",approveOk);
		
		//绑定返回上一页按钮事件
		//$("#backBtn").bind("click",goBack);
		
	});
	
	//确定按钮事件
	function approveOk(){
		//表单提交
		$.ajax({
			url : $("#taskUrl").val() + ".json",
			type : "post",
			data :$("#editForm").serialize(),
			dataType : "json",
			async : false,
			success : function(data){
//				alert(data.message);
				if(data.status == 1){
					$.dialog(data.message, function(){
						location.href = $("#taskListUrl").val();});
				}
			},
			error : function(){
				alert("网络异常，请稍后尝试！");
			}
		});
	}
	
	/**
	 * 返回上一页
	 */
	function goBack(){
		location.href = $("#taskListUrl").val();
	}
	$('img').bigic();
});
