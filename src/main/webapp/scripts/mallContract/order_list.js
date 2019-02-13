var arr={};
define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSealstatus', _formatSealstatus);
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_addButton', _addButton);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});

	//格式化 流程步骤
	function _formatSealstatus(status) {
		if (status === 1) {
			return '未审核';
		}
		if (status === 2) {
			return '审核不通过';
		}
		if (status === 3) {
			return '审核通过';
		}
		if (status === 4) {
			return '盖章不成功';
		}
		if (status === 5) {
			return '盖章成功';
		}
		
		return "**";
	}
	
	//格式化 合同状态
	function _formatStatus(status) {
		if (status === 1) {
			return '正常';
		}
		if (status === 3) {
			return '作废';
		}
		
		return "**";
	}
	// 格式化时间
	function _formatSimpleDatetime(datetime) {
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

	function _addButton(code){
		    var nbsp = "&nbsp;";
			var look = $("<a href='javascript:void(0);' target='_self' name='viewlookBtn' class='btn63_03' code='"+code+"'/>").html('<span>查看订单车辆</span>');
			var html=$('<span />').append(look).append(nbsp).html();
			return new handlebars.SafeString(html); 
		
	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
		searchCondition = form.serialize();
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
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
				//绑定列表按钮事件处理函数
				$("a[name='viewlookBtn']").on("click", viewLook);
				
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
    
	function reset() {       
		form[0].reset();
	}
	
	$("#btnReset").bind("click", reset);
	
    function viewdel(){
    	var url = $('#checkUrl').val();
    	var id= $(this).attr('id');
    	$.ajax(url, {
			type : 'POST',
			dataType : 'json',
			data : {id:id}
		}).done(function(response) {
			if (response.rescode=='1') {
			    	alert(response.result);
			} else {
				alert("提示："+response.result);
			}
			window.location.reload(); 
		});
    }
	
	function viewLook(){
		var contract_code  = $('#sealapplycode').val();
		location.href=$('#lookUrl').val()+"?code="+$(this).attr('code')+"&contract_code="+contract_code;  
	}
    function backFun(){
    	//window.history.go(-1);
    	location.href=$('#backUrl').val()
    	
    }
    

   $('#backBtn').bind("click", backFun);	
	
});

