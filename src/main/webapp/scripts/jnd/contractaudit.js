define(function(require, exports, module) {
	require('jquery-css');var node=$('#node').val();//0 1 2 3
function saveFun() {
	$('#type').val(1);
$("#editForm").submit();
	}
function editFun() {
	var ta=$("#rejectreason1").val();
ta=$.trim(ta);
if(!ta){alert("修改原因必填");return;}
$("#hidereason").val(ta);
$('#type').val(2);
$("#editForm").submit();
	}
function noFun() {
	var ta=$("#rejectreason2").val();
ta=$.trim(ta);
if(!ta){alert("不通过原因必填");return;}
$("#hidereason").val(ta);
$('#type').val(3);
$("#editForm").submit();
}
function back(){
	window.location.href=$('#indexUrl').val()+"?node="+node+"&currpage="+$('#currpage').val();
}
var form = $('#editForm');
$('#saveBtn').bind("click",saveFun);
$('#editBtn').bind("click",editFun);
$('#noBtn').bind("click",noFun);
$("#cancelBtn").bind("click", back);
});