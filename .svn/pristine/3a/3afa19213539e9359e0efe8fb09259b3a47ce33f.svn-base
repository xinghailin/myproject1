define(function(require, exports, module) {
	require('jquery-css');
//	require('art-dialog')($);
	var pagination = require('../base/pagination');
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
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('formatPic', _formatPic);
	handlebars.registerHelper('contracttype', contracttype);
	handlebars.registerHelper('_statuss', status);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);//tax refund file and clearance of goods file download
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	datepickerUtil.datesTrigger('#appointtimes', null, null);
	function _formatPic(src){
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	/**
	 * 新老数据状态临时用
	 */
	function contracttype(contracttype){
		if(contracttype!=null){
			return "new data";
		}else{
			return "old data";
		}
	}
	function status(status,country,datatype){
		if(status==1&&country==1&&datatype!=2){
			return "已入加拿大仓库(vehicle in Canada warehouse)";
		}else if(status==1&&country==2&&datatype!=2){
			return "已入中东仓库(vehicle in the Middle East warehouse)";
		}else if(status==1&&datatype==2){
			return "已入境外港口(vehicle in the overseas port)";
		}else if(status==2){
			return "报关出库(customs clearance outbound)";
		}else if(status==3){
			return "退税文件已经上传(tax rebate file uploaded)";
		}else if(status==4){
			return "已到保税库(In bonded warehouse)";
		}else if(status==5){
			return "出库至中国资产库(Outbounded to China Asset Warehouse)";
		}else if(status==6){
			return "已到中国资产库(In China Asset Warehouse)";
		}else if(status==0){
			return "未入库(vehicle not in warehouse)";
		}
	}
	function _checkstatus(key) {
		if(key==1){
			return "upToStandard";
		}}
	function operate(id,status){
		var nbsp = "&nbsp;";
		if (status==0) {
			var look = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>bePutInStorage</span>') ;
		}
		var html=$('<span />').append(look).html();
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
	//格式化时间
	function _formatarrivetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
	}
	
	function look2Btn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&userCountry="+$('#userCountry').val();
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
//	function pushAll(){
//		var styleLst=$('#address');
//		var slo=styleLst.find('option');
//		var ss=slo.size();
//		for(var i=0;i<ss;i++){
//			if(slo[i].value){sArr.push(slo[i]);}
//		}
//	}
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
			$('#loginId').val(response.loginId);
			if (response.result.length>0) {
				if(response.carp3==1){
				$('#carp1').html('车辆价格总和(vehicle price summation.):'+response.carp1+'&nbspC$');
				$('#carp2').html('车辆成本价格总和(Total vehicle cost price):'+response.carp2+'&nbspC$');
				}else if(response.carp3==2){
				$('#carp1').html('车辆价格总和(vehicle price summation.):'+response.carp1+'&nbsp$');
				$('#carp2').html('车辆成本价格总和(Total vehicle cost price):'+response.carp2+'&nbsp$');
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
	$("#btnReset").bind("click", reset);
});