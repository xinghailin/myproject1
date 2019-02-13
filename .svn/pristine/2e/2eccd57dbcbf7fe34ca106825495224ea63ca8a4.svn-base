define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#time', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var $userCountry=$('#userCountry');
	var userCountry=$userCountry.size()?$userCountry.val():"";
	var searchCondition = null ,$buyid=$('#buyid').val();
//	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('formatDisable', formatDisable);
//	handlebars.registerHelper('operate', operate);
	var //globe_context_id = $('#globe_context_id').val(),
	source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
//		var cur=$('#currpage').val();
//		if(cur)load(cur,PAGE_SIZE);
//		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function formatDisable(num,locknum){
		if(!(num>locknum)){//alert(new handlebars.SafeString('style="display:none"'));
		return new handlebars.SafeString('style="display:none"');}
		else return '';
	}
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	//格式化时间
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
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&buyid="+$buyid; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
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
	};
	//绑定新增按钮事件
	function havechoose(){
		var c=$("input[name='carID']:checked");
		if(c.length>0){
			var theId=c.attr('value');
			window.opener.document.getElementById("subbuyid").value=theId;
			window.opener.finishchosesubpur();
			window.close();
		}
		else{
			$.dialog("请选择子采购计划！choose sub one！", function(){});
		}
	}
	function close(){window.close()}
	function back(){
		window.location.href=$('#backUrl').val()+"?userCountry="+userCountry+"&currpage="+$('#currpage').val();
	}
	// 重置
	function reset() {       
		form[0].reset();
	}
	//绑定新增按钮事件
	$("#btnReset").bind("click", reset);
	$("#sureBtn").bind("click", havechoose);
	$("#backBtn").bind("click", back);
	$("#closeBtn").bind("click", close);
});