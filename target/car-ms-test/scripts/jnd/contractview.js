define(function(require, exports, module) {
	require('jquery-css');var node=$('#node').val();//0 1 2 3
//	var $userCountry=$('#userCountry');
//	var userCountry=$userCountry.size()?$userCountry.val():"";
function back(){
	window.location.href=$('#indexUrl').val()+"?node="+node+"&currpage="+$('#currpage').val();
}
function uploadsign(){//上传签字合同
	var filelen=$("#text1url").val().length;
	if(filelen==0){alert("请选择签字合同文件(please choose sign contract file)");return;}
	$('#editForm').submit();
}
$("#cancelBtn").bind("click", back);
$("#saveBtn").bind("click", uploadsign);
});