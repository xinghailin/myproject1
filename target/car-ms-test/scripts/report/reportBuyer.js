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
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#startTime', null, null);
	datepickerUtil.datesTrigger('#endTime', null, null);

	var searchUrl=$('#searchUrl').val();
//	var shopId=$("#hideshopid").val();
//Highcharts 库使用 json 格式来配置。
	$(function(){
//		pushAll();
		
		var datetime = new Date();
		var t=datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
		$("#startTime").val(t);$("#endTime").val(t);
		searchCondition = form.serialize();//强制序列化赋予$("#startTime").val(t);$("#endTime").val(t);当天的值
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
//		$("table[className='tb_mian']").attr("id","datatable");
//		alert($("table.tb_mian").html());
	});
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
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
	
	//分页数据加载
	function load(curPageNo, pageSize) {
		var c=document.getElementById('startTime').value;
		var d=document.getElementById('endTime').value;
		if(c>d){
			alert("开始时间不能大于结束时间!");
			}else{        dataList.show();
		noDataMsg.hide();
		var queryUrl = searchUrl + ".json"; // 
		$.ajax(queryUrl, {
			type : 'GET',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
//				alert($("table.tb_mian").html());
				/*$("table.tb_mian").attr("id","datatable");*/
				//进店购买比率图表
				var rs=response.result[0];
//				alert(result);
				$("#tin").html(rs.b);
				$("#tok").html(rs.c);
				$("#th").html(rs.a+' '+'成交率：'+rs.d+'%');
				var data = {
						
					      table:'datatable'
					   };
					   var chart = {
					      type: 'column'
					   };
					   var title = {
					      text: '进店购买比率图表'   
					   };      
					   var yAxis = {
					      allowDecimals: false,
					      title: {
					         text: '人数'
					      }
					   };
					   var tooltip = {
					      formatter: function () {
					    	  return '<b>' + this.series.name +' '+this.point.y + '人'+'</b><br/>' +
					            this.point.name.toLowerCase();
					      }
					   };
					   var credits = {
					      enabled: false
					   };  
					   var json = {};   
					   json.chart = chart; 
					   json.title = title; 
					   json.data = data;
					   json.yAxis = yAxis;
					   json.credits = credits;  
					   json.tooltip = tooltip;  
					   $('#container').highcharts(json); 
			} else {
				
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
				
				$("#tin").html(0);
				$("#tok").html(0);
				$("#th").html('成交率：'+0+'%');
				var data = {
					      table:'datatable'
					   };
					   var chart = {
					      type: 'column'
					   };
					   var title = {
					      text: '进店购买比率图表'   
					   };      
					   var yAxis = {
					      allowDecimals: false,
					      title: {
					         text: '人数'
					      }
					   };
					   var tooltip = {
					      formatter: function () {
					         return '<b>' + this.series.name + '</b><br/>' +
					            this.point.y + ' ' + this.point.name.toLowerCase();
					      }
					   };
					   var credits = {
					      enabled: false
					   };  
					   var json = {};   
					   json.chart = chart; 
					   json.title = title; 
					   json.data = data;
					   json.yAxis = yAxis;
					   json.credits = credits;  
					   json.tooltip = tooltip;  
					   $('#container').highcharts(json); 
			}
		
		});
	};	
	// 重置
	function reset() {       
		form[0].reset();
	}
	function back() {       
		location.href=$('#backUrl').val();
	}
	$("#btnReset").bind("click", reset);
	
	require('../base/exporting');
	require('../base/data');
	}});
