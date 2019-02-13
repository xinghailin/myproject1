define(function(require, exports, module) {
//	require('../base/validation-proxy');
	require('jquery-css');
//	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
//	var submitButton = $("#btnSearch");
//	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var glo=$("#globe_context_id").val();
//	var searchCondition = null;
//	var mainview=$('#viewList');
//	var subview=$('#viewEdit');
	handlebars.registerHelper('formatDatetime', _formatDatetime);
	handlebars.registerHelper('lookProcessButton', _lookProcessButton); 
	handlebars.registerHelper('handleButton', _handleButton);
	handlebars.registerHelper('handleButtonall', _handleButtonall);
	$(function() {
		load(1,PAGE_SIZE);
	});
	//表单搜索
	function dataSearch(dataObj){
//		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + '.json'; // 查询数据url
		queryUrl = queryUrl + '?pageStart=' + curPageNo + '&pageSize=' + pageSize;
		$.ajax(queryUrl, {
			type : 'get',
			dataType : 'json'
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
	};
	
	//查看流程图按钮
	function _lookProcessButton(processId,orderId){
		var nbsp = "&nbsp;";
		var add = $("<a href='"+glo+"/snaker/process/display?processId="+processId+"&orderId="+orderId+"' class=''  target='_self' />").html('<span>查看流程图</span>');		
		var html=$('<span />').html(add).append(nbsp).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	
	//处理流程按钮
	function _handleButton(actionUrl,processId,taskId,orderId){
		var nbsp = "&nbsp;";
		var add = $("<a href='"+glo+actionUrl+"?processId="+processId+"&taskId="+taskId+"&orderId="+orderId+"' class='' target='_self' />").html('<span>处理</span>');		
		var html=$('<span />').html(add).append(nbsp).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}	
	//查看流程按钮
	function _handleButtonall(actionUrl,processId,taskId,orderId){
		var nbsp = "&nbsp;";
		var add = $("<a href='"+glo+actionUrl+"?processId="+processId+"&taskId="+taskId+"&orderId="+orderId+"' class='' target='_self' />").html('<span>查看</span>');		
		var html=$('<span />').html(add).append(nbsp).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	//取消按钮事件
	function goback(){
		mainview.show();
		subview.hide();
	}
	
	//变更地接-表单提交
	function submitGuild(){
		if($("#updateGuildId").val() == "" || $("#updateGuildId").val() == 0){
			alert("请选择地接！");
			return;
		}
		$.ajax({
			url : $("#changeUrl").val(),
			type : "post",
			dataType : "json",
			data : {"guildId":$("#updateGuildId").val(),"accountId":$("#accountId").val()},
			success : function(data){
				alert(data.message);
				if(data.status == "1"){
					location.href = location.href;
				}
			},
			error : function(){
				alert("网络异常，请稍后尝试！");
			}
		});
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
});