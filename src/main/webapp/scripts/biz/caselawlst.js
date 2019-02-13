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
//	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	function formatstatus(status) {
		if (status == 1)
			return "风控提交";
		if (status == 2)
			return "法务接收材料";
		if (status == 3)
			return "立案";
		if (status == 4)
			return "确定开庭时间";
		if (status == 5)
			return "判决";
		if (status == 6)
			return "是否二审";
		if (status == 7)
			return "二审开庭时间";
		if (status == 8)
			return "二审判决";
		if (status == 9)
			return "申请执行";
		if (status == 10)
			return "执行结果";
	}

	function operate(id, status) {
		var nbsp = "&nbsp;",view;
		var flow = $("<a href='javascript:void(0);' target='_self' name='flowBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看流程图</span>');
		if(status)
		view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_04' id='"+id+"'/>").html('<span>查看</span>');
		else view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_03' id='"+id+"'/>").html('<span>处理</span>');
		var html=$('<span />').html(flow).append(nbsp).append(view).html();
		return new handlebars.SafeString(html);
	}

	// 处理合同信息
	function viewfun() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#operateUrl').val() + "?id=" + theId + "&currpage=" + $('#J_CurPageNo').text();//+"&backadd="+$('#backadd').val();
	}

	// 查看流程图
	function flowClient() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#flowUrl').val() + "?id=" + theId+"&backadd="+$('#backadd').val() + "&currpage=" + $('#J_CurPageNo').text();
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
				$("a[name='flowBtn']").on("click", flowClient);$("a[name='viewBtn']").on("click", viewfun);
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