define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	require('../base/validation-proxy');
	function validateAddForm() {
		form.validate({
			rules : {
				finalpay : {
					required : true,maxlength:11,
					amountFmtCheck:true
				},transcost : {
					maxlength:11,
					amount:true
				}
			},
			errorPlacement : function(error, element) {
				element.parent().append(error);
			},
			validClass : "success",
			onkeyup : false
		});
		var bl=form.valid();
		return bl;
	}
	function saveFun() {
		if(validateAddForm()){
		$.ajax(form.attr('action'), {
			type : 'POST',
			dataType : 'json',
			data : form.serialize()
		}).done(function(response) {
			if (response.status) {
//				$.dialog('提交成功！', function(){window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();})//返回之前的当前页
				alert('提交成功！');window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();
			} else {
				$.dialog(response.msg, function(){})//提示错误信息
			}
		});}
	}
	function back(){
		window.location.href=$('#indexUrl').val()+"?currpage="+$('#currpage').val();
	}
	var form = $('#editForm');
	$('#saveBtn').bind("click",saveFun);
	$("#cancelBtn").bind("click", back);
});