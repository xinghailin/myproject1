define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
//	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_formatAddress', _formatAddress);
	handlebars.registerHelper('formatPic', _formatPic);
//	handlebars.registerHelper('_operate', operate);
	$(function() {
		pushAll();
//		var cur=$('#currpage').val();
//		if(cur)load(cur,PAGE_SIZE);
//		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
//		var $msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//		$("#btnExcel").click(
//				function(){
//					form.submit();
//				});
	});
	//操作按钮
//	function _addButton(id){
//		var nbsp = "&nbsp;";
//		var edit = $("<a href='javascript:void(0);' target='_self' name='auditBtn' class='btn63_03' id='"+id+"'/>").html('<span>审核</span>');
//		var html=$('<span />').html(edit).append(nbsp).html();
//		return new handlebars.SafeString(html); 
//	}
	function operate(id,vin){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' vin='"+vin+"' id='"+id+"'/>").html('<span>选择</span>');
		var html=$('<span />').html(edit).html();
		return new handlebars.SafeString(html);
	}
	//格式化图片
	function _formatPic(src){
		var globe_context_id = $('#globe_context_id').val() ;
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');var vin=$this.attr('vin');
//		window.location.href=$('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
		window.opener.document.getElementById("changeCarId").value=theId;
		window.opener.document.getElementById("changeCarVin").value=vin;
		window.close();
	}
	//格式化审核状态
	function _formatStatus(key) {
		if(key == 1){
			return '库存车辆';
		}else if(key == 2){
			return '移库中';
		}else if(key == 3){
			return '已移库门店';
		}else if(key == 4){
			return '购车出库中';
		}else if(key == 5){
			return '已销售';
		}
		return '';
	}
	//格式化仓库地址
	function _formatAddress(key) {
		if(key)
		for(var len=sArr.length,i=0;i<len;i++){
		if(key == sArr[i].value){
			return sArr[i].text;
		}}
		return '';
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
	function pushAll(){
		var styleLst=$('#address');
		var slo=styleLst.find('option');
		var ss=slo.size();
		for(var i=0;i<ss;i++){
			if(slo[i].value){sArr.push(slo[i]);}
		}
	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//审核操作
//	function auditFun(){
//		var $this=$(this);
//		var theId=$this.attr('id');
//		window.location.href=$('#auditUrl').val()+"?id="+theId;
//	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
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
//				$("a[name='viewBtn']").on("click", viewCars);
//				$("a[name='auditBtn']").on("click", auditFun);
				$('img').bigic();
//				$("a[name='editBtn']").on("click", editCar);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
	//绑定新增按钮事件
//	$('#saveBtn').bind("click",saveFun);
	// 重置
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
//	$(function(){
//		$msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
	function havechoose(){
		var c=$("input[name='carID']:checked");
		if(c.length>0){
			var theId=c.attr('value');var vin=c.attr('vin');
			var step=$("#stepflow").val();
//			alert(theId+"=="+vin+"=="+step+"==");
			if(step==1){
				window.opener.document.getElementById("carId").value=theId;
			}
			else if(step==2){
			var $doc=$(window.opener.document);$doc.find("#changeCarId").val(theId);$doc.find("#changeCarVin").attr("value",vin).val(vin);
			}
			window.close();
		}
		else{
			$.dialog("请选择车辆！", function(){});
		}
	}
	$("#sureBtn").bind("click", havechoose);
});
//显示头像
function showPic(a, sUrl) {
	var x, y;
	var event = a ? a : window.event;
	var mX = event.x ? event.x : event.pageX;
	var my = event.y ? event.y : event.pageY;
	x = event.clientX;
	y = event.clientY;
	var div = $("#imgLayer");
	div.css("left",x);
    div.css("top",y);
    div.css("left",mX+10+"px");
    div.css("posTop",my+10 +"px");
    div.html("<img style='float:left;'  heith='160' width='160'  src=\"" + sUrl + "\">") ;
    div.css("display","block");
}
//隐藏头像
function hiddenPic() {
	var div = $("#imgLayer");
	div.html("") ;
	div.css("display","none");
}