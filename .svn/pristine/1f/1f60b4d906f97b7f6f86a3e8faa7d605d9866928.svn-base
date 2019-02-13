define(function(require) {
function back(){
	location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();//+"&all="+$("#all").val()+"&node="+$('#node').val();
}
 //绑定新增按钮事件
$("#backBtn").bind("click", back);
$("#saveBtn").bind("click", function(){
var $cn=$("#casename");
if(!$.trim($cn.val())){
	alert("案件名称必填！")
	return false;
}
$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
});
});