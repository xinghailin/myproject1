define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	  function yesFun(){
		  $('#status').val(2);
		  saveFun();
	  }
	  function noFun(){
		   if (!$('#nopassreason').val()) {
			  alert("请填写不通过原因");
			  return;
		   }
		$('#status').val(3);
	    saveFun();
	 }
	    function backFun(){
	    	window.history.go(-1);
	    }
	    
	    
	    function saveFun(status){
	    	var url = $('#checkintomethodUrl').val()
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
	
	
	//绑定新增按钮事件
	$('#yesBtn').bind("click",yesFun);
	$('#noBtn').bind("click",noFun);
	$('#backBtn').bind("click",backFun);

});
