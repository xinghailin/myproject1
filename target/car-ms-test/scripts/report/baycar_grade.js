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
	var searchUrl=$('#searchUrl').val();
//	var shopId=$("#hideshopid").val();
	$(function(){
//		pushAll();
		var datetime = new Date();
		var t=datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
		$("#startTime").val(t);$("#endTime").val(t);
		searchCondition = form.serialize();//强制序列化赋予$("#startTime").val(t);$("#endTime").val(t);当天的值
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
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
			}else{
        dataList.show();
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
			    var rs=response.result[0];
				//进店购买等级比例柱状图
			    $("#th").html(rs.time);
				$("#comesize").html(rs.comesize);
				$("#alreadyBuyCar").html(rs.alreadyBuyCar);
				$("#veryHighBuyCar").html(rs.veryHighBuyCar);
				$("#highBuyCar").html(rs.highBuyCar);
				$("#centerBuyCar").html(rs.centerBuyCar);
				$("#bottomBuyCar").html(rs.bottomBuyCar);
				$("#notBuyCar").html(rs.notBuyCar);
				$("#alreadyBuyCarRatio").html('已经购买人数(G):'+rs.alreadyBuyCarRatio);
				$("#veryHighBuyCarRatio").html('购买意愿高的(H):'+rs.veryHighBuyCarRatio);
				$("#highBuyCarRatio").html('购买意愿比较高(A):'+rs.highBuyCarRatio);
				$("#centerBuyCarRatio").html('购买意愿中等(B):'+rs.centerBuyCarRatio);
				$("#bottomBuyCarRatio").html('购买意愿比较低(C):'+rs.bottomBuyCarRatio);
				$("#notBuyCarRatio").html('不买的(N):'+rs.notBuyCarRatio);
				var data = {
					      table:'datatable'
					   };
					   var chart = {
					      type: 'column'
					   };
					   var title = {
					      text: '进店购买等级比例图'   
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
				 $("#th").html(0);
					$("#comesize").html(0);
					$("#alreadyBuyCar").html(0);
					$("#veryHighBuyCar").html(0);
					$("#highBuyCar").html(0);
					$("#centerBuyCar").html(0);
					$("#bottomBuyCar").html(0);
					$("#notBuyCar").html(0);
					$("#alreadyBuyCarRatio").html('已经购买人数:'+0);
					$("#veryHighBuyCarRatio").html('购买意愿高的(H):'+0);
					$("#highBuyCarRatio").html('购买意愿比较高(A):'+0);
					$("#centerBuyCarRatio").html('购买意愿中等(B):'+0);
					$("#bottomBuyCarRatio").html('购买意愿比较低(C):'+0);
					$("#notBuyCarRatio").html('不买的(N):'+0);
					var data = {
						      table:'datatable'
						   };
						   var chart = {
						      type: 'column'
						   };
						   var title = {
						      text: '进店购买等级比例图'   
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
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
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
