define(function(require, exports, module) {
    
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
	var searchCondition = null;
//	var roleName = null;
	var form = $('#searchForm');
	submitButton.attr('disabled', 'disabled');
	
	// handlebars.registerHelper('addComma', _addComma);
	// handlebars.registerHelper('displayText', _displayText);
	handlebars.registerHelper('formatDatetime', _formatDatetime);
	handlebars.registerHelper('addButton', _addButton);
	handlebars.registerHelper('showDialogue', showDialogue);
	handlebars.registerHelper('showEditForm', showEditForm);
	handlebars.registerHelper('formatappId', formatappId);
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

//		submitHandler : function() {
//			searchCondition = form.serialize();
//			roleName = $('#roleName').val();
//			load(1, PAGE_SIZE);
//			return false;
//		}
//	});

	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();		
//		roleName = $('#roleName').val();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	
function formatappId(appId){
	if("0"==appId)return "工作流";
	return "普通";
}
	
	function load(curPageNo, pageSize) {
//		dataList.show().block({
//			theme : true
//		});
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + '.json'; // 查询数据url
		queryUrl = queryUrl + '?startPage=' + curPageNo + '&pageSize=' + pageSize;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
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
			//绑定列表按钮事件处理函数
			$("a[name='editBtn']").on("click", showEditForm);
			$("a[name='deleteBtn']").on("click", deleteRole);
			$("a[name='permissionBtn']").on("click", configResource);
			$("a[name='menuBtn']").on("click", configMenu);
		});
	}
	;
	
	//以下函数用于定义页面显示
	//根据编码值显示对应的select中的文本值
	function _displayText(code, selectId) {
		var options = document.getElementById(selectId).options;
		for ( var i = 0, len = options.length; i < len; i++) {
			if (options[i].value === String(code)) {
				return options[i].text;
			}
		}
		return '';
	}
	// 3位1逗号
	function _addComma(amount) {
		if (amount === null) {
			return '';
		}
		amount += '';
		var x = amount.split('.'), x1 = x[0].replace(/\d+?(?=(?:\d{3})+$)/g, '$&,'), x2 = x.length > 1 ? '.' + x[1] : '';
		return x1 + x2;
	}
	//格式化日期
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	//添加修改角色按钮
	function _addButton(id){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03 margin_let10' id='"+id+"'/>").html('<span>修改</span>');
		var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>删除</span>');
		var permission = $("<a href='javascript:void(0);' target='_self' name='permissionBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>权限</span>');
		var menu = $("<a href='javascript:void(0);' target='_self' style='margin-left:8px' name='menuBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>菜单</span>');
		var html=$('<span />').html(edit).append(nbsp).append(del).append(nbsp).append(permission).append(nbsp).append(menu).html();
		return new handlebars.SafeString(html); 
	}
	
	//以下函数按钮事件处理函数
	function showEditForm(){
		var id=$(this).attr('id');
		var addRoleUrl = $("#editUrl").val()+"?id="+id;
		showDialogue(addRoleUrl, 600, 300);
	}
	
	function showAddForm() {
		var addUrl = $("#addUrl").val();
		showDialogue(addUrl, 600, 300);
	}

	function deleteRole() {
		var id = $(this).attr('id');
		var confirmFlag = window.confirm("您正在删除此角色！");
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
	
	function configResource(){
		var id = $(this).attr('id');
		var configResourceUrl = $("#configResourceUrl").val()+"?id="+id;
		showDialogue(configResourceUrl, 600, 300);
	}
	function configMenu(){
		var id = $(this).attr('id');
		var configMenuUrl = $("#configMenuUrl").val()+"?id="+id;
		showDialogue(configMenuUrl, 600, 600);
	}
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口6", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}

	function reset() {
		$("#searchForm")[0].reset();
	}
	
	
	//绑定按钮事件
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