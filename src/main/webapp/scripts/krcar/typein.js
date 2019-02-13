define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	$('img').bigic();
	require('../base/validation-proxy');
	$(function() {
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
	 
	var $form;var $check=$('#checkUrl').val();
    function saveFun(){
    	$form=$('#editForm');
    	$form.validate({
			rules : {
				brand : {
					required : true,
					maxlength:50
				},
				model : {
					required : true,
					maxlength:50
				},
				version : {
					required : true,
					maxlength:50
				},
				vin : {
					required : true,
					maxlength:50
				},
				price : {
					number : true,
					maxlength:15
				},
				disprice : {
					number : true,
					maxlength:15
				},
				poolid: {
					required : true
				},
				cert1 : {
					required : true
				},
				cert2 : {
					required : true
				},
				cert3 : {
					required : true
				}
				
				
				
			},
			messages : {
				brand : {
					required : "必填",
					maxlength:"输入过长"
				},
				model : {
					required : "必填",
					maxlength:"输入过长"
				},
				version : {
					required : "必填",
					maxlength:"输入过长"
				},
				vin : {
					required : "必填",
					maxlength:"输入过长"
				},
				price : {
					number : " 必须输入合法的数字",
					maxlength:"输入过长"
				},
				disprice : {
					number : " 必须输入合法的数字",
					maxlength:"输入过长"
				},
				poolid: {
					required : "必填"
				},
				cert1 : {
					required : "必填"
				},
				cert2 : {
					required : "必填"				
				},
				cert3 : {
					required : "必填"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		    	if ($form.valid()) {
			var queryUrl = $('#addcarUrl').val(); // 
			$.ajax(queryUrl, {
				async : false,
				type : 'POST',
				dataType : 'json',
				data : $('#editForm').serialize(),
			}).success(function(data) {
				msg = data.result;
				alert(msg);
				if(data.rescode==1){
					window.location.href=$('#krcarlistUrl').val();
				}
			}).error(function() {
				msg = "系统内部异常";
				alert(msg);
			});
		}
        
}

	
	// 绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	// 重置
	function reset() {       
		$("#editForm")[0].reset();
	}
	$("#resetBtn").bind("click", reset);


});

