define(function(require, exports, module) {
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var source = $('#dataListTemplate').html(), template = handlebars
			.compile(source);
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatclienttype', formatclienttype);
	
	
	handlebars.registerHelper('formatfinance', formatfinance);
	function formatstatus(status, status2, finance) {
		if (status == 51 || status == 52)
			return "初审";
		if (status == 53)
			return "初审不通过";
		if (status == 54 || status == 55 || status == 61 || status == 62 || status == 63 || status == 3 || status == 6 || status == 7 || status == 8)
			return "复审";
		if (status == 56)
			return "初审不通过";
	}

	function formatclienttype(key) {
		if (key == 1)
			return "个人";
		if (key == 2)
			return "单位";
		return "";
	}
	function formatfinance(key) {
		if (key == 1)
			return "是";
		if (key == 2)
			return "否";
		return "";
	}
	function operate(id, status, finance, status2) {
		var spa = "&nbsp;", html, edit, view;
			view = $(
					"<a href='javascript:void(0);' target='_self' name='baseBtn' class='btn63_03' id='"
							+ id + "'/>").html('<span>查看</span>');
			html = $('<span />').html(view).append(spa).html();
			return new handlebars.SafeString(html);
			
	}

	// 查看合同信息
	function viewfun() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#baseUrl').val() + "?id=" + theId;
	}

	// 格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-'
				+ _fillZero((datetime.getMonth() + 1)) + '-'
				+ _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':'
				+ _fillZero(datetime.getMinutes()) + ':'
				+ _fillZero(datetime.getSeconds());
	}
	// 格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-'
				+ _fillZero((datetime.getMonth() + 1)) + '-'
				+ _fillZero(datetime.getDate());
	}
	// 补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	// 表单搜索
	function dataSearch(dataObj) {
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize);
	}
	// 分页数据加载
	function load(curPageNo, pageSize) {
		dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="
				+ curPageNo + "&pageSize=" + pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length > 0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				// 绑定列表按钮事件处理函数
				$("a[name='baseBtn']").on("click", viewfun);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	}
	// 重置
	function reset() {
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
//	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
//	});
});