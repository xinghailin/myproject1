define(function(require, exports, module) {
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
//	submitButton.attr('disabled', 'disabled');
//	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
//	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatclienttype', formatclienttype);
	handlebars.registerHelper('formatfinance', formatfinance);
	function formatstatus(vid, status) {
		if (status == 1)
			return "待审核";
		if (status == 2)
			return "门店部补填";
		if (status == 3)
			return "门店部不通过";
		if (status == 4)
			return "门店部通过";
		if (status == 5)
			return "财务部补填";
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
			return "金融";
		if (key == 2)
			return "全款";
		return "";
	}
	function operate(id, vid, vstatus) {
		var spa = "&nbsp;", html, edit;
		if (vstatus==1) {
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+ id + "'/>").html('<span>审核</span>');
			html=$('<span />').html(edit).html();
		}else if(vstatus==5){
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+ id + "'/>").html('<span>编辑</span>');
			html=$('<span />').html(edit).html();
		}else {
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_04' id='"+ id + "'/>").html('<span>查看</span>');
			html=$('<span />').html(edit).html();
		}
		return new handlebars.SafeString(html);
	}
	// 查看合同信息
	function viewfun() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#baseUrl').val() + "?type=1&id=" + theId
				+ "&currpage=" + $('#J_CurPageNo').text() + "&node="
				+ $('#node').val() + "&all=" + all;
	}
	// 查看合同信息
	function editClient() {
		var $this = $(this);
		var theId = $this.attr('id');
		var isview=$this.hasClass("btn63_04")
		if(isview)
		location.href = $('#editUrl').val() + "?process=2&id=" + theId + "&currpage="+ $('#J_CurPageNo').text() + "&view=1";
		else location.href = $('#editUrl').val() + "?process=2&id=" + theId + "&currpage="+ $('#J_CurPageNo').text();
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
		var queryUrl = $('#searchUrl').val() + "?start="+ curPageNo + "&pageSize=" + pageSize; // 查询数据url
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
				$("a[name='editBtn']").on("click", editClient);
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