define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
    function yesFun(){
//    	$.dialog("确定通过？", function(){
//			$('#EAA').hide();
//			$('#viewList').show();
//			load(1,PAGE_SIZE);
//		});
    	$('#hidePass').val(1);
    	var $form=$('#editForm');
    	$.ajax($form.attr('action'), {
			type : 'POST',
			dataType : 'json',
			data : $form.serialize()
		}).done(function(response) {
			if (response.status=='1') {
			    	alert(response.message)
			    	backFun();
			} else {
				alert(response.message)
				$('#reason').val(response.message);
			}
		});
//    	$('#hidePass').val(1);
//    	$('#editForm').submit();
}
    function noFun(){
    	if(!$('#reason').val()){
    	$.dialog("请填写审核不通过的理由！", function(){
		});return;}
    	$('#hidePass').val(2);
//		$('#editForm').submit();
    	var $form=$('#editForm');
    	$.ajax($form.attr('action'), {
			type : 'POST',
			dataType : 'json',
			data : $form.serialize()
		}).done(function(response) {
			if (response.status=='1') {
			    	alert(response.message);
			    	backFun();
			} else {
				alert("提示："+response.message);
		    	backFun();
			}
		});
}
    function backFun(){
//    	window.history.go(-1);
    	window.location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val();
    }
//    function saveShop(){
//		if (validateAddForm()) {
//			var addUrl = $("#createUrl").val();
//			$.ajax({
//				type : "POST",
//				url : addUrl + ".json",
//				dataType : "json",
//				data : $("#editForm1").serialize(),
//				async : false,
//				success : function(response) {
//					if (response.status) {
//						var msg;
//						if($('#hideId').val())msg="修改成功！";
//						else msg="新增成功！";
//						$.dialog(msg, function(){
////							refreshParent();
//							$('#EAA').hide();
//							$('#viewList').show();
//							load(1,PAGE_SIZE);
//						});
//					} else {
//						$.dialog(response.message, function(){});
//					}
//				},
//				error : function(XMLHttpRequest, textStatus, errorThrown) {
//					$.dialog('请稍后重试!', function(){});
//				}
//			});
//		}
//	}
    $('img').bigic();
	//绑定新增按钮事件
	$('#yesBtn').bind("click",yesFun);$('#noBtn').bind("click",noFun);$('#backBtn').bind("click",backFun);
});
