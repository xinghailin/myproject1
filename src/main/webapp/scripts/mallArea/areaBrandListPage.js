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
	handlebars.registerHelper('_operate', _operate);
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
	function _operate(id,statuss) {
		var del, edit,html;
		var nbsp = "&nbsp;";
		del = $(
				"<a href='javascript:void(0);' target='_self' name='del' class='btn63_03' id='"
						+ id + "'/>").html('<span>删除</span>');
		edit = $(
				"<a href='javascript:void(0);' target='_self' name='edit' class='btn63_03' id='"
						+ id + "'/>").html('<span>修改</span>');
		if(statuss==1){
			html = $('<span />').append(del).append(nbsp).append(edit).html();
		}else{
			html = $('<span />').append(del).html();
		}
		
		return new handlebars.SafeString(html);
	}
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}

	function status(status,statuss) {
		if (status == 1&&statuss==1) {
			return "可用";
		} else if (status == 2&&statuss==1) {
			return "不可用";
		}else{
			return "区域不可用";
		}
	}

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
				$("a[name='del']").on("click", del);
				$("a[name='edit']").on("click", edit);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	}
	;

	function del() {
		var $this = $(this);
		var theId = $this.attr('id');
		$.dialog('确定删除？', function() {
			var del = $('#deleteUrl').val() + "?id=" + theId;
			$.ajax(del, {
				type : 'post',
				dataType : 'json'
			}).done(function(response) {
				if (response.status) {
					$.dialog('删除成功！', function() {
						load(1, PAGE_SIZE);
					});
				} else {
					$.dialog(response.msg, function() {
					});
				}
			})
		});
	}
	function edit() {
		var theId=$(this).attr('id');
		location.href = $('#updateAreaBrandUrl').val() + "?currpage="
		+ $('#J_CurPageNo').text()+"&brandid="+theId;
	}
	
	// 表单搜索
	function dataSearch(dataObj) {
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize);
	}
	function reset() {
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
});
