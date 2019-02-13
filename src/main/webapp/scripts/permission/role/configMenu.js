define(function(require) {
	
	$(function() {
		$("#resetBtn").bind("click", resetForm);
		$("#submitBtn").bind("click", submit);
		$("#closeBtn").bind("click",closeDialog);
	});
	
	function submit() {
		$("input[type='checkbox'").each(function () {
	        if ($(this).prop("indeterminate")) {
	        	 $(this).prop("checked",true);
	        }
		});
		var configUrl = $("#configUrl").val();
		$.ajax({
			type : "POST",
			url : configUrl + ".json",
			dataType : "json",
			data : $("#configForm").serialize(),
			async : false,
			success : function(response) {
				if (response.status) {
					alert('设置成功');
					window.close();
				} else {
					alert('设置失败');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('请稍后重试!');
			}
		});
	}
	
	//关闭子窗口
	function closeDialog(){
		window.close();
	}
	
	
	function resetForm(){
		$("#configForm").reset();
	}
});


function checkAll(parentId){
	 $("input[parentId='"+parentId+"'").each(function () {
        if ($(this).prop("checked")) {
             $(this).prop("checked",false);
        }
        else {
            $(this).prop("checked",true);
        }
     });
}


function checkParent(parentId){
	 if($("#menuItems"+parentId).prop("indeterminate")){
		 $("#menuItems"+parentId).prop("indeterminate",false);
	 }
	 if($("#menuItems"+parentId).prop("checked")){
		 $("#menuItems"+parentId).prop("checked",false);
	 }
	 $("input[parentId='"+parentId+"'").each(function () {
        if ($(this).prop("checked")) {
        	 $("#menuItems"+parentId).prop("indeterminate",true);
        }
	 });
}
