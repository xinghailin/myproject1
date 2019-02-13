define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	
    function backFun(){
    	window.history.go(-1);
    }
    

	$('#backBtn').bind("click", backFun);

	function backFun() {
		window.history.go(-1);
	}
	$('#saveBtn').bind("click", saveFun);

	function saveFun() {
		var fileName = $.trim($("#contractfile").val());
		if(fileName == ""){
			alert("请上传合同文件");
			return false;
		}
		if(fileName.length>0 && fileName != ''){
			var idx = fileName.lastIndexOf(".");
			var suffix = fileName.substring(idx+1);
			if(suffix.toLowerCase() != 'pdf'){
				alert("文件必须为pdf格式");
				return false;
			}
		}		
		
		$form = $('#editForm');
		$form.submit();
	}

});
