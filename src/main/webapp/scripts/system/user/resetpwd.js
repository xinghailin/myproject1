define(function(require) {
    require('../base/validation-proxy');
    require('art-dialog')($);
    
	$(function() {
		$("#submitBtn").bind("click", resetPwd);//重置密码
		$("#closeBtn").bind("click",closeDialog);//关闭窗口
	});
	
    //重置密码
	function resetPwd() {		
			var addUrl = $("#actionUrl").val();
			var userIds="";
			$("input[name='userId']").each(function(){
				userIds+=$(this).val()+" ";
			});
			$.ajax({
				type : "POST",
				url : addUrl + ".json",
				dataType : "json",
				data : {"userIds":userIds},
				async : false,
				success : function(response) {
					if (response.status) {
						$.dialog('密码重置成功', function(){
							refreshParent();
						});
					} else {
						$.dialog(response.message,function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog("出现异常，请稍后尝试",function(){});
				}
			});		
	}
    	   
	// 刷新当前页面
	function refreshParent() {
		var a=window.opener;
		var userName=a.document.getElementById("userName").value;
		var name=a.document.getElementById("name").value;
		var code=a.document.getElementById("code").value;
		window.close();
		a.resetConditions(userName,name,code);
	}
				
	//关闭当前窗口
	function closeDialog(){
		window.close();
	}

});

