var arr={},$pool=$("#poolid");
define(function(require, exports, module) {
//	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
//	var sArr=[];
	var searchCondition = null;
	datepickerUtil.datesTriggerSimple('#payDateTime', null, null);
//	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDate', _formatSimpleDate);
	handlebars.registerHelper('_formatStatus', _formatStatus);
//	var globe_context_id = $('#globe_context_id').val();
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	//格式化时间
	function _formatSimpleDate(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	//格式化状态
	function _formatStatus(status) {
		if (status === 2) {
			return '库存中';
		}
		if (status === 4) {
			return '已出库';
		}
		if (status === 3) {
			return '审核不通过';
		}
		return "待审核";
	}
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	//表单搜索
	function dataSearch(dataObj){
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
		searchCondition = form.serialize();
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize;//+"&batnum=1"; // 查询数据url
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
				$("[name='carID']:checkbox").bind("click", function(){
					var th=$(this)
//					th.prop("checked", !th.prop("checked"));
					if(th.prop("checked")){
						if(arr[th.val()]){}
						else {arr[th.val()]=1}
					}else{
						if(arr[th.val()]) {delete arr[th.val()]}
					}	
				});
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
	//批量移出方法
	function batchOut(){
		var poolid = $pool.val();
		if(!poolid){
			alert('请选择库融池');
			return;
		}
		if(jQuery.isEmptyObject(arr)){
			alert('请至少选择一条记录出库!')
			return
		}
//		if($("input[name = carID]:checked").length == 0){
//			alert('请至少选择一条记录');
//			return;
//		}
//		var idStr="";
		
//		$("input[name = carID]:checked").each(function(){
//			var id=$(this).attr('value');
//			idStr+=id+",";
//		});
		var outmethodUrl = $('#outmethodUrl').val(); 
		$.ajax(outmethodUrl, {
			async : false,
			type : 'POST',
			dataType : 'json',
			data : {ids:JSON.stringify(arr),poolid:poolid},
		}).success(function(data) {
//			status = data.status;
			if(data.status)
			{alert("出库成功！");
			load(1,10);}
			else{alert(data.msg);}
//			window.location.reload();
		}).error(function() {
			msg = "系统内部异常";
			alert(msg);
		});
	}
//	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		$("#batchOutBtn").bind("click",batchOut);
		$pool.change(function(){
//			  $(this).css("background-color","#FFFFCC");
			load(1,10);arr={}
			});
//	});
});
//全选 反选
function checkAllCar() {
	 $("[name = 'carID']:checkbox").each(function () {
var th=$(this)
th.prop("checked", !th.prop("checked"));
if(th.prop("checked")){
	if(arr[th.val()]){}
	else {arr[th.val()]=1}
}else{
	if(arr[th.val()]) {delete arr[th.val()]}
}
    });
//	 console.log(arr);
}