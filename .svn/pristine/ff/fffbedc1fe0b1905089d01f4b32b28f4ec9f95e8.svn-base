define(function(require) {
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	var PAGE_SIZE = 10;
	//var submitButton = $("#searchBtn");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	datepickerUtil.datesTrigger('#endTime', null, null);
	datepickerUtil.datesTrigger('#startTime', null, null);
	handlebars.registerHelper('formatDatetime', _formatDatetime);
	searchCondition = form.serialize();
	function queryload(params){
	    load(params.data[0], params.data[1]);
	};
	function downLoadExcel(){
	    var url=$('#getDownLoadUrl').val();//+".json";
	    //window.open(url);
	    var allHtml=$('#rg_list');allHtml.find("form[name='forsub']").remove();
	    var form = $("<form>");   //定义一个form表单
        form.attr('style', 'display:none');   //在form表单中添加查询参数
        form.attr('name', 'forsub');
        form.attr('target', '_self');
        form.attr('method', 'post');
        form.attr('action', url);
        var input1 = $('<input>');
        input1.attr('type', 'hidden');
        input1.attr('name', 'loginName');
        input1.attr('value', $('#tln').val());
        var input2 = $('<input>');
        input2.attr('type', 'hidden');
        input2.attr('name', 'name');
        input2.attr('value', $('#tn').val());
        var input3 = $('<input>');
        input3.attr('type', 'hidden');
        input3.attr('name', 'startTime');
        input3.attr('value', $('#tst').val());
        var input4 = $('<input>');
        input4.attr('type', 'hidden');
        input4.attr('name', 'endTime');
        input4.attr('value', $('#tet').val());
        form.append(input1).append(input2).append(input3).append(input4);//将查询参数控件提交到表单上
        allHtml.append(form);//将表单放置在web中
        form.submit(); 
	};
	load(1, PAGE_SIZE);
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var tln=$('#loginName').val(),
		tn=$('#name').val(),
		tst=$('#startTime').val(),
		tet=$('#endTime').val();
		var queryUrl = $('#getLabelUrl').val() + '.json'; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {
				loginName : tln,
				name :tn,
				startTime:tst,
				endTime :tet
			} 
		}).done(function(response) {
			if (response && response.result && response.result.length) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				//将查询条件保存在隐藏于区域
				$('#tln').val(tln);$('#tn').val(tn);$('#tst').val(tst);$('#tet').val(tet);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
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
	function reset() {
		$("#searchForm")[0].reset();
	}
// 绑定按钮事件重置
$("#resetBtn").bind("click", reset);
$("#searchBtn").bind('click',[1,PAGE_SIZE],queryload);
$("#putExcel").bind('click',downLoadExcel);
});
