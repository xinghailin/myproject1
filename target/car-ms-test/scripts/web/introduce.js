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
		        var arr_chinese = [];
		        arr_chinese.push(UE.getEditor('editor_chinese').getContent());
		        $('#content_chinese').val(arr_chinese);
		        
		        var arr_english = [];
		        arr_english.push(UE.getEditor('editor_english').getContent());
		        $('#content_english').val(arr_english);
		        
		        var arr_spaish = [];
		        arr_spaish.push(UE.getEditor('editor_spaish').getContent());
		        $('#content_spaish').val(arr_spaish);
		        if($('#content_chinese').val().trim()==''){
		        	alert("请输入公司内容介绍中文");
		        	return false;
		        }
		        if($('#content_english').val().trim()==''){
		        	alert("请输入公司内容介绍英文");
		        	return false;
		        }
		        if($('#content_spaish').val().trim()==''){
		        	alert("请输入公司内容介绍西班牙语");
		        	return false;
		        }
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
					window.location.href=$('#searchUrl').val();
				}
			}).error(function() {
				msg = "系统内部异常";
				alert(msg);
			});
	}

	// 绑定新增按钮事件
	$('#saveBtn').bind("click", saveFun);
	// 重置
	function reset() {
		$("#editForm")[0].reset();
	}
	$("#resetBtn").bind("click", reset);
	/*$(function() {
		var $msg = $('#hideMsg');
		if ($msg.val())
			$.dialog($msg.val(), function() {
			});
	})*/
});
function imagePreview(obj, imgObj) {
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#' + imgObj).attr('src', src);
}

