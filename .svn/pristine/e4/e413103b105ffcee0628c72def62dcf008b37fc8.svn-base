define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	var PAGE_SIZE = 10;
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
//	$(function() {
//		
//	});
	function passornot(){
		var pass=$("input[name='pass']:checked").val();
		if(pass==1){
			$("#nopasstypediv").hide();
		}else if(pass==2){
			$("#nopasstypediv").show();
		}
	}
	function chooseFun(){
//		var id = $(this).attr('id');
		var realsale = $("#realsaleUrl").val()+"?stepflow="+$("#stepflow").val();
		showDialogue(realsale, 800, 500);
	}
	function showDialogue(url,w,h){
//		var iWidth = w;
//		var iHeight = h;
//		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
//		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var iTop = 100;
		var iLeft = 100;
		var iWidth = window.parent.screen.availWidth - iLeft*2;;
		var iHeight = window.parent.screen.availHeight - iTop*2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
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
    	var pa=$("input[name='pass']:checked").val();
    	if(pa==2){
    		var np=$("input[name='nopasstype']:checked").val();
    		if(np==1){
    			var cc=$("#changeCarId").val();
    			if(!cc){$.dialog("还未选择要换的车", function(){});return false;}
    		}
    		else if(np==2){
    			if(!$("#refundReason").val()){$.dialog("退款原因必填!", function(){});return false;}
    		}
    	}
    		var $url=$('#auditUrl').val()+".json";
    		$.ajax($url, {
    			type : 'POST',
    			dataType : 'json',data:$("#editForm").serialize()
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
				salePrice : {
					numberOrSpace : true
				}
//		,salePrice : {
//			required : true,
//			amount : true
//				}
			},
			messages : {
				salePrice : {
					numberOrSpace : "格式错误"
				}
//			,salePrice : {
//				required : "必填",
//				amount : "格式错误"
//				}
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
	//绑定按钮事件
    $('img').bigic();
	$('#saveBtn').bind("click",yesFun);//$('#backBtn').bind("click",back);$('#noBtn').bind("click",{pass:0},yesFun);
	load(1,PAGE_SIZE);//加载数据列表
	$("input[name='pass']").change(passornot);
	$("#chooseBtn").bind("click",chooseFun);
});
