define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	datepickerUtil.datesTrigger('#starttime', null, null);
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_operate', _operate);
	handlebars.registerHelper('status', status);
	handlebars.registerHelper('allstatus', allstatus);
	handlebars.registerHelper('allname', allname);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var source = $('#dataListTemplate').html(), template = handlebars
			.compile(source);
	$(function() {
		load();// 加载数据列表
	});
	var type = $('#type').val();
	function _operate(id, status) {
		var look, look1, html;
		var nbsp = "&nbsp;";
		if (type == 1) {// 门店部查询
			look = $(
					"<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"
							+ id + "'/>").html('<span>查看详情</span>');

		} else if (type == 4) {// 总详情
			if (status == 1) {
				look = $(
						"<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"
								+ id + "'/>").html('<span>查看详情</span>');

			} else if (status == 2) {
				look = $(
						"<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"
								+ id + "'/>").html('<span>接收详情</span>');

			} else if (status == 3) {
				look = $(
						"<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"
								+ id + "'/>").html('<span>待审核详情</span>');

			} else if (status == 4) {
				look = $(
						"<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"
								+ id + "'/>").html('<span>领取详情</span>');

			}

		} else {// 财务接收与
			look = $(
					"<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"
							+ id + "'/>").html('<span>查看详情</span>');
			if (status == 1) {
				look1 = $(
						"<a href='javascript:void(0);' target='_self' name='lookBtn1' class='btn63_03' id='"
								+ id + "'/>").html('<span>接收</span>');
			} else if (status == 3) {
				look1 = $(
						"<a href='javascript:void(0);' target='_self' name='lookBtn1' class='btn63_03' id='"
								+ id + "'/>").html('<span>领取审核</span>');
			}

		}
		html = $('<span />').append(look).append(nbsp).append(look1).html();
		return new handlebars.SafeString(html);
	}
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	function allname(status, creatorname, receivename, getname) {
		if (status == 1) {
			return creatorname;
		} else if (status == 2) {
			return receivename;
		} else if (status == 3) {
			return getname;
		} else {
			return receivename;
		}

	}
	function allstatus(status) {

		if (status == 1) {
			return "未接收";
		} else if (status == 2) {
			return "已接收";
		} else if (status == 3) {
			return "领取待审核";
		} else {
			return "已领取";
		}
	}
	function status(status) {

		if (status == 1) {
			return "未接收";
		} else if (status == 2) {
			return "已接收";
		} else if (status == 3) {
			return "领取待审核";
		} else if (status == 4) {
			return "领取审核通过";
		}
	}
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
	function lookBtn() {// 详情车看
		var theId = $(this).attr('id');

		location.href = $('#CarAccessoryDetailsUrl').val() + "?id=" + theId
				+ "&currpage=" + $('#currpage').val() + "&type=" + type;
	}
	function lookBtn1() {// 材料接收
		var theId = $(this).attr('id');

		location.href = $('#auditCarAccessoryDetailsUrl').val() + "?id="
				+ theId + "&currpage=" + $('#currpage').val();
	}
	function load() {
		dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?carid=" + $('#id').val()
				+ "&type=" + type; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length > 0) {
				dataList.html(template(response)).css('height', 'auto');
				$("a[name='lookBtn']").on("click", lookBtn);
				$("a[name='lookBtn1']").on("click", lookBtn1);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	}
	;
	function btnSearch() {
		location.href = $('#carAccessorypage').val() + "?currpage="
				+ $('#currpage').val() + "&type=" + $('#type').val();
		;
	}
	function newAddCarAccessory() {
		location.href = $('#newAddCarAccessoryUrl').val() + "?carid="
				+ $('#id').val() + "&currpage=" + $('#currpage').val()
				+ "&type=1";// type=1是新建此车附件
	}
	$("#newAddCarAccessory").bind("click", newAddCarAccessory);
	$("#btnSearch").bind("click", btnSearch);
});
