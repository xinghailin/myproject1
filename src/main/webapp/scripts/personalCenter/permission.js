define(function(require) {
    require('datepicker')($);
	require('../base/validation-proxy');
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
    var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg'); 	
	
	$(function() {
		load(1,PAGE_SIZE);
	}); 	
    
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var nowUserId=$("#nowUserId").val();
		var queryUrl = $('#searchUrl').val() + '.json'; // 查询数据url
		queryUrl = queryUrl + '?startPage=' + curPageNo + '&pageSize=' + pageSize+'&roleId='+nowUserId;
		$.ajax(queryUrl, {
			type : 'GET',
			dataType : 'json',
			data : {}
		}).done(function(response) {
			if (response && response.result && response.result.length) {
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
		});
	}
	;
});