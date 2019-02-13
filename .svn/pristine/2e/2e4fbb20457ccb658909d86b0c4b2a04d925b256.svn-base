define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	$('img').bigic();
	require('../base/validation-proxy');
//	$(function() {
//		 $('#brandinitial').bind('change', selectBrand);
//		 $('#brand').bind('change', selectModel);
//		 $('#model').bind('change', selectVersion);
//		});
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
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	datepickerUtil.datesTrigger('#purchaseTime', null, null);
	 
	var $form;var $check=$('#checkUrl').val();
    function saveFun(){
    	$form=$('#editForm');
    	var leaveFactoryTime=$("#leaveFactoryTime").val();
    	var purchaseTime=$("#purchaseTime").val();
    		if(leaveFactoryTime>purchaseTime){$.dialog("采购日期必须大于出厂日期!", function(){});return false;}
//    	if (validateAddForm()) {
//    	$form.validate({
//			rules : {
//				brand : {
//					required : true,
//					maxlength:50
//				},
//				/*model : {
//					required : true,
//					maxlength:50
//				},
//				version : {
//					required : true,
//					maxlength:50
//				},*/
//				leaveFactoryTime : {
//					date : true
//				},purchaseTime:{
//					date : true
//				}
////		,
////				model : {
////					required : true,
////					maxlength:50
////				},
////				vin : {
////					required : true,maxlength:50,only:2
////					
////				},
////				engineNum : {
////					required : true,maxlength:50,only:1
////					
////				}
//			},
//			messages : {
//				brand : {
//					required : "必填",
//					maxlength:"输入过长"
//				}/*,
//				model : {
//					required : "必填",
//					maxlength:"输入过长"
//				},
//				version : {
//					required : "必填",
//					maxlength:"输入过长"
//				}*/
//				/*,leaveFactoryTime : {
//					required : date
//				}*/
////			,
////				model : {
////					required : "必填",
////					maxlength:"输入过长"
////				},
////				vin : {
////					required : "必填",maxlength:"输入过长",only:"车架号已存在"
////				},
////				engineNum : {
////					required : "必填",maxlength:"输入过长",only:"发动机号已存在"
////					
////				}
//			},
//			errorPlacement : function(error, element) {
//				var p = element.parent();
//				error.appendTo(p);
//			},
//			validClass : "success",
//			onkeyup : false
//		});
    		$form.submit();
//    }
}
    function validateAddForm() {
		$form.validate({
			rules : {
				brand : {
					required : true,
					maxlength:50
				}
//		,
//				model : {
//					required : true,
//					maxlength:50
//				},
//				vin : {
//					required : true,maxlength:50,only:2
//					
//				},
//				engineNum : {
//					required : true,maxlength:50,only:1
//					
//				}
			},
			messages : {
				brand : {
					required : "必填",
					maxlength:"输入过长"
				}
//			,
//				model : {
//					required : "必填",
//					maxlength:"输入过长"
//				},
//				vin : {
//					required : "必填",maxlength:"输入过长",only:"车架号已存在"
//				},
//				engineNum : {
//					required : "必填",maxlength:"输入过长",only:"发动机号已存在"
//					
//				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $form.valid();
	}
	function validateAddForm1() {
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
				vin : {
					required : true,maxlength:50,only:2
					
				},
				engineNum : {
					required : true,maxlength:50,only:1
					
				},lenWidHei : {
					required : true,
					maxlength:50
				},displacement : {
					required : true,
					maxlength:50
				},oilWear : {
					required : true,
					maxlength:50
				},discharge : {
					required : true,
					maxlength:50
				},weight : {
					required : true,
					maxlength:50
				},level : {
					required : true,
					maxlength:50
				}
				,gearbox : {
					required : true,
					maxlength:50
				},energyType : {
					required : true
				},outlookColor : {
					required : true,
					maxlength:50
				},innerColor : {
					required : true,
					maxlength:50
				},leaveFactoryTime : {
					required : true,
					date:true
				},buyPrice : {
					required : true,amount:true,
					maxlength:11
				},lowPrice : {
					required : true,amount:true,
					maxlength:11
				},buyName : {
					required : true,
					maxlength:50
				},address : {
					required : true,
					maxlength:50
				}
				,iden1 : {
					required : true
				},iden2 : {
					required : true
				},iden3 : {
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
				vin : {
					required : "必填",maxlength:"输入过长",only:"车架号已存在"
				},
				engineNum : {
					required : "必填",maxlength:"输入过长",only:"发动机号已存在"
					
				},lenWidHei : {
					required : "必填",
					maxlength:"输入过长"
				},displacement : {
					required : "必填",
					maxlength:"输入过长"
				},oilWear : {
					required : "必填",
					maxlength:"输入过长"
				},discharge : {
					required : "必填",
					maxlength:"输入过长"
				},weight : {
					required : "必填",
					maxlength:"输入过长"
				},level : {
					required : "必填",
					maxlength:"输入过长"
				}
				,gearbox : {
					required : "必填",
					maxlength:"输入过长"
				},energyType : {
					required : "必填"
				},outlookColor : {
					required : "必填",
					maxlength:"输入过长"
				},innerColor : {
					required : "必填",
					maxlength:"输入过长"
				},leaveFactoryTime : {
					required : "必填",
					date:"格式错误"
				},buyPrice : {
					required : "必填",amount:"格式错误",
					maxlength:"输入过长"
				},lowPrice : {
					required : "必填",amount:"格式错误",
					maxlength:"输入过长"
				},buyName : {
					required : "必填",
					maxlength:"输入过长"
				},address : {
					required : "必填",
					maxlength:"输入过长"
				}
				,iden1 : {
					required : "请传关单"
				},iden2 : {
					required : "请传商检单"
				},iden3 : {
					required : "请传车辆一致性证书"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $form.valid();
	}
	
	//绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	// 重置
	function reset() {       
		$("#editForm")[0].reset();
	}
//	$("#resetBtn").bind("click", reset);
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
	//绑定新增按钮事件
	$("#backBtn").bind("click", back);
//	$(function(){
//		var $msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
	/*$(function(){
		$.ajax({
			//请求方式（post或get）默认为get。注意其他http请求方法，例如put和delete也可以使用，但仅部分浏览器支持。
		    type: 'POST',
		    //String类型URL请求字符串。默认为当前页地址
		    url: "http://www.baidu.com/12345.action" ,
		    //// 发送到服务器的数据，它将被自动转为字符串类型。如果是GET请求，它将被附加到URL后面。jQuery会自动将对象数据转换为 "name=codeplayer&age=18&uid=1&uid=2&uid=3"
		    data: { name:"codeplayer", age:18, uid: [1, 2, 3] } ,
		    // 服务器返回的数据类型：
		    //xml：返回XML文档，可用JQuery处理。
		    //json：返回JSON数据
		    //text：返回纯文本字符串。
		    dataType: "json", 
		    // 同步请求，发送请求后浏览器将被锁定，只有等到该请求完成(无论成功或失败)后，用户才能操作，js代码才会继续执行
		    async: false,
		    //指定请求完成(无论成功或失败)后需要执行的回调函数。该函数还有两个参数：
		    //一个是jqXHR对象，一个是表示请求状态的字符串('success'、 'notmodified'、 'error'、 'timeout'、 'abort'或'parsererror')。
		    complete:function(textStatus, jqXHR){
		    },
		    // 假设返回的字符串数据为{ "name": "CodePlayer", age: 20 }
		    // jQuery已帮我们将该JSON字符串转换为对应的JS对象，可以直接使用
		    success: function( data, textStatus, jqXHR ){
		        alert( data.name ); // CodePlayer
		    } ,
		    // 请求失败时执行
		    // errorMsg 可能为： "Not Found"、"Internal Server Error"等
		    error: function(jqXHR, textStatus, errorMsg){
		        alert("请求失败：" + errorMsg);
		    }
		});
	});*/
});
function imagePreview(obj,imgObj){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src) ;
//	window.URL.revokeObjectURL(src);
}
var $check=$('#checkUrl').val();
function onBlur(param,type){
	var $pa=$(param);var exp="";var exp= type=='1'?"发动机号已存在":"车架号已存在";
	$.ajax({
		type : "POST",
		url : $check + ".json",
		dataType : "json",
		data : {"param":$pa.val(),"type":type},
		async : false,
		success : function(response) {
			if (response.status=="0") {
				var p = $pa.parent();
//				error.appendTo(p);
				p.append('<label class="invalid" for="'+$pa.attr("name")+'">'+exp+'</label>');
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
//			$.dialog('请稍后重试!', function(){});
			var p = $pa.parent();
//			error.appendTo(p);
			p.append('验证中');
		}
	});
}