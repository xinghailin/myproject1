define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	  function yesFun(){
		  if (!$('#remarks').val()) {
			  alert("请填写备注");
			  return;
		   }
		  $('#orderstatus').val(3);
		  saveFun();
	  }
	  function nopassFun(){
		   if (!$('#reason').val()) {
			  alert("请填写作废的原因");
			  return;
		   }
		$('#orderstatus').val(2);
	    saveFun();
	 }	  
	  
	  
	  
	    function backFun(){
	    	//window.history.go(-1);
	    	location.href=$('#backUrl').val();  
	    	
	    }
	    
	    
	    function saveFun(status){
	    	var url = $('#checkUrl').val();
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
	$('#nopassBtn').bind("click",nopassFun);
	$('#backBtn').bind("click",backFun);

});

function changeMonet() {
	var num = $("#num").val();
	var oldnum = $("#oldnum").val();
	var reg = new RegExp(/^\d+$/);
	if (!reg.test(num)) {
		alert("必须输入数字");
		$("#num").val(oldnum);
		return false;
	}
	myPackage();

}


  function myPackage(){
	
	 var packids ="";
	 $.each($('input[name="addPackage"]:checked'),function(){
		 packids += $(this).val()+",";
     });
	 // 赋值
	 if(packids){
		 $("#changedecoratepackage").val(packids.substring(0,packids.length-1));
	 }
	 var num = $("#num").val();
	 var id = $("#id").val();
	 var url = $('#sumMoneyUrl').val()
 	 $.ajax(url, {
		type : 'POST',
		dataType : 'json',
		data : {id:id,packids:packids,num:num}
	}).done(function(response) {
		if (response.rescode=='1') {
			$("#carprice").val(response.carprice);
			$("#ntotalprice").val(response.money);
			$("#downpay").val(response.downpay);
			$("#packagePrice").val(response.packagePrice);
		} else {
			alert("提示："+response.result);
		}
	});
	 
	 
  }
