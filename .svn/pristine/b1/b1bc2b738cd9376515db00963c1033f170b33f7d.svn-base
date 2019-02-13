define(function(require, exports, module) {
    function saveFun(){
    	var rpy=$("#realdownpay").val();
if(!((/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(rpy))){alert("请填入正确的实到定金金额，小数点后最多两位！");return false;}
var url = $('#editForm').attr('action');
$.ajax(url, {
type : 'POST',
dataType : 'json',
data : {id:$("#id").val(),"pay":rpy}
}).done(function(response) {
	if (response.status) {
		alert("操作成功！");
location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&node="+$('#node').val();
			} else {
				alert(response.msg);
			}
		});
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&node="+$('#node').val();
}
 //绑定新增按钮事件
$('#saveBtn').bind("click",saveFun);
$("#backBtn").bind("click", back);
});