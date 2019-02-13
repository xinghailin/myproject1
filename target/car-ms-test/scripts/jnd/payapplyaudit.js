define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	function saveFun(dataObj) {
		var pass=dataObj.data.pass,reason=null;
		if(pass==2){reason=$("textarea[name='reason']").val();
			if(!$.trim(reason)){alert('审核不通过时原因必填！');return false;}
			else {if(reason.length>255){alert('原因限制在255个字以内！');return false;}}
		}
		$.ajax(form.attr('action'), {
			type : 'POST',
			dataType : 'json',
			data : {pass:pass,status:$("[name='status']").val(),id:$('#apid').val(),reason:reason}
		}).done(function(response) {
			if (response.status) {//$('#passBtn,#nopassBtn').hide();
				//$.dialog('操作成功！', function(){window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();})//返回之前的当前页
				alert('操作成功！');window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();
			} else {
				$.dialog(response.msg, function(){})//提示错误信息
			}
		});
	}
	function back(){
		window.location.href=$('#indexUrl').val()+"?currpage="+$('#currpage').val();
	}
	var form = $('#editForm');
	$('#passBtn').bind("click",{pass : 1},saveFun);
	$('#nopassBtn').bind("click",{pass : 2},saveFun);
	$("#cancelBtn").bind("click", back);
});