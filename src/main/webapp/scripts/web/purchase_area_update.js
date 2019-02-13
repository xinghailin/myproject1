define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	$('img').bigic();
	require('../base/validation-proxy');
	var datepickerUtil = require('../base/datepicker-util');
	var $form;
	var $check = $('#checkUrl').val();
	function saveFun() {
		$form = $('#editForm');
		
		$form.validate({
			rules : {
				content_chinese : {
					required : true,
					maxlength : 50
				},
				content_english : {
					required : true,
					maxlength : 50
				},
				content_spaish : {
					required : true,
					maxlength : 50
				},
				
				title_chinese : {
					required : true,
					maxlength : 50
				},
				title_english : {
					required : true,
					maxlength : 50
				},
				title_spaish : {
					required : true,
					maxlength : 50
				}/*,
				title_2_chinese : {
					required : true,
					maxlength : 50
				},
				title_2_english : {
					required : true,
					maxlength : 50
				},
				title_2_spaish : {
					required : true,
					maxlength : 50
				}*/
				
			},
			messages : {
				content_chinese : {
					required : "必填",
					maxlength : "输入过长"
				},
				content_english : {
					required : "必填",
					maxlength : "输入过长"
				},
				content_spaish : {
					required : "必填",
					maxlength : "输入过长"
				},
				
				
				title_chinese : {
					required : "必填",
					maxlength : "输入过长"
				},
				title_english : {
					required : "必填",
					maxlength : "输入过长"
				},
				title_spaish : {
					required : "必填",
					maxlength : "输入过长"
				}/*,
				
				title_2_chinese : {
					required : "必填",
					maxlength : "输入过长"
				},
				title_2_english : {
					required : "必填",
					maxlength : "输入过长"
				},
				title_2_spaish : {
					required : "必填",
					maxlength : "输入过长"
				}*/
				
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		
		if ($form.valid()) {
			var queryUrl = $('#updateUrl').val(); 
			$.ajax(queryUrl, {
				async : false,
				type : 'POST',
				dataType : 'json',
				data : $('#editForm').serialize(),
			}).success(function(data) {
				msg = data.result;
				alert(msg);
				if(data.rescode==1){
					window.location.href=$('#nextUrl').val();
				}
			}).error(function() {
				msg = "系统内部异常";
				alert(msg);
			});
		}
	}

	// 绑定新增按钮事件
	$('#saveBtn').bind("click", saveFun);
	$('#backBtn').bind("click",backFun);
	// 重置
	function reset() {
		$("#editForm")[0].reset();
	}
	$("#resetBtn").bind("click", reset);
	
    function backFun(){
    	window.history.go(-1);
    }
	
	
	
	
	
	

	
});


