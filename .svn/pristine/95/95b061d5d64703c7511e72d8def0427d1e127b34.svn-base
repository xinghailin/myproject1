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
		id_organize_chinese=$('#id_organize_chinese').val();
		if(id_organize_chinese == '' || id_organize_chinese == undefined){
			var pic_organize_chinese = $("#pic_organize_chinese").prop("files").length;
			if (pic_organize_chinese == 0) {
				alert("请上传组织架构中文");
				return;
			}
			var pic_organize_english = $("#pic_organize_english").prop("files").length;
			if (pic_organize_english == 0) {
				alert("请上传组织架构英文");
				return;
			}
			var pic_organize_spaish = $("#pic_organize_spaish").prop("files").length;
			if (pic_organize_spaish == 0) {
				alert("请上传组织架构英文图西班牙语");
				return;
			}
			var pic_layout = $("#pic_layout").prop("files").length;
			if (pic_layout == 0) {
				alert("请上传中国布局");
				return;
			}
			var pic_brand_chinese = $("#pic_brand_chinese").prop("files").length;
			if (pic_brand_chinese == 0) {
				alert("请上传品牌介绍中文");
				return;
			}
			var pic_brand_english = $("#pic_brand_english").prop("files").length;
			if (pic_brand_english == 0) {
				alert("请上传品牌介绍英文");
				return;
			}
			var pic_brand_spaish = $("#pic_brand_spaish").prop("files").length;
			if (pic_brand_spaish == 0) {
				alert("请上传品牌介绍西班牙语");
				return;
			}
			var pic_global_dev = $("#pic_global_dev").prop("files").length;
			if (pic_global_dev == 0) {
				alert("请上传全球布局");
				return;
			}			
		}
	//	$form.submit();
		
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

