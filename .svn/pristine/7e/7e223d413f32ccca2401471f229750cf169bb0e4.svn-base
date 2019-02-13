define(function(require, exports, module) {
    function saveFun(parm){
    	var siz=$("#carid").val();
    	if(!siz){alert("还未选车！");return false;}
    	var queryUrl = $('#editForm').attr('action');
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {id:$("#id").val(),carid:$("#carid").val(),vin:$("#vin").val()}
		}).done(function(response) {
			if (response.status) {
				alert("操作成功！");
				location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
			} else {
				alert(response.msg);
			}
		});
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
	function chooseFun(){
		var realsale = $("#realsaleUrl").val()+"?stepflow=1";
		showDialogue(realsale, 800, 500);
	}
	function showDialogue(url,w,h){
//		var iWidth = w;
//		var iHeight = h;
//		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
//		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var iTop = 100;
		var iLeft = 100;
		var iWidth = window.parent.screen.availWidth - iLeft*2;;
		var iHeight = window.parent.screen.availHeight - iTop*2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
	
  //绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	$("#backBtn").bind("click", back);
	$("#chooseBtn").bind("click", chooseFun);
});