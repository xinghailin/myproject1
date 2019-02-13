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
	function _operate(id) {
		var del, edit, carsoure, areaBrand, html;
		var nbsp = "&nbsp;";
		del = $(
				"<a href='javascript:void(0);' target='_self' name='del' class='btn63_03' id='"
						+ id + "'/>").html('<span>删除</span>');
		edit = $(
				"<a href='javascript:void(0);' target='_self' name='edit' class='btn63_03' id='"
						+ id + "'/>").html('<span>修改</span>');
		carsoure = $(
				"<a href='javascript:void(0);' target='_self' name='carsoure' class='btn63_03' id='"
						+ id + "'/>").html('<span>查看车源</span>');
		areaBrand = $(
				"<a href='javascript:void(0);' target='_self' name='areaBrand' class='btn63_03' id='"
						+ id + "'/>").html('<span>添加区域品牌</span>');

		html = $('<span />').append(del).append(nbsp).append(edit).append(nbsp)
				.append(carsoure).append(nbsp).append(areaBrand).html();
		return new handlebars.SafeString(html);
	}
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
				$("a[name='carsoure']").on("click", carsoure);
				$("a[name='areaBrand']").on("click", areaBrand);
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
		location.href = $('#addAreaUrl').val() + "?currpage="
		+ $('#J_CurPageNo').text()+"&id="+theId;
	}
	function addArea() {
		location.href = $('#addAreaUrl').val();
	}
	function areaBrand(){
		var theId=$(this).attr('id');
		location.href = $('#areaBrandUrl').val() + "?currpage="
		+ $('#J_CurPageNo').text()+"&id="+theId;
	}
	function carsoure(){
		var theId=$(this).attr('id');
		location.href = $('#carsoureUrl').val() + "?currpage="
		+ $('#J_CurPageNo').text()+"&id="+theId;
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
	$("#addArea").bind("click", addArea);

});
