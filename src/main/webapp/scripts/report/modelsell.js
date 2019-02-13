define(function(require, exports, module) {
	require('../base/highcharts');
	require('jquery-css');
	var pagination = require('../base/pagination.js');
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
	
	//热门车型图饼图
	 var chart;    
     $(function () {
             chart = new Highcharts.Chart({
                 //常规图表选项设置
                 chart: {
                     renderTo: 'container',        //在哪个区域呈现，对应HTML中的一个元素ID
                     plotBackgroundColor: null,    //绘图区的背景颜色
                     plotBorderWidth: null,        //绘图区边框宽度
                     plotShadow: false            //绘图区是否显示阴影            
                 },
                 //图表的主标题
                 title: {
                     text: '热门车型图'
                 },
                 //当鼠标经过时的提示设置
                 //每种图表类型属性设置
                 plotOptions: {
                     //饼状图
                     pie: {
                         allowPointSelect: true,
                         cursor: 'pointer',
                         dataLabels: {
                             enabled: true,
                             color: '#000000',
                             connectorColor: '#000000',
                             formatter: function() {
                                 //Highcharts.numberFormat(this.percentage,2)格式化数字，保留2位精度
                                 return '<b>'+ this.point.name +'</b>: '+
                                 Highcharts.numberFormat(this.percentage,2) +' %';
                             }
                         }
                     }
                 },
                    //图表要展现的数据
                 series: [{
                     type: 'pie',
                     name: '成交率(%)'
                 }]
             });
         load();
     });
	function load(curPageNo, pageSize) {
		
		var c=document.getElementById('startTime').value;
		var d=document.getElementById('endTime').value;
		if(c>d){
			alert("开始时间不能大于结束时间!");
			}else{
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
				
		              //热门车型图饼图赋值
					   browsers = [];
					   //var tbody = "";
					   var obj=response.result;
//					   alert(obj);
					   $.each(obj,function(n,value){
						   //alert(n+' '+value);
						   
				             browsers.push([value.model,value.sellRatio]);
					   });
					   chart.series[0].setData(browsers);
					
				
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
				 //热门车型图饼图赋值
				   browsers = [];
				   //var tbody = "";
				   var obj=response.result;
//				   alert(obj);
				   $.each(obj,function(n,value){
					   //alert(n+' '+value);
					   
			             browsers.push([value.model,value.sellRatio]);
				   });
				   chart.series[0].setData(browsers);
				
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
