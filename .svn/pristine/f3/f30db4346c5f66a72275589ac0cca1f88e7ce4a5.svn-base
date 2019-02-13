define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#sstarttime', null, null);
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
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_formatarrivetime', _formatarrivetime);
	handlebars.registerHelper('_checkstatus', _checkstatus);
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
	function _checkstatus(key) {
		if(key==1){
			return "upToStandard";
		}}
	function operate(id,fstatus){
		var nbsp = "&nbsp;";
		if (fstatus==null) {
			var look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>file download & upload</span>') ;
		}else{
			var look = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>file download</span>') ;
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
	function lookBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#editUrl').val()+"?carid="+theId+"&currpage="+$('#J_CurPageNo').text()+"&fileStatus="+1;
	}
	function look2Btn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#editUrl').val()+"?carid="+theId+"&currpage="+$('#J_CurPageNo').text()+"&fileStatus="+2;
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
