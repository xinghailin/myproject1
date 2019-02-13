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
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_status', _status);
	var globe_context_id = $('#globe_context_id').val();
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function _status(status){
		 if(status==6){
			return "物流已经确认到店";
		}else if(status==7){
			return "门店已经确认到店";
		}
	}
	function operate(status,id){
		var nbsp = "&nbsp;";
		var look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
		var html=$('<span />').append(look).html();
		if(status==6){
			var affirm = $("<a href='javascript:void(0);' target='_self' name='affirmBtn' class='btn63_03' id='"+id+"'/>").html('<span>门店确认到店</span>') ;
			var html=$('<span />').append(affirm).append(nbsp).append(look).html();
		}
		return new handlebars.SafeString(html);
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&shopid="+$('#shopid').val(); // 查询数据url
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
				$("a[name='lookBtn']").on("click", lookBtn);
				$("a[name='affirmBtn']").on("click",affirmBtn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function lookBtn(){
		var theId=$(this).attr('id');
		location.href=$('#supplycartabledetailsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&type=6";//门店确认到店查看
	};
	
	function affirmBtn(){
		var theId=$(this).attr('id');
		location.href=$('#supplycartabledetailsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&type=7"+"&loginid="+$('#loginid').val();//门店确认到店
	};
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
});
