define(function(require, exports, module) {
	require('jquery-css');
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
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_operate', operate);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		pushAll();
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		
	});
	function operate(id,status){
		var html;
		var edit;
		if (status==1) {
		 edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_04' id='"+id+"'/>").html('<span>查看</span>');
		}else{
		 edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>处理</span>');
		}
		 html=$('<span />').html(edit).html();
		return new handlebars.SafeString(html);
	}
	//格式化图片
	function _formatPic(src){
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	//格式化审核状态
	function _formatStatus(key,ss) {
		if(ss ==null){
			return '未处理';
		}else if(ss == 1){
			return '已处理';
		}
		if(key ==null||key==''){
			return '未处理';
		}else if(key == 1){
			return '已处理';
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
});
