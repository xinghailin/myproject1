define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/validation-proxy');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#time', null, null);
	$(function() {
		 $('#brandinitial').bind('change', selectBrand);
		 $('#brand').bind('change', selectModel);
		 $('#model').bind('change', selectVersion);
		 $('#province').bind('change', selectCity);
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
function selectCity(){
   $('#citys option').remove();
   var province = $("#province").val();
   var provinceUrl=$('#provinceUrl').val();
$.ajax(provinceUrl,{
	type: "post",
    data: {province: province},
    datatype: "json",
    success: function (data) {
    	var citys=data.citys;
    	 var ddl = $("#citys");
         ddl.append("<option value=''>请选择</option>");
        $.each(citys, function (idx, val) {
        	ddl.append($("<option value='"+val.name+"'>" + val.name + "</option>"))//val.name 的nam是数据库表中字段的名字
            })
        }
    })
}
	//绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	// 重置
	function saveFun(){
    	var $form=$('#editForm');
//    	if (validateAddForm()) {
    	$form.validate({
			rules : {
				name : {
//					required : true,
					maxlength:50
				},
				tel : {
//					required : true,
					maxlength:11,
					mobile:true
				},
				province : {
					required : true
				},
				citys : {
					required : true
				},
				brand : {
					required : true
				},
				model : {
					required : true
				},
				version : {
					required : true
				},
				time : {
					dateorspace : true
				},
				decorate : {
					maxlength:250
				}
			},
//			messages : {
//				name : {
//					required : "必填",
//					maxlength:"输入过长"
//				},
//					tel : {
//						required : "必填",
//						maxlength:"输入过长"
//					}
//			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
    		$form.submit();
//    }
}
	function reset() {       
		$("#editForm")[0].reset();
	}
	$("#resetBtn").bind("click", reset);
	$(function(){
		var $msg=$('#hideMsg');
		if($msg.val())$.dialog($msg.val(), function(){});
	})
});