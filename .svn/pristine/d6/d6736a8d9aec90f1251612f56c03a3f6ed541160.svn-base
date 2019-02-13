define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_operate', _operate);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	var type=$('#type').val();
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function _operate(id,receiveNum,auditNum){
		var look,look1,html;
		var nbsp = "&nbsp;";
		if(type==1){
			 look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看记录</span>') ;
		}else if(type==2&(receiveNum>0||auditNum>0)){
			 look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>接收与领取审核材料</span>') ;
		}else if(type==3){
			 look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>领取材料</span>') ;
		}else if(type==4){
			 look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>记录详情</span>') ;
			 look1 = $("<a href='javascript:void(0);' target='_self' name='lookBtn1' class='btn63_03' id='"+id+"'/>").html('<span>总记录</span>') ;
		}
		 html=$('<span />').append(look).append(nbsp).append(look1).html();
		return new handlebars.SafeString(html);
	}
	function lookBtn(){
		var theId=$(this).attr('id');
		location.href=$('#CarAccessorydetailsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&type="+type;
	}
	function lookBtn1(){
		var theId=$(this).attr('id');
		location.href=$('#allCarAccessorydetailsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&type="+type;
	}
	
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	function load(curPageNo, pageSize) {
		
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&type="+type; // 查询数据url
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
				if(type==1){
					$(".nums").css('display','none');
				}
				$('#J_CurPageNo').text(curPageNo);
				$("a[name='lookBtn']").on("click", lookBtn);
				$("a[name='lookBtn1']").on("click", lookBtn1);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function reset() {       
		form[0].reset();
	}
	function  addCarSource(){
		location.href=$('#addCarAccessoryUrl').val();
	}
	$("#btnReset").bind("click", reset);
	$("#addCarSource").bind("click", addCarSource);
});
