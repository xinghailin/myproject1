define(function(require, exports, module) {	
	require('art-dialog')($);
	require('jquery-css');
//	require('../base/validation-proxy');
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	$(function() {	
		
		//绑定单选按钮事件
		$("input[type='radio']").bind("click",function(){
			isApprove($(this).val());
		});
		//确定按钮事件
		$("#btnOk").bind("click",approveOk);
		
		//绑定返回上一页按钮事件
		//$("#backBtn").bind("click",goBack);
		
	});
	
	//单选按钮事件
	function isApprove(type){
		if(type == "1"){//选择通过
			if($("#noApprove").is(":visible")){
				$("#noApprove").css("display","none");
				$("#reason").val("");
			}
		}else{//不通过
			if(!$("#noApprove").is(":visible")){
				$("#noApprove").css("display","block");
			}
		}
	}
	
	//确定按钮事件
	function approveOk(){
		//验证单选框是否选择
		if($("input[type='radio']:checked").length == 0){
//			alert("请选择操作类型！");
			{$.dialog("请选择操作类型！", function(){
			});return;}
//			return;
		}
		//如果单选框选择不通过，验证原因是否填写
		if($("input[type='radio']:checked").val() == "0"){
			if($("#reason").val().length == 0){
//				alert("请填写不通过原因");
				$.dialog("请填写审核不通过的原因！", function(){
				});return;}
//				return;
//			}
		}
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
