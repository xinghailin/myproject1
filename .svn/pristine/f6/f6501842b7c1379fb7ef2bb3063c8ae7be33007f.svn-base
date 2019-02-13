define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	// var globe_context_id = $('#globe_context_id').val() ;
	var shopid = $('#shopid').val();
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
	// 格式化时间
	function _formatDatetime(datetime) {
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
		var queryUrl = $('#searchUrl').val() + "?start=" + curPageNo
				+ "&pageSize=" + pageSize; // 查询数据url
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

	// 绑定新增按钮事件
	// $('#saveBtn').bind("click",saveFun);
	// 重置
	function reset() {
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
	$("#submit").bind("click", submit);
	function submit() {
		var a = $("input[name='carid']:checked").val();
		
		if (a == undefined) {
			$.dialog('请选择车辆！', function() {
			})// 加载数据列表)}
			return false;
		}
		location.href = $('#wholesaleCarUrl').val() + "?loginName="
				+ $('#loginName').val() + "&currpage="
				+ $('#J_CurPageNo').text()+"&id="+a;
	}
	// $(function(){
	// $msg=$('#hideMsg');
	// if($msg.val())$.dialog($msg.val(), function(){});
	// })
});