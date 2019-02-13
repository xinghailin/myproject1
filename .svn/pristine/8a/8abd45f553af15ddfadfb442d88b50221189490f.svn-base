define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_operate', operate);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		pushAll();
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询

	});
	function operate(id){
	
		var del = $("<a href='javascript:void(0);' target='_self' name='deltBtn' class='btn63_03' id='"+id+"'/>").html('<span>删除</span>') ;
		var html=$('<span />').append(del).html();
		return new handlebars.SafeString(html);
	}
	function deltBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		var deleteurl=$('#deleteUrl').val();
		$.ajax({
			url:deleteurl,
			type:'post',
			dataType : 'json',
			 data:{id:theId},
			success:function(data){
                  if(data.status){
                      alert("删除成功");
                      load(1,PAGE_SIZE);
                  }else{
                  	alert("删除失败!");
                  }
              }
		})
	}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$("#currpage").val();
	}
	function save(){
		var brandid=$('#brandid').val();
		var model=$('#models').val();
		var version=$('#version').val();
		var addurl=$('#addUrl').val();
		$.ajax({
			url:addurl,
			type:'post',
			dataType : 'json',
			 data:{brandid:brandid,model:model,version:version},
			success:function(data){
                  if(data.status){
                      alert("保存成功");
                      load(1,PAGE_SIZE);
                      $('#models').val("");
                      $('#version').val("");
                  }else{
                  	alert("保存失败!");
                  }
              }
		})
		
	}
	$("#backBtn").bind("click", back);
	$("#save").bind("click", save);
	
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	function pushAll(){
		var styleLst=$('#address');
		var slo=styleLst.find('option');
		var ss=slo.size();
		for(var i=0;i<ss;i++){
			if(slo[i].value){sArr.push(slo[i]);}
		}
	}
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
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
        var brandid =$('#brandid').val();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() +"?brandid="+brandid+"&start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
//				//绑定列表按钮事件处理函数
////				$("a[name='viewBtn']").on("click", viewCars);
////				$("a[name='auditBtn']").on("click", auditFun);
			$('img').bigic();
		   $("a[name='deltBtn']").on("click", deltBtn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	//绑定新增按钮事件
//	$('#saveBtn').bind("click",saveFun);
	// 重置
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
//	$(function(){
//		$msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
});
//显示头像
function showPic(a, sUrl) {
	var x, y;
	var event = a ? a : window.event;
	var mX = event.x ? event.x : event.pageX;
	var my = event.y ? event.y : event.pageY;
	x = event.clientX;
	y = event.clientY;
	var div = $("#imgLayer");
	div.css("left",x);
    div.css("top",y);
    div.css("left",mX+10+"px");
    div.css("posTop",my+10 +"px");
    div.html("<img style='float:left;'  heith='160' width='160'  src=\"" + sUrl + "\">") ;
    div.css("display","block");
} /*id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>*/
//隐藏头像
function hiddenPic() {
	var div = $("#imgLayer");
	div.html("") ;
	div.css("display","none");
}