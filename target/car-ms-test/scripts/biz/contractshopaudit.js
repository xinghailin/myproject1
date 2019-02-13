define(function(require, exports, module) {
    function saveFun(parm){
    	var pas=parm.data.pas;
    	if(pas==1){
    	var siz=$(":radio[name='zeropur']:checked").size();
    	if(!siz){alert("请确认是否零采！");return false;}}
    	else if(pas==2){
    		if($.trim($("#du-reason1").val()).length==0){alert("不通过原因必填！");return false;}
    	}
    	else if(pas==22){
    		if($.trim($("#du-reason1").val()).length==0){alert("不通过原因必填！");return false;}
    	}
    	var queryUrl = $('#editForm').attr('action');
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {id:$("#id").val(),pas:pas,zero:$(":radio[name='zeropur']:checked").val(),reason:$("#du-reason1").val()}
		}).done(function(response) {
			if (response.status) {
				alert("审核成功！");
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
	$('#saveBtn').bind("click",{pas : 1},saveFun);
	$('#savenotBtn').bind("click",{pas : 2},saveFun);
	$('#saveafterupdateBtn').bind("click",{pas : 22},saveFun);
	$("#backBtn").bind("click", back);
});