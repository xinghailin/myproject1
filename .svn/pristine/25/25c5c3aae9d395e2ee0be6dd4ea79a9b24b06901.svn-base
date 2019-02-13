define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#starttime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_status', _status);
	handlebars.registerHelper('_operate', _operate);
	handlebars.registerHelper('valid', valid);
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	var date=new Date();
	function valid(status,endtime){
		if(status==1||status==3){
			return "无效";
		}else{
			datetime = new Date(endtime);
			var datetime=datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
			var today=date.getFullYear() + '-' + _fillZero((date.getMonth() + 1)) + '-' + _fillZero(date.getDate());
			if(datetime>=today){
				return "有效";
			}else{
				return "无效";
			}
		}
		
	}
	function _operate(id,status,endtime){
		datetime = new Date(endtime);
		var datetime=datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
		
		var today=date.getFullYear() + '-' + _fillZero((date.getMonth() + 1)) + '-' + _fillZero(date.getDate());
		if(datetime>=today){
			if (status==1) {
				var look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>审核</span>') ;
				var html=$('<span />').append(look).html();
				return new handlebars.SafeString(html);
			}else{
				return "";
			}
		}else{
			return "";
		}
	}
	
	function _status(status){
		if(status==1){
			return "未审核";
		}else if(status==2){
			return "审核通过";
		}else if(status==3){
			return "审核不通过";
		}
	}
	function audit(){
		var theId=$(this).attr('id');
		location.href=$('#auditCarSourceUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginid="+$('#loginid').val();//审核
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		var today=date.getFullYear() + '-' + _fillZero((date.getMonth() + 1)) + '-' + _fillZero(date.getDate());
		var datetime= datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
		if(datetime>=today){
			return datetime;
		}else{
			return datetime+"已过期";
		}
	}
	
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
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				$("a[name='lookBtn']").on("click", audit);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function reset() {       
		form[0].reset();
		$(".city").find("option").remove();
	}
	$("#btnReset").bind("click", reset);
});
