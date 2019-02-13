define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	  function yesFun(){
		  $('#status2').val(5);
		  saveFun();
	  }
	  function noFun(){
		   if (!$('#reason2').val()) {
			  alert("请填写不通过理由");
			  return;
		   }
		$('#status2').val(4);
	    saveFun();
	 }
	  function nopassFun(){
		   if (!$('#reason2').val()) {
			  alert("请填写不通过理由");
			  return;
		   }
		$('#status2').val(6);
	    saveFun();
	 }	  
	  
	  
	  
	    function backFun(){
	    	window.history.go(-1);
	    }
	    
	    
	    function saveFun(status){
	    	var url = $('#financecheckUrl').val()
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
	$('#nopassBtn').bind("click",nopassFun);
	$('#backBtn').bind("click",backFun);

});
