define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDate', _formatSimpleDate);
	
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		
		 $('#brandinitial').bind('change', selectBrand);
		 $('#brand').bind('change', selectModel);
		 $('#model').bind('change', selectVersion);
	});
	function selectBrand(){
		 $('#brand option').remove();
	     $('#model option').remove();
	     $('#version option').remove();
	  var brandinitial = $("#brandinitial").val();
      var modelUrl=$('#brandUrl').val();
       $.ajax(modelUrl,{
       	type: "post",
           data: {brandinitial: brandinitial},
           datatype: "json",
           success: function (data) {
           	var brand=data.abrand;
           	 var ddl = $("#brand");
                ddl.append("<option value=''>请选择</option>");
               $.each(brand, function (idx, val) {
               	ddl.append($("<option value='"+val.brand+"'>" + val.brand + "</option>"))
               })
           }
       })
	}
	function selectModel(){
	 $('#model option').remove();
	 $('#version option').remove();
	  var brand = $("#brand").val();
      var modelUrl=$('#modelUrl').val();
       $.ajax(modelUrl,{
       	type: "post",
           data: {brand: brand},
           datatype: "json",
           success: function (data) {
           	var model=data.model;
           	 var ddl = $("#model");
                ddl.append("<option value=''>请选择</option>");
               $.each(model, function (idx, val) {
               	ddl.append($("<option value='"+val.model+"'>" + val.model + "</option>"))
               })
           }
       })
	}
	function selectVersion(){
		 $('#version option').remove();
		  var model = $("#model").val();
	       var versionUrl=$('#versionUrl').val();
	        $.ajax(versionUrl,{
	        	type: "post",
	            data: {model:model},
	            datatype: "json",
	            success: function (data) {
	            	var version=data.version;
	            	 var ddl = $("#version");
	                 ddl.append("<option value=''>请选择</option>");
	                $.each(version, function (idx, val) {
	                	ddl.append($("<option value='"+val.version+"'>" + val.version + "</option>"))
	                })
	            }
	        })
		}
	//格式化时间
	function _formatSimpleDate(datetime) {
		if (datetime === null) {
			return '';
		}
		
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
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
			if (response.result.length>0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
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
