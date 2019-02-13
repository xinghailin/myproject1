define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leavefactime', null, null);
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
	handlebars.registerHelper('_formatAuditStatus', _formatAuditStatus);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_formatinbondedtime', _formatinbondedtime);
	handlebars.registerHelper('_checkstatus', _checkstatus);
	handlebars.registerHelper('formatPic', _formatPic);
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
	function _formatAuditStatus(key){
		if(key == 2){
			return"已经报关出库";
		}else if(key == 4){
			return "已到保税库";
		}else if(key == 5){
			return "到中国资产库审核中";
		}else if(key == 6){
			return "已到中国资产库";
		}else if(key == 8){
			return "待入中国资产库";
		}
		return '';
	}
	function _checkstatus(key) {
		if(key==1){
			return "upToStandard";
		}}
	function operate(id,status){
		var nbsp = "&nbsp;";
		 if(status==8){
			var look = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>编辑</span>') ;
		}
		//var look3 = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
		//var html=$('<span />').append(look).append(nbsp).append(look3).html();
		 var html=$('<span />').append(look).append(nbsp).html();
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
	//格式化图片
	function _formatPic(src){
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	//计算保税区滞留时间
	function _formatinbondedtime(datetime) {
		if (datetime === null) {
			return '';
		}
		var date2 = new Date();  
		var date3 = date2.getTime() - new Date(datetime).getTime(); 
	    return Math.floor(date3/(24*3600*1000))+1;
	}
	function lookBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#editUrl').val()+"?carid="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function look2Btn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#typeinUrl').val()+"?carid="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function look3Btn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#detailsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&examine="+"1";
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			$('#loginId').val(response.loginId);
			if (response.result.length>0) {
				if(response.carp3==1){
				$('#carp1').html('车辆价格总和(vehicle price summation.):'+response.carp1+'&nbsp'+'C$');
				$('#carp2').html('车辆成本价格总和(Total vehicle cost price):'+response.carp2+'&nbsp'+'C$');
				}else if(response.carp3==2){
				$('#carp1').html('车辆价格总和(vehicle price summation.):'+response.carp1+'&nbsp'+'$');
				$('#carp2').html('车辆成本价格总和(Total vehicle cost price):'+response.carp2+'&nbsp'+'$');
				}else{
					$('#carp1').html('');
					$('#carp2').html('');	
				}
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
				$("a[name='look2Btn']").on("click", look2Btn);
				$("a[name='look3Btn']").on("click", look3Btn);
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
