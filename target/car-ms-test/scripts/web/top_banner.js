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
		id_introduce=$('#id_introduce').val();
		if(id_introduce == '' || id_introduce == undefined){
			var pic_introduce = $("#pic_introduce").prop("files").length;
			if (pic_introduce == 0) {
				alert("请上传公司介绍");
				return;
			}
			var pic_organize = $("#pic_organize").prop("files").length;
			if (pic_organize == 0) {
				alert("请上传组织架构");
				return;
			}
			var pic_layout = $("#pic_layout").prop("files").length;
			if (pic_layout == 0) {
				alert("请上传中国布局");
				return;
			}
			var pic_brand = $("#pic_brand").prop("files").length;
			if (pic_brand == 0) {
				alert("请上传品牌介绍");
				return;
			}
			var pic_global_dev = $("#pic_global_dev").prop("files").length;
			if (pic_global_dev == 0) {
				alert("请上传全球开拓");
				return;
			}
			var pic_global_model = $("#pic_global_model").prop("files").length;
			if (pic_global_model == 0) {
				alert("请上传全球车型介绍");
				return;
			}
		}
		//$form.submit();
		
		var form = new FormData(document.getElementById("editForm"));
		var queryurl = $('#submitUrl').val();
       $.ajax({
          url:queryurl,
          type:"post",
          data:form,
          processData:false,
          contentType:false,
          success:function(data){
             alert("保存成功了。");
             location.href = $("#nextUrl").val();
          },
          error:function(e){
              alert("错误！！");
          }
      });        
		
	}

	// 绑定新增按钮事件
	$('#saveBtn').bind("click", saveFun);
	// 重置
	function reset() {
		$("#editForm")[0].reset();
	}
	$("#resetBtn").bind("click", reset);
});
function imagePreview(obj, imgObj) {
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#' + imgObj).attr('src', src);
}

