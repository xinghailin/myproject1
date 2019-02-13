define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
//	datepickerUtil.datesTrigger('#createtime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
//	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatadd', formatadd);
//	var globe_context_id = $('#globe_context_id').val();
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
//		pushAll();
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
//	var log=$('#loginId').val();
	function operate(id){
		var nbsp = "&nbsp;";
		var edit,del,html='';
//		var look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
		edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>编辑(edit)</span>');
		del = $("<a href='javascript:void(0);' target='_self' name='deltBtn' class='btn63_04' id='"+id+"'/>").html('<span>删除(delete)</span>');
		html=$('<span />').html(edit).append(nbsp).append(del).html();
		return new handlebars.SafeString(html);
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
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function lookBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&details=1";
	}
	function delCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog('确定删除吗(Confirm deletion)？', function(){
		var del=$('#deleteUrl').val()+"?id="+theId;
		$.ajax(del, {
			type : 'get', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				$.dialog('删除成功(successfully delete)！', function(){
					load(1,PAGE_SIZE);
				});
			}else{
				$.dialog(response.msg, function(){
				});
			} 
		})});
	}
	function add(){
		location.href=$('#addUrl').val()+"?currpage="+$('#J_CurPageNo').text();
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	function formatadd(type){
		if(type==1){return "加拿大"}
		else if(type==2){return "中东"}
		return "";
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
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				$("a[name='editBtn']").on("click", editCar);
				$("a[name='deltBtn']").on("click", delCar);
//				$("a[name='lookBtn']").on("click", lookBtn);
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
	$("#add").bind("click", add);$("#btnReset").bind("click", reset);
});