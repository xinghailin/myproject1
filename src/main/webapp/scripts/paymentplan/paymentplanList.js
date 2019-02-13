define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#payStartDateTime', null, null);
	datepickerUtil.datesTrigger('#payEndDateTime', null, null);
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDate', _formatSimpleDate);
	handlebars.registerHelper('formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('formatResCode', _formatResCode);
	handlebars.registerHelper('addButton', _addButton);
	handlebars.registerHelper('addPayStatus', _addPayStatus);
	handlebars.registerHelper('addPayMoney', _addPayMoney);
	handlebars.registerHelper('formatStatus', _formatStatus);
	handlebars.registerHelper('formatsendPayStatus', _formatsendPayStatus);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	//格式化相应码
	function _formatResCode(status, code) {
		if (status === 1) {
			return '';
		}else{
			return code;
		}
	}
	
	_formatResCode
	//格式化状态
	
	function _formatStatus(status) {
		if (status === 1) {
			return '成功';
		}else if(status === 2){
			return '失败';
		}else if(status === 3){
			return '处理中';
		}else{
			return '未开始';
		}
	}
	// 格式化请求扣款状态
	function _formatsendPayStatus(status) {
		if (status === 1) {
			return '';
		}else if(status === 2){
			return '失败';
		}else{
			return '';
		}
	}
	//格式化时间
	function _formatSimpleDate(datetime) {
		if (datetime === null) {
			return '';
		}
		
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
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
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
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
				//绑定列表按钮事件处理函数
				$("a[name='viewBtn']").on("click", viewPlanDetailList);
				$("a[name='payMoneyBtn']").on("click", payMoney);
				$("a[name='payStatusBtn']").on("click", payStatus);
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


	function _addPayStatus(status,id){ 
		if(status === 3){
			var edit = $("<a href='javascript:void(0);' target='_self' name='payStatusBtn' class='btn63_03' id='"+id+"'/>").html('<span>更新状态</span>');
			var html=$('<span />').html(edit).html();
			return new handlebars.SafeString(html); 
		}else{
			return '';
		}
	}
	function _addPayMoney(status,id){
	    if(status === 2){
			var edit = $("<a href='javascript:void(0);' target='_self' name='payMoneyBtn' class='btn63_03' id='"+id+"'/>").html('<span>发起扣款</span>');
			var html=$('<span />').html(edit).html();
			return new handlebars.SafeString(html); 
		}else{
			return '';
		}
		
	}
	function _addButton(id){
		var edit = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看记录</span>');
		var html=$('<span />').html(edit).html();
		return new handlebars.SafeString(html); 
	}
	//
	function viewPlanDetailList(){
		location.href=$('#viewUrl').val()+"?contractId="+$(this).attr('id');
	}
	//结账
	function payMoney(){
		var id =$(this).attr('id')
	      var searchPayMoneyUrl=$('#searchPayMoneyUrl').val();
	       $.ajax(searchPayMoneyUrl,{
	       	   type: "post",
	           data: {id: id},
	           datatype: "json",
	           success: function (data) {
	        	   if(1==data.rescode){
	        		   alert("扣款提交成功.......");
	        		   window.location.reload();
	        	   }else{
	        		   alert("扣款提交失败.......");
	        	   }
	               
	           }
	       })
	}	
	function payStatus(){ 
		var id =$(this).attr('id')
	      var searchPayStatusUrl=$('#searchPayStatusUrl').val();
	       $.ajax(searchPayStatusUrl,{
	       	   type: "post",
	           data: {id: id},
	           datatype: "json",
	           success: function (data) {
	        	   if(1==data.rescode){
	        		   alert("更新扣款状态成功.......");
	        		   window.location.reload();
	        	   }else{
	        		   alert("更新扣款状态失败.......");
	        	   }
	               
	           }
	       })
	}
	
});
