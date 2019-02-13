define(function(require, exports, module) {
	require('jquery-css');require('../base/myvalidation-proxy');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var form = $('#searchForm');
	submitButton.attr('disabled', 'disabled');
//	var globe_context_id = $('#globe_context_id').val() ;
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//审核操作
//	function auditFun(){
//		var $this=$(this);
//		var theId=$this.attr('id');
//		window.location.href=$('#auditUrl').val()+"?id="+theId;
//	}
	// 重置
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
//	$(function(){
//		$msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
    $(document).delegate('.checkbox','click',function(){
        if($(this).prop('checked')){
            $(this).parent().siblings('.info').show();
        }else{
            $(this).parent().siblings('.info').find('textarea,input').val("");
            $(this).parent().siblings('.info').hide();
        }
    })
    $(document).delegate('.add','click',function(){
        var parent=$(this).parent().parent().clone();
        parent.find('input,textarea').val("");
        parent.find('.checkbox').prop('checked',false);
        parent.find('.info').hide();
        parent.appendTo($('.rightbox'));
    });
    $(document).delegate('.delete','click',function(){
        $(this).parent().parent().remove();
    })
});