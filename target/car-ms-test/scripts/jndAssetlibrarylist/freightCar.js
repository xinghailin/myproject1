define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
//	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_formatarrivetime', _formatarrivetime);
	handlebars.registerHelper('_type', type);
	handlebars.registerHelper('_operate', operate);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);//tax refund file and clearance of goods file download
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function type(type){//用来判断审核不通过时重新提交审核的车的状态
		if(type==2){
			return "审核通过";
		}else if(type==1){
			return "审核中";
		}
	}
	function operate(id){
		var nbsp = "&nbsp;";
		var look = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
		var html=$('<span />').append(look).html();
		return new handlebars.SafeString(html);
	}
	function look2Btn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#detailsUrl').val()+"?id="+theId+"&examine=3"+"&freightid="+$('#id').val()+"&username="+$('#username').val();
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
	}
	//格式化图片
	function _formatPic(src){
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	//格式化时间
	function _formatarrivetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	datepickerUtil.datesTrigger('#createtime', null, null);
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val()+"?id="+$('#id').val(); // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			$('#loginId').val(response.loginId);
			if (response.result.length>0) {
				$('#carp1').html('申请数量:'+response.carnum+'辆');
				dataList.html(template(response)).css('height', 'auto');
//				pagination.init({
//					'pageSize' : PAGE_SIZE,
//					'totalCount' : response.num,
//					'load' : load,
//					'currentPage' : curPageNo
//				});
//				$('#J_CurPageNo').text(curPageNo);
				$("a[name='look2Btn']").on("click", look2Btn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
	function reset() {       
		form[0].reset();
	}
	function Updateback(){
		location.href=$('#freightApplyUpdatepageUrl').val()+'?currpage='+$('#currpage').val();
	}
	function cancel(){
		location.href=$('#freightpageUrl').val()+'?currpage='+$('#currpage').val();
	}
	function back(){
		location.href=$('#freightpageUrl').val()+'?currpage='+$('#currpage').val();
	}
	var status=true;
	function submit(){
		var freightCarupdateUrl=$('#freightCarupdateUrl').val()+"?id="+$('#id').val()+"&currpage="+$('#currpage').val();
		 if(status){
		status=false; 
		$.ajax({
             url:freightCarupdateUrl,
             type:'post',
             datatype:'json',
             data:{username:$('#username').val()}
     }).done(function(response) {
		if (response.status) {
			$.dialog('审核通过！', function(){location.href=$('#freightpageUrl').val()+'?currpage='+$('#currpage').val();})
		} else {
			$.dialog(response.msg, function(){})
		}
	});}
	}
	function submit1(){
		var c=$('#reason').val();
		if (c.trim().length==0) {
			$.dialog("审核不通过原因必填！", function(){})
		}else{
			var freightCarupdateUrl=$('#freightCarNoPassUrl').val()+"?id="+$('#id').val()+"&currpage="+$('#currpage').val();
			if(status){
			status=false; 
			$.ajax({
		        url:freightCarupdateUrl,
		        type:'post',
		        datatype:'json',
	            data:{reason:$('#reason').val(),username:$('#username').val()}
			 }).done(function(response) {
					if (response.status) {
						$.dialog('提交成功！', function(){location.href=$('#freightpageUrl').val()+'?currpage='+$('#currpage').val();})
					} else {
						$.dialog(response.msg, function(){})
					}
				});
			}
		}
	}
	$("#back").bind("click", back);
	$("#cancel").bind("click", cancel);
	$("#submit").bind("click",submit);
	$("#submit1").bind("click",submit1);
});
