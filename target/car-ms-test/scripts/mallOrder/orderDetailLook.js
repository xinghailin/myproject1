define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	
	
    function backFun(){
    	window.history.go(-1);
    }
    
$('#backBtn').bind("click",backFun);
});
