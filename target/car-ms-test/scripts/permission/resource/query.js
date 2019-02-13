define(function(require) {
    
	require('../../base/validation-proxy');
//	require('block')($);
//	require('datepicker')($);
	require('jquery-css');
	var pagination = require('../../base/pagination');
    var handlebars = require('handlebars').Handlerbars;
    
	var PAGE_SIZE = 10;
	var submitButton = $("#searchBtn");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = "";
	var resourceName = "";
	submitButton.attr('disabled', 'disabled');

	// handlebars.registerHelper('addComma', addComma);
	handlebars.registerHelper('displaySelectText', displaySelectText);
	handlebars.registerHelper('formatDatetime', formatDatetime);
	handlebars.registerHelper('addButton', addButton);
	handlebars.registerHelper('showDialogue', showDialogue);
	handlebars.registerHelper('showEditForm', showEditForm);
	handlebars.registerHelper('formatStatus', _formatStatus);
	handlebars.registerHelper('formatAppId', _formatAppId);

	
	$(function() {
		load(1,PAGE_SIZE);
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);
	});
	
//	form.validate({
//		rules : {
		// amountMin: {
		// amountRange: '#J_AmountMax'
		// },
		// mobile: {
		// mobile: true
		// }
//		},
//
//		submitHandler : function() {
//			searchCondition = form.serialize();
//			name = $('#name').val();
//			load(1, PAGE_SIZE);
//			return false;
//		}
//	});

	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		name = $('#name').val();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	
	function load(curPageNo, pageSize) {
//		dataList.show().block({
//			theme : true
//		});
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + '.json'; // 查询数据url
		queryUrl = queryUrl + '?' + searchCondition + '&startPage=' + curPageNo + '&pageSize=' + pageSize;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {}
		}).done(function(response) {
//			dataList.unblock();
			if (response && response.result && response.result.result && response.result.result.length) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);

			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
			// 绑定列表按钮事件处理函数
			$("a[name='editBtn']").on("click", showEditForm);
			$("a[name='deleteBtn']").on("click", deleteResource);

		});
	}
	;

	// 以下函数用于定义页面显示
	// 根据编码值显示对应的select中的文本值
	function displaySelectText(code, selectId) {
		var options = $('#'+selectId+' option');
		for ( var i = 0, len = options.length; i < len; i++) {
			if (options[i].value === String(code)) {
				return options[i].text;
			}
		}
		return '';
	}
	// 3位1逗号
	function addComma(amount) {
		if (amount === null) {
			return '';
		}
		amount += '';
		var x = amount.split('.'), x1 = x[0].replace(/\d+?(?=(?:\d{3})+$)/g, '$&,'), x2 = x.length > 1 ? '.' + x[1] : '';
		return x1 + x2;
	}
	// 格式化日期
	function formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + fillZero((datetime.getMonth() + 1)) + '-' + fillZero(datetime.getDate()) + ' '
				+ fillZero(datetime.getHours()) + ':' + fillZero(datetime.getMinutes()) + ':' + fillZero(datetime.getSeconds());
	}
	// 补零
	function fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	// 添加修改角色按钮
	function addButton(id) {
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' class='btn63_03 margin_let10' name='editBtn' id='" + id + "'/>").html('<span>修改</span>');
		var del = $("<a href='javascript:void(0);' target='_self' class='btn63_04 margin_let10' name='deleteBtn' id='" + id + "'/>").html('<span>删除</span>');
		var html = $('<span />').html(edit).append(nbsp).append(del).html();
		return new handlebars.SafeString(html);
	}
	//审核状态格式化
	function _formatStatus(status){
		if (status === null) {
			return '';
		}
		if(status == "0") return "无效";
		if(status == "1") return "有效";  
	}
	//应用格式化
	function _formatAppId(appId){
		if (appId === null) {
			return '';
		}
		if(appId == "1") return "门户";
		if(appId == "2") return "管理平台"; 
	}

	// 以下函数按钮事件处理函数
	function showEditForm() {
		var id = $(this).attr('id');
		var editUrl = $("#editUrl").val() + "?id=" + id;
		showDialogue(editUrl, 600, 500);
	}

	function showAddForm() {
		var addUrl = $("#addUrl").val();
		showDialogue(addUrl, 600, 500);
	}

	function deleteResource() {
		var id = $(this).attr('id');
		var confirmFlag = window.confirm("您正在删除此资源！");
		if (confirmFlag) {
			var deleteUrl = $("#deleteUrl").val();
			$.ajax({
				type : 'POST',
				url : deleteUrl + '.json',
				dataType : 'json',
				data : {
					id : id
				},
				async : false,
				success : function(response) {
					if (response.status > 0) {
						alert('删除成功');
						window.location.href = window.location.href;
					} else {
						alert('无记录删除');
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert('删除失败');
				}
			});
		}
	}

	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口5", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}

	function reset() {
		$("#searchForm")[0].reset();
	}

	// 绑定按钮事件
	// 新增
	$("#addBtn").bind("click", showAddForm);
	// 重置
	$("#resetBtn").bind("click", reset);
	submitButton.removeAttr('disabled');
    submitButton.trigger("click");
	// $.validator.addMethod("amountRange", function (value, obj, rangeTo) {
	// if (!_isAmount(value) || !_isAmount($(rangeTo).val())) {
	// return false;
	// }
	// if (value !== '' && $(rangeTo).val() !== '') {
	// return Number(value) <= Number($(rangeTo).val());
	// }
	// return true;
	// }, '请输入正确的查询面额');
	//
	// function _isAmount(value) {
	// if (value === '') {
	// return true;
	// }
	// return (/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(value);
	// };

});