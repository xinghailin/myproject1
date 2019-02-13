define(function(require, exports, module) {
	require('jquery-css');
//	require('art-dialog')($);
	require('../base/validation-proxy');var form = $('#editForm');
	function back(){
		window.location.href=$('#indexUrl').val()+"?currpage="+$('#currpage').val();
	}
	function validateAddForm() {
		form.validate({
			rules : {
				name : {
					required : true,maxlength:200
				},address : {
					required : true,maxlength:200
				},idtype : {
					required : true,maxlength:200
				},idcode : {
					required : true,maxlength:200
				},phone : {
					required : true,maxlength:200
				},type : {
					required : true
				}
			},
			errorPlacement : function(error, element) {
				element.parent().append(error);
			},
			validClass : "success",
			onkeyup : false
		});
		var bl=form.valid();
		return bl;
	}
	function saveFun() {
		if(validateAddForm()){
		form.submit()}
	}
	$('#saveBtn').bind("click",saveFun);
	$("#cancelBtn").bind("click", back);
});