define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	 
	    function backFun(){
	    	window.history.go(-1);
	    }
	    
	    
	    function saveFun(status){
	    	
	    	
	    	
	    	 var reg=/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/;
	         var price=$('#price').val();
	         var monads=$("#monads").val();
	         if (!reg.test(price)) {
	        	 alert(price);
	      	 alert("批发价格式不正确!");
	             return false;
	             }
	  		var updateUrl = $('#updateUrl').val();
	  		var formData = new FormData($("#editForm")[0]);
	  		$.ajax({
	  			//几个参数需要注意一下
	  			type : "POST",//方法类型
	  			dataType : "json",//预期服务器返回的数据类型
	  			url : updateUrl,//url
	  			data : formData,
	  			async : false,
	  			cache : false,
	  			contentType : false,
	  			processData : false,
	  			success : function(data) {
	  				if (data.rescode=='1') {
	  					alert("保存成功");
	  					backFun();
	  				} else {
	  					alert(data.result);
	  				}
	  			}
	  		});
	    
	    }
	
	
	//绑定新增按钮事件
	$('#yesBtn').bind("click",saveFun);
	$('#backBtn').bind("click",backFun);

});
