define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	
    function backFun(){
    	window.history.go(-1);
    }
    

	$('#backBtn').bind("click", backFun);
	$('#saveBtn').bind("click", passFun);
	function backFun() {
	//	window.history.go(-1);
		location.href=$('#backUrl').val()
	}
	

  function passFun() {
	   // $('#saveBtn').attr("disabled", true);
	    var fileName = $.trim($("#backcheckfile").val());
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
