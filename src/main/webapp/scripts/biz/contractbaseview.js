define(function(require, exports, module) {
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&all="+$("#all").val()+"&node="+$('#node').val();
	}
  //绑定新增按钮事件
	$("#backBtn").bind("click", back);
});