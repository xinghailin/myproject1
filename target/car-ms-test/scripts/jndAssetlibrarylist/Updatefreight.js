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
	/*require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');*/
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_type', type);
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
	function type(type){//用来判断审核不通过时重新提交审核的车的状态
		if(type==2){
			return "审核通过";
		}else if(type==1){
			return "审核中";
		}
	}
	function operate(id){
		var nbsp = "&nbsp;";
		var look = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>view</span>') ;
		var html=$('<span />').append(look).html();
		return new handlebars.SafeString(html);
	}
	function look2Btn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#detailsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&examine="+"4"+"&Updatefreight="+$('#Updatefreight').val()+"&freightid="+$('#id').val();
	}
	//格式化时间
	function _formatDatetime(datetime) {
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
		var queryUrl = $('#searchUrl').val()+"?id="+$('#id').val(); // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			$('#loginId').val(response.loginId);
			if (response.result.length>0) {
				$('#carp1').html('申请数量(num):'+response.carnum+'辆');
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
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
	var status=true;
	function updatesave(){
		var reg =/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/;
		if($('#name').val().trim().length==0){
			$.dialog("applyName must fill in !", function(){})
			return false;
		}else if(!reg.test($('#fourtorep').val())){
			   $.dialog("please fill in true reachStore!", function(){})
				return false;
	   }else if(!reg.test($('#drayage').val())){
		   $.dialog("please fill in true drayage!", function(){})
			return false;
	   }else if(!reg.test($('#oceanfreight').val())){
		   $.dialog("please fill in true oceanfreight!", function(){})
			return false;
	   }else if(!reg.test($('#brandprice').val())){
		   $.dialog("please fill in true LicenseFees!", function(){})
			return false;
	   }else if(!reg.test($('#surepreinsuranceprice').val())){
		   $.dialog("please fill in true Premium!", function(){})
			return false;
	   }else if(!reg.test($('#surepreoilprice').val())){
		   $.dialog("please fill in true fuel charge!", function(){})
			return false;
	   }else if(!reg.test($('#elsecost1').val())){
			$.dialog("please fill in true elsecost1!", function(){})
			return false;
	   }else if(!reg.test($('#elsecost2').val())){
		    $.dialog("please fill in true elsecost2!", function(){})
			return false;
	   }else{
		var updatefreightsaveUrl=$('#updatefreightsaveUrl').val();
		if(status){
			status=false;
		$.ajax({
			url : updatefreightsaveUrl,
			data : $("#searchForm1").serialize(),
			type : 'post',
			datatype : 'json',
			success : function(data) {
				if (data.status) {
					$.dialog('update success！', function(){location.href=$('#freightApplyUpdatepageUrl').val()+'?currpage='+$('#currpage').val();})
				} else {
					$.dialog(data.msg, function(){})
				}
			}
		}) 
		}
		}
	}
	$("#updatesave").bind("click", updatesave);
});
