define(function(require, exports, module) {
//	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
//	var datepickerUtil = require('../base/datepicker-util');	
//	datepickerUtil.datesTrigger('#comeshopTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var source = $('#dataListTemplate').html(),
	template = handlebars.compile(source);
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatclienttype', formatclienttype);
	handlebars.registerHelper('formatfinance', formatfinance);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function formatstatus(status){
		if(!status)return "门店部待审核";
		if(status==1)return "门店部审核通过";
		if(status==2)return "门店部审核不通过";
		if(status==3)return "定金已到账";
		if(status==4)return "风控进件待审核";
		if(status==51)return "风控进件初审通过";
		if(status==52)return "风控进件初审补件";
		if(status==53)return "风控进件初审拒单";
		if(status==54)return "风控进件复审通过";
		if(status==55)return "风控进件复审补件";
		if(status==56)return "风控进件复审拒单";
		return "";
	}
	function formatclienttype(key){
		if(key==1)return "个人";
		if(key==2)return "单位";
		return "";
	}
	function formatfinance(key){
		if(key==1)return "是";
		if(key==2)return "否";
		return "";
	}
	function operate(id,status){
		var nbsp = "&nbsp;";
		var base = $("<a href='javascript:void(0);' target='_self' name='baseBtn' class='btn63_03' id='"+id+"'/>").html('<span>基本信息</span>');
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>');
		var html=$('<span />').html(edit).html();
		return new handlebars.SafeString(html);
	}
//	查看合同信息
	function editClient(){
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#editUrl').val()+"?all=1&id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
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
		var queryUrl = $('#searchUrl').val() + "?all=1&start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
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
				$("a[name='editBtn']").on("click", editClient);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	// 重置
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
});