define(function(require, exports, module) {
//	require('../base/validation-proxy');
    function saveFun(){
//    	if (validateContentForm()) {
//        	var v1=$("#costprice").val();
//        	var v1=$("#settleprice").val();
//    	$('#editForm').submit();}
    	var a=$('#editForm');
//    	a.validate({
//			rules : {
//				costprice : {
//					required : true,
//					maxlength:13,amount:true
//				},settleprice : {
//					required : true,
//					maxlength:13,amount:true
//				},vin : {
//					required : true,
//					maxlength:50
//				}
//			},
//			errorPlacement : function(error, element) {
//				var p = element.parent();
//				error.appendTo(p);
//			},
//			validClass : "success",
//			onkeyup : false
//		});
    	a.submit();
}
    
    function validateContentForm(){
    	var a=$('#editForm');
    	a.validate({
			rules : {
				costprice : {
					required : true,
					maxlength:13,amount:true
				},settleprice : {
					required : true,
					maxlength:13,amount:true
				},vin : {
					required : true,
					maxlength:50
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
    	return a.valid();
    }
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
	//绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	$("#backBtn").bind("click", back);
});