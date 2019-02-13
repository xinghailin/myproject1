define(function(require, exports, module) {
	require('../base/highcharts');
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
//	var datepickerUtil = require('../base/datepicker-util');	
//	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
//	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
//	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#startTime', null, null);
	datepickerUtil.datesTrigger('#endTime', null, null);
//	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
//	handlebars.registerHelper('_formatStatus', _formatStatus);
////	handlebars.registerHelper('_formatAddress', _formatAddress);
////	handlebars.registerHelper('addButton', _addButton);
//	handlebars.registerHelper('formatPic', _formatPic);
	var searchUrl=$('#searchUrl').val();
//	var shopId=$("#hideshopid").val();
	$(function(){
//		pushAll();
		var datetime = new Date();
		var t=datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
		$("#startTime").val(t);
		$("#endTime").val(t);
		searchCondition = form.serialize();//强制序列化赋予$("#startTime").val(t);$("#endTime").val(t);当天的值
		load(1,PAGE_SIZE);//加载数据列表
			 submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});

	$(document).ready(function() {  
		 
		});

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
	

	function load(curPageNo, pageSize) {
		var c=document.getElementById('startTime').value;
		var d=document.getElementById('endTime').value;
		if(c>d){
			alert("开始时间不能大于结束时间!");
			}else{
		var x = [];//X轴
	    var y = [];//Y轴
	    var xtext = [];//X轴TEXT
	    var color = ["gray","pink","red","blue","yellow","green","#fff"];
        dataList.show();
		noDataMsg.hide();
		var queryUrl =searchUrl + ".json?start="+curPageNo+"&pageSize="+pageSize;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				//平均价格图表定义X轴Y轴
				for ( var key in response.result) {
		           	response.result[key].y=response.result[key].carAvgPrice;
		          	response.result[key].color= color[key];
		        	//xtext=response.result[key].todaycar;
		        	xtext.push(response.result[key].todaycar);
					}
		           chart.series[0].setData(response.result)
		           
		           pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				//绑定列表按钮事件处理函数
			$("a[name='applyMove']").on("click", applyMove);
				$("a[name='outRep']").on("click", outRep);
				$('img').bigic();
			
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
		//平均价格图表
		
		var chart = new Highcharts.Chart({
			
			chart:{
				renderTo:'container',
				type:'column' //显示类型 柱形
			},
			
			title:{
				text:'平均价格图表' //图表的标题
			},
			xAxis:{
				categories:xtext
			},
			yAxis:{
				title:{
					text:'价格(元)' //Y轴的名称
				},
			},
			series:[{
				name:"平均价格(元)",
			}]
		});
			}};	
	
	//添加操作按钮
	function _addButton(id){
		var nbsp = "&nbsp;";
		var record = $("<a href='javascript:void(0);' class='btn63_03' target='_self' name='applyMove' class=''  id='"+id+"'/>").html("申请移库");
		var detail = $("<a href='javascript:void(0);' class='btn63_03' target='_self' name='outRep'  id='"+id+"'/>").html("购车出库");
		var html=$('<span />').html(record).append(nbsp).append(detail).html();
		return new handlebars.SafeString(html);
	}
	// 重置
	function reset() {       
		form[0].reset();
	}
	function back() {       
		location.href=$('#backUrl').val();
	}
	$("#btnReset").bind("click", reset);
	require('../base/data');
	require('../base/exporting');
});
