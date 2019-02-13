define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	datepickerUtil.datesTrigger('#starttime', null, null);
	var submitButton = $("#btnSearch");
	var PAGE_SIZE = 10;
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('status', status);
	var source = $('#dataListTemplate').html(), template = handlebars
			.compile(source);
	$(function() {
		var cur = $('#currpage').val();
		if (cur)
			load(cur, PAGE_SIZE);
		else
			load(1, PAGE_SIZE);// 加载数据列表
		submitButton.bind("click", {
			curPageNo : 1,
			pageSize : PAGE_SIZE
		}, dataSearch);// 信息查询
	});
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}

	function status(status) {
		if (status == 1) {
			return "可用";
		} else if (status == 2) {
			return "不可用";
		}
	}

	function load(curPageNo, pageSize) {
		dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start=" + curPageNo
				+ "&pageSize=" + pageSize+"&areaid="+$('#areaid').val(); // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length > 0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	}
	;
	// 表单搜索
	function dataSearch(dataObj) {
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize);
	}
	function reset() {
		form[0].reset();
	}
	function back(){
		location.href=$('#MallAreaBrandListPage').val()+"?currpage="+$('#currpage').val();
	}
	$("#btnReset").bind("click", reset);
	$("#back").bind("click", back);
	
});
