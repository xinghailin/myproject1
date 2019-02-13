define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 20;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#payDateTime', null, null);
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDate', _formatSimpleDate);
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_formatRemaindays', _formatRemaindays);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		
	});


	
	
	//格式化时间
	function _formatSimpleDate(datetime) {
		if (datetime === null) {
			return '';
		}
		
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
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
	//格式化状态
	function _formatStatus(status) {
		if (status === 2) {
			return '库存中';
		}
		if (status === 4) {
			return '已出库';
		}
		if (status === 3) {
			return '审核不通过';
		}
		
		return "待审核";
	}
	//格式超时时间
	function _formatRemaindays(remainstatus,remaindays,status) {
		if (remainstatus === 5) {
			return '未放款';
		}
		
		/*if (remainstatus === 7) {
			return '没有对应的库融池';
		}*/
		if (remainstatus === 6) {
			if (status === 2) {
				if(remaindays >= 0){
					return remaindays;
				}else{
					remaindays="<span style='color:red;'>"+(remaindays+"").replace("-","超时")+"天"+"</span>";
					return new handlebars.SafeString(remaindays);
				}
			}

		}
		
		return "";
	}
	
	//表单搜索
	function dataSearch(dataObj){
		/*var remainstatus =$("#remainstatus").val();
		var poolid =$("#poolid").val();
		
		if(1==remainstatus|| 2==poolid){
			if(null ==poolid || ''==poolid){
				alert("选中是否超时 必须选库融池");
				return;
			}
			
		}*/
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&batnum=1"; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if(response.status){
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
			}else{
				alert(response.msg);
			}

		});
	};
	

	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);

});
