define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	
    function backFun(){
    	window.history.go(-1);
    }
    

	$('#backBtn').bind("click", backFun);
	$('#saveBtn').bind("click", sedMsg);
	$('#noPassBtn').bind("click", noPassFun);
	$('#sealBtn').bind("click", passFun);

	function backFun() {
	//	window.history.go(-1);
		location.href=$('#backUrl').val()
	}
	
	  function sedMsg() {
		    $('#saveBtn').attr("disabled", true);
			var url = $('#getPhoneCodeUrl').val()
			$.ajax(url, {
				type : 'POST',
				dataType : 'json',
			}).done(function(response) {
				if (response.rescode == '1') {
					alert(response.result);
					 $("#phone_code").attr("style",{"display":"block"});
					$('#saveBtn').attr("disabled", false);
				} else {
					alert("提示：" + response.result);
					$('#saveBtn').attr("disabled", false);
				}
				
			});
		 
		  

		}
  function passFun() {
	    $('#sealBtn').attr("disabled", true);
	    $(".mask").show();
		$('#sealstatus').val(3);
		var url = $('#updateUrl').val()
		var $form = $('#editForm');
		$.ajax(url, {
			type : 'POST',
			dataType : 'json',
			data : $form.serialize()
		}).done(function(response) {
			if (response.rescode == '1') {
				$(".mask").hide();
				alert(response.result);
				backFun();
			} else {
				$(".mask").hide();
				alert("提示：" + response.result);
				$('#sealBtn').attr("disabled", false);
			}
			
		});
	}
	function noPassFun() {
		var reason = $.trim($("#reason").val());
		if(reason == ""){
			alert("请填写不通过原因");
			return false;
		}				
		$('#sealstatus').val(2);
	    saveFun();
	}
	
    function saveFun(){
    	var url = $('#updateUrl').val()
    	var $form=$('#editForm');
    	$.ajax(url, {
			type : 'POST',
			dataType : 'json',
			data : $form.serialize()
		}).done(function(response) {
			if (response.rescode=='1') {
			    	alert(response.result);
			    	backFun();
			} else {
				alert("提示："+response.result);
		    	backFun();
			}
		});
    }

});
