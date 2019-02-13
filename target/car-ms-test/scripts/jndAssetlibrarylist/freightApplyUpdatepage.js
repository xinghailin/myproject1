define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
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
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('_type', type);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		pushAll();
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);//tax refund file and clearance of goods file download
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询

	});
	
	function _formatPic(src){
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	function type(key) {
		if(key==1){
			return "未审核(Review Unapproved)";
		}if(key==2){
			return "审核通过(Review approved)";
		}if(key==3){
			return "审核不通过(rejected)";
		}if(key==4){
			return "已经撤销(revoked)";
		}
	}
	function operate(id,type){
		var nbsp = "&nbsp;";
		var repeal,update,deleteBtn,look
		if(type==1){
			var repeal = $("<a href='javascript:void(0);' target='_self' name='repealBtn' class='btn63_03' id='"+id+"'/>").html('<span>repeal</span>') ;
			var deleteBtn = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_03' id='"+id+"'/>").html('<span>delete</span>') ;
		}else if(type==4){
			var update = $("<a href='javascript:void(0);' target='_self' name='updateBtn' class='btn63_03' id='"+id+"'/>").html('<span>update</span>') ;
			var deleteBtn = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_03' id='"+id+"'/>").html('<span>delete</span>') ;
		}else if(type==3){
			var deleteBtn = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_03' id='"+id+"'/>").html('<span>delete</span>') ;
		}
		var look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>view</span>') ;
		var html=$('<span />').append(update).append(repeal).append(nbsp).append(look).append(nbsp).append(deleteBtn).html();
		return new handlebars.SafeString(html);
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
	}
	function lookBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#UpdatefreightUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&Updatefreight=2";
	}
	function repealBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		var freightCarupdateUrl=$('#repealfreightUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
		 $.ajax({
            url:freightCarupdateUrl,
            type:'post',
            datatype:'json',
    }).done(function(response) {
		if (response.status) {
			$.dialog('Revocation success！', function(){load($('#J_CurPageNo').text(),PAGE_SIZE);})//加载数据列表)}
		} else {
			$.dialog(response.msg, function(){})
		}
	});
	}
	function updateBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#UpdatefreightUrl').val()+"?id="+theId+"&Updatefreight=1&currpage="+$('#J_CurPageNo').text();
	}
	function deleteBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog('sure delete? otherwise close the dialog box', function(){
			var freightCarupdateUrl=$('#deletefreightUrl').val()+"?id="+theId;
			 $.ajax({
	            url:freightCarupdateUrl,
	            type:'post',
	            datatype:'json',
	    }).done(function(response) {
			if (response.status) {
				$.dialog('delete success！', function(){load(1,10);})
			} else {
				$.dialog(response.msg, function(){})
			}
		});
		});
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
	datepickerUtil.datesTrigger('#createtime', null, null);
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&userCountry="+$('#userCountry').val(); // 查询数据url
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
				$('img').bigic();
				$("a[name='lookBtn']").on("click", lookBtn);
				$("a[name='repealBtn']").on("click", repealBtn);
				$("a[name='updateBtn']").on("click", updateBtn);
				$("a[name='deleteBtn']").on("click", deleteBtn);
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
});
