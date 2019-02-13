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
	handlebars.registerHelper('_formatOrderstatus', _formatOrderstatus);
	handlebars.registerHelper('_formatCarstatus', _formatCarstatus);
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

	//格式化 订单状态
	function _formatOrderstatus(status) {
		if (status === 1) {
			return '未核实';
		}
		if (status === 2) {
			return '废弃';
		}
		if (status === 3) {
			return '未完成';
		}
		if (status === 5) {
			return '已完成';
		}
		
		return "**";
	}
	
	//格式化 订单状态
	function _formatCarstatus(carstatus) {
		if (status === 1) {
			return '购车定金已支付，当地杂费待支付';
		}
		else if (status === 2) {
			return '当地杂费已支付，海运费用待支付';
		}
		else if (status === 3) {
			return '海运费用已支付，报关费用待支付';
		}
		else if (status === 4) {
			return '报关费用已支付，提车尾款待支付 ';
		}
		else if (status === 5) {
			return '提车尾款已支付';
		}else{
			return '购车定金待支付';
		}
		return "**";
	}
	function _addButton(id,orderstatus){
		    var nbsp = "&nbsp;";
		    var check = "&nbsp;";
			var look = $("<a href='javascript:void(0);' target='_self' name='viewlookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>');
			var html=$('<span />').append(check).append(nbsp).append(look).append(nbsp).html();
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
				$("a[name='viewCheckBtn']").on("click", viewCheck);
				$("a[name='viewlookBtn']").on("click", viewLook);
				$("[name='orderCodes']:checkbox").bind("click", function() {
					var th = $(this)
					if (th.prop("checked")) {
						if (arr[th.val()]) {
						} else {
							arr[th.val()] = 1
						}
					} else {
						if (arr[th.val()]) {
							delete arr[th.val()]
						}
					}
				});
				
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
	
	function viewCheck(){
		location.href=$('#checkUrl').val()+"?id="+$(this).attr('id');
	}
	
	function viewLook(){
		location.href=$('#lookUrl').val()+"?id="+$(this).attr('id');  
	}
		

	
	$("#btnAddContract").bind("click", addContract);
	$("#backBtn").bind("click", backFun);
	
	function addContract() {  
		if(Object.keys(arr).length === 0){
			alert("请至少添加一条记录。");
		}else{
			var ids = JSON.stringify(arr);
			location.href=$('#addContractUrl').val()+"?orderCodes="+ids;  
		}
		
		
	}
	
	  
    function backFun(){
    	//window.history.go(-1);
    	location.href=$('#backUrl').val();  
    	
    }
	
});

//全选 反选
function checkAllOrder() {
	$("[name = 'orderCodes']:checkbox").each(function() {
		var th = $(this)
		th.prop("checked", !th.prop("checked"));
		if (th.prop("checked")) {
			if (arr[th.val()]) {
			} else {
				arr[th.val()] = 1
			}
		} else {
			if (arr[th.val()]) {
				delete arr[th.val()]
			}
		}
	});
}
