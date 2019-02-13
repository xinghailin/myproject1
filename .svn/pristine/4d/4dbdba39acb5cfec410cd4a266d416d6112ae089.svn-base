define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	handlebars.registerHelper('operate', operate);
//	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
//		pushAll();
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
	function operate(id){
//		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01 margin_let10' id='"+id+"'/>").html('<span>修改</span>');
		var del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02 margin_let10' id='"+id+"'/>").html('<span>删除</span>');
		var html=$('<span />').html(edit).append(del).html();
		return new handlebars.SafeString(html);
	}
	//格式化图片
	function _formatPic(src){
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	function editCar(){
		window.location.href=$('#addUrl').val()+"?id="+theId;
	}
	function addCar(){
		window.location.href=$('#addUrl').val();
	}
	function delCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog('确定删除？', function(){
			$.ajax({
				type : "POST",
				url : $("#delUrl").val()+".json",
				dataType : "json",
				data : {"id":theId},
				async : false,
				success : function(response) {
					if (response.status=="1") {
						load(1,PAGE_SIZE);
					}else{$.dialog('稍后再试', function(){})}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('请稍后重试!', function(){});
				}
			});
		});
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
		var queryUrl = $('#searchUrl').val() + ".json?page="+curPageNo+"&size="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.lst.length>0) {
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
				$("a[name='editBtn']").on("click", editCar);
				$("a[name='delBtn']").on("click", delCar);
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
	}$("#btnAdd").bind("click", addCar);
	$("#btnReset").bind("click", reset);
//	$(function(){
//		$msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
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