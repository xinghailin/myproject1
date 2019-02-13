var uploadurl=$("#uploadUrl").val(),tax=$("#tax").val();
function submit(){
//检测加装包
var reg=/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/;
if(!reg.test($("#issuingp").val())){
alert('请输入正确的开证价，小数点后最多两位！');
return false;
}
$("#submit").attr("disabled",true);
$.ajax({
 url:$("#formUrl").val(),
 data:{id:$('#id').val(),issuingprice:$('#issuingp').val()},
 type:'post',
 dataType:'json',
 success:function (data){
//console.log(data)
 	if(data.status){
 	alert("保存成功！");
 	back();}
 	else {
 	alert(data.message);$("#submit").attr("disabled",true);}
 },error:function(a,b,c){
 	alert(a.responseText);$("#submit").attr("disabled",true);
 }
})
}
function back(){
	location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
}
$("#backBtn").bind("click",back);
$("#issuingp").blur(function(){
	var th=$(this),tv=th.val();
	var r=(tv*tax).toFixed(2);
	$('#estimate').val(r);
})