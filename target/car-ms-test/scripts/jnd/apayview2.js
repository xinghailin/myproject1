define(function(require, exports, module) {
	require('jquery-css');
	function back(){
		window.location.href=$('#indexUrl').val()+"?currpage="+$('#currpage').val();
	}
	$("#cancelBtn").bind("click", back);
});