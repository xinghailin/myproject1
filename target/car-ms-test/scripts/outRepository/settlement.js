define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	require('../base/validation-proxy');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	var PAGE_SIZE = 10;
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
//	$(function() {
//		load(1,PAGE_SIZE);//加载数据列表
//	});
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {infoId:$('#infoId').val()}
		}).done(function(response) {
			if (response.result.length>0) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				//绑定列表按钮事件处理函数
//				$('img').bigic();
//				$("a[name='editBtn']").on("click", editCar);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
    function yesFun(pass){//var parm=pass.data.pass;
    	if(!$("#settlement").val()){$.dialog("请先进行结算再保存！", function(){});return false;}
    		var $url=$('#auditUrl').val()+".json";
    		$.ajax($url, {
    			type : 'POST',
    			dataType : 'json',
    			data:$("#editForm").serialize()
    		}).done(function(response) {
    		
    			if (response.status=='1') {
    				$.dialog("操作成功！", function(){location.href=$('#backUrl').val();});
    			} else {
    				$.dialog("稍后再试", function(){});
    			}
    		});
}
    function validateAddForm() {
		$("#editForm").validate({
			rules : {
				insurePricer : {
					required:true,
					amount : true
				},buyTaxr : {
			required : true,
			amount : true
				},cardPricer : {
				required : true,
				amount : true
					},qualityguarPricer : {
					required : true,
					amount : true
						},delayguarPricer : {
						required : true,
						amount : true
							},decoratePricer : {
							required : true,
							amount : true
								}
							},
			messages : {
				insurePricer : {
					required:"必填",
					amount : "格式错误"
				},buyTaxr : {
			required : "必填",
			amount : "格式错误"
				},cardPricer : {
				required : "必填",
				amount : "格式错误"
					},qualityguarPricer : {
					required : "必填",
					amount : "格式错误"
						},delayguarPricer : {
						required : "必填",
						amount : "格式错误"
							},decoratePricer : {
							required : "必填",
							amount : "格式错误"
								}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#editForm").valid();
	}
    function back() {       
    	location.href=$('#backUrl').val();
	}
//    function noPass() { //审核不通过      
//    	var $url=$('#auditUrl');
//		$.ajax($url.val(), {
//			type : 'get',
//			dataType : 'json',data:{taskId:$('#taskId').val()}
//		}).done(function(response) {
//			if (response.status=='1') {
//				$.dialog("操作成功", function(){location.href=history.back();});
//			} else {
//				$.dialog("稍后再试", function(){});
//			}
//		});
//	}
    function calc(){
    	if(validateAddForm()){
//    		if(!$("#settlement").val()){
    	var $url=$('#calcUrl').val()+".json";
    	$.ajax($url, {
			type : 'POST',
			dataType : 'json',data:$("#editForm").serialize()
		}).done(function(response) {
			if (response.status=='1') {
//				$.dialog("操作成功！", function(){location.href=$('#backUrl').val();});
				$("#settlement").val(response.calc);
			} else {
				$.dialog("稍后再试", function(){});
			}
		});}
    }
	//绑定按钮事件
    load(1,PAGE_SIZE);//加载数据列表
    $('img').bigic();
	$('#saveBtn').bind("click",{pass:1},yesFun);//$('#backBtn').bind("click",back);
	$('#noBtn').bind("click",{pass:0},yesFun);
	$('#calcBtn').bind("click",calc);
});
