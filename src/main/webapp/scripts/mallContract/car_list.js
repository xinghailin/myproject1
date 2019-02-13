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
	function _formatStatus(status) {
		if (status === 1) {
			return '杂费待支付';
		}
		else if (status === 2) {
			return '海运费待支付';
		}
		else if (status === 3) {
			return '报关费待支付';
		}
		else if (status === 4) {
			return '尾款待支付';
		}
		else if (status === 5) {
			return '尾款已支付';
		}
		else{
			return "定金待支付";
		}
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

	function _addButton(verifystatus,skucode){
//		    var nbsp = "&nbsp;";
		    var look;
		    if(verifystatus == 1){
		    	 look = $("<a href='javascript:void(0);' target='_self' name='mallDownPaymentAudit' class='btn63_03' skucode='"+skucode+"'/>").html('<span>杂费支付</span>');
		    }else if(verifystatus == 2){
		    	look = $("<a href='javascript:void(0);' target='_self' name='mallDownPaymentAudit' class='btn63_03' skucode='"+skucode+"'/>").html('<span>海运费支付</span>');
		    }else if(verifystatus == 3){
		    	look = $("<a href='javascript:void(0);' target='_self' name='mallDownPaymentAudit' class='btn63_03' skucode='"+skucode+"'/>").html('<span>报关费支付</span>');
		    }else if(verifystatus == 4){
		    	look = $("<a href='javascript:void(0);' target='_self' name='mallDownPaymentAudit' class='btn63_03' skucode='"+skucode+"'/>").html('<span>尾款支付</span>');
		    }else if(verifystatus == 5){
		    	look = $("<a href='javascript:void(0);' target='_self' name='mallDownPaymentAudit' class='btn63_03' skucode='"+skucode+"'/>").html('<span>查看</span>');
		    }else{
		    	look = $("<a href='javascript:void(0);' target='_self' name='mallDownPaymentAudit' class='btn63_03' skucode='"+skucode+"'/>").html('<span>定金支付</span>');
		    }
			var html=$('<span />').append(look).html();
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
				$("a[name='mallDownPaymentAudit']").on("click", mallDownPaymentAudit);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function mallDownPaymentAudit(){//海运费
		location.href=$('#contractordercarauditUrl').val()+"?sku="+$(this).attr('skucode')+"&curpage="+$('#J_CurPageNo').text();  
	}
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
		location.href=$('#lookUrl').val()+"?skucode="+$(this).attr('skucode');  
	}
    function backFun(){
    	//window.history.go(-1);
    	var contract_code = $('#contract_code').val()
    	location.href=$('#backUrl').val()+"?code="+contract_code; 
    }
    

   $('#backBtn').bind("click", backFun);	
	
});

