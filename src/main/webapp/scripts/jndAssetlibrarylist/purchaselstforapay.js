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
	var searchCondition = null ;
//	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
//	handlebars.registerHelper('operate', operate);
	var //globe_context_id = $('#globe_context_id').val(),
	source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&forapay=1"+"&userCountry="+$('#userCountry').val(); // 查询数据url
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
	// 重置
	function reset() {       
		form[0].reset();
	}
	
	//绑定新增按钮事件
	$("#btnReset").bind("click", reset);
	function havechoose(){
		
		var c=$("input[name='carID']:checked");
		var paytype=$('input:radio[name="paytype"]:checked').val();
		var selfbuy=$('input:radio[name="selfbuy"]:checked').val();
		var cbuyid=$('#cbuyid').val();
		if(c.length<1){
			$.dialog("请选择采购计划！choose one！", function(){});
		}else if(paytype==null){
			$.dialog("请选择付款类别！Please select the payment category！", function(){});
		}else if(paytype==2&&selfbuy==null){
			$.dialog("请选择采购类别！please choose purchasing categories！", function(){});
		}else{
			if(selfbuy==null){
				var theId=c.attr('value');
				window.location.href=$("#contractIndexUrl").val()+"?buyid="+theId+"&currpage="+$('#J_CurPageNo').text()+"&paytype="+paytype+"&cbuyid="+cbuyid+"&cid="+$('#cid').val();
			}else{
				var theId=c.attr('value');
				window.location.href=$("#contractIndexUrl").val()+"?buyid="+theId+"&currpage="+$('#J_CurPageNo').text()+"&paytype="+paytype+"&cbuyid="+cbuyid+"&cid="+$('#cid').val()+"&selfbuy="+selfbuy;
			}
			
		}
	}
	function close(){window.close()}
	$("#sureBtn").bind("click", havechoose);
	$("#closeBtn").bind("click", close);
});