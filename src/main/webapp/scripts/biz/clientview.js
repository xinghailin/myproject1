define(function(require, exports, module) {
	require('jquery-css');
	var handlebars = require('handlebars').Handlerbars;
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var pagination = require('../base/pagination');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTriggerSimple('#comeshoptime', null, new Date());
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
 $('#initials').bind('change', selectBrand);
 $('#brand').bind('change', selectModel);
 $('#model').bind('change', selectVersion);
	function selectBrand(){
	 $('#brand option').remove();
     $('#model option').remove();
     $('#version option').remove();
	 var brandinitial = $("#initials").val();
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
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {infoId:$('#id').val()}
		}).done(function(response) {
			if (response.result.length>0) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : 10,
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
	function validateForm() {
    	$('#contentForm').validate({
			rules : {
				identify : {
					cardNoCheckOrSpace : true
				}
			},
			messages : {
				identify : {
					cardNoCheckOrSpace : "格式错误"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $('#contentForm').valid();
	}
	// 重置
	function reset() {       
		$("#editForm")[0].reset();
	}
	function back(){
		var a=$("#all").val(),url;
		if(a)url=$("#backUrl").val()+"?all=1&worktype="+$("#worktype").val()+"&currpage="+$('#currpage').val();
		else url=$("#backUrl").val()+"?worktype="+$("#worktype").val()+"&currpage="+$('#currpage').val();
		location.href=url;
	}
	//绑定新增按钮事件
//	$("#addClientInfoBtn").bind("click", addClientInfo);
	$("#backBtn").bind("click", back);//$("#resetBtn").bind("click", reset);
	load(1,10);
});