define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);    

	$('#backBtn').bind("click", backFun);

	function backFun() {
		window.history.go(-1);
	}


});
