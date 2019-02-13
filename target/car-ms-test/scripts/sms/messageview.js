define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#payDateTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDate', _formatSimpleDate);
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatsubmitStatus', _formatsubmitStatus);
	handlebars.registerHelper('_formatsendStatus', _formatsendStatus);
	handlebars.registerHelper('_formatstatus', _formatstatus);
	handlebars.registerHelper('_formatSmsType', _formatSmsType);
	handlebars.registerHelper('_formatPrefix', _formatPrefix);
	handlebars.registerHelper('_operate', operate);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		
	});
	function operate(id,status){
		var html;
		var edit;
		if (status==1) {
		 edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_04' id='"+id+"'/>").html('<span>查看</span>');
		}else{
		 edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>处理</span>');
		}
		 html=$('<span />').html(edit).html();
		return new handlebars.SafeString(html);
	}
	//格式化用户接收状态
	function _formatsendStatus(ss) {
		if(ss ==1){
			return '成功';
		}else if(ss ==2){
			return '失败';
		}else{
			return ' ';
		}
		
		return '';
	}
	//格式化用户接收状态
	function _formatstatus(ss) {
		if(ss =='DELIVRD'){
			return '';
		}else{
			return ss;
		}
		
		return '';
	}
	
	//格式化短信提交运营商状态
	function _formatsubmitStatus(ss) {
		if(ss ==1){
			return '成功';
		}else {
			return '失败';
		}
		
		return '';
	}
	
	function _formatSmsType(ss) {
		if(ss ==1){
			return '催款类';
		}else if(ss ==2) {
			return '保险';
		}else {
			return '其他';
		}
		
		return '';
	}
	function _formatPrefix(ss) {
		if(ss =="ck"){
			return '催款类';
		}else {
			return '其他';
		}
		
		return '';
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

});