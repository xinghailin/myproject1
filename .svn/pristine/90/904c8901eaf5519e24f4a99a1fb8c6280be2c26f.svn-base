define(function(require, exports, module) {
	function back(){
		if($('#type').val()==3){
			location.href=$("#bizcontractfinancepageUrl").val()+"?currpage="+$('#currpage').val();
		}else if($('#insurance').val()==1){//保险列表查看返回
			location.href=$("#back1Url").val()+"?currpage="+$('#currpage').val()+"&type=2";
		}else if($('#type').val()==2&&$('#all').val()==""){//2.0销售合同-列表
			location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
		}else if($('#all').val()==1){//2.1销售合同-列表-总览
			location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&all="+$("#all").val();
		}else{//定金到账审核查看返回
			location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&type=2"+"&node=2";
		}
	}
  //绑定新增按钮事件
	$("#backBtn").bind("click", back);
});