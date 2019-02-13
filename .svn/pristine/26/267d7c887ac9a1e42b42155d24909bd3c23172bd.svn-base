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
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
//	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatmonitor', formatmonitor);
	function formatstatus(status) {
		if (status == 9)
			return "申请执行";
		if (status == 10)
			return "执行结果";
	}
	function formatmonitor(monitor) {
if (monitor == 1)
	return "是";
	return "否";
}
	var law=$("#law").val();
	function operate(id, status,detail) {
		var nbsp = "&nbsp;",html='';
		var flow = $("<a href='javascript:void(0);' target='_self' name='flowBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看流程图</span>');
		var view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_03' id='"+id+"'/>").html('<span>资产查看</span>');
		if(!law&&(status==9||(status==10&&detail=='执行结果：终止执行-法院要求'))){
			var add=$("<a href='javascript:void(0);' target='_self' name='uploadBtn' class='btn63_03' id='"+id+"'/>").html('<span>资产上传</span>');
			html=$('<span />').html(flow).append(nbsp).append(view).append(nbsp).append(add).html();
		}
		else html=$('<span />').html(flow).append(nbsp).append(view).html();
		return new handlebars.SafeString(html);
	}

	// 查看合同信息
	function viewfun() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#viewUrl').val() + "?id=" + theId+"&backadd="+$('#backadd').val() + "&currpage=" + $('#J_CurPageNo').text();
	}

	// 查看流程图
	function flowClient() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#flowUrl').val() + "?id=" + theId+"&backadd="+$('#backadd').val() + "&currpage=" + $('#J_CurPageNo').text();
	}

	function uploadmonitor() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#uploadUrl').val() + "?id=" + theId+"&backadd="+$('#backadd').val() + "&currpage=" + $('#J_CurPageNo').text();
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
		var queryUrl = $('#searchUrl').val() + "?type=1&start="
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
				$("a[name='flowBtn']").on("click", flowClient);$("a[name='viewBtn']").on("click", viewfun);$("a[name='uploadBtn']").on("click", uploadmonitor);
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
//	$("#btnAdd").bind("click", addcase);
//	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
//	});
});