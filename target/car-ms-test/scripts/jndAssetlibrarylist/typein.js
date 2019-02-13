define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	$('img').bigic();
	require('../base/validation-proxy');
	var datepickerUtil = require('../base/datepicker-util');
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	datepickerUtil.datesTrigger('#purchaseTime', null, null);

	var $form;
	var $check = $('#checkUrl').val();
	function saveFun() {
		var reg = /^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/;
		$form = $('#editForm');
		var leaveFactoryTime = $("#leaveFactoryTime").val();
		var purchaseTime = $("#purchaseTime").val();
		var iden1 = $('#iden1').val();
		var iden2 = $('#iden2').val();
		var iden3 = $('#iden3').val();
		var iden4 = $('#iden4').val();
		if (leaveFactoryTime > purchaseTime) {
			alert("采购日期必须大于出厂日期!");
			return false;
		}
		if (!reg.test($('#buyPrice').val())) {
			alert("请填写正确格式采购价！");
			return false;
		}
		if (!reg.test($('#lowPrice').val())) {
			alert("请填写正确格式成本价！");
			return false;
		}
		if (!reg.test($('#sellerprice').val())) {
			alert("请填写正确格式销售价！");
			return false;
		}
		if (iden1 == "" && $('#iden11').val() == "") {
			alert("请上传关单！")
			return false;
		}
		if (iden2 == "" && $('#iden22').val() == "") {
			alert("请上传商检单！")
			return false;
		}
		if (iden3 == "" && $('#iden33').val() == "") {
			alert("请上传车辆一致性证书(正面)！")
			return false;
		}
		if (iden4 == "" && $('#iden44').val() == "") {
			alert("请上传环保清单！")
			return false;
		}
		$form.submit();
	}
    function tempsaveFun(){
    	$form=$('#editForm');
    	var leaveFactoryTime=$("#leaveFactoryTime").val();
    	var purchaseTime=$("#purchaseTime").val();
    		if(leaveFactoryTime>purchaseTime){
    			$.dialog("采购日期必须大于出厂日期!", function(){});
    			return false;
    		}
        	var reg = /^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/;
        	if(!reg.test($('#buyPrice').val())){
        		alert("请填写正确格式采购价！");
        		return false;
        	}if(!reg.test($('#lowPrice').val())){
        		alert("请填写正确格式成本价！");
        		return false;
        	}if(!reg.test($('#sellerprice').val())){
        		alert("请填写正确格式销售价！");
        		return false;
        	}
        	
    	$form.validate({
			rules : {
				brand : {
					required : true,
					maxlength:50
				},
				leaveFactoryTime : {
					date : true
				}
			},
			messages : {
				brand : {
					required : "必填",
					maxlength : "输入过长"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		var tempsaveUrl = $("#tempsaveUrl").val();

		$("#editForm").attr("action", $("#tempsaveUrl").val());
		$form.submit();
		// window.location.href=$('#templstUrl').val();
	}
	function validateAddForm() {
		$form.validate({
			rules : {
				brand : {
					required : true,
					maxlength : 50
				}
			// ,
			// model : {
			// required : true,
			// maxlength:50
			// },
			// vin : {
			// required : true,maxlength:50,only:2
			//					
			// },
			// engineNum : {
			// required : true,maxlength:50,only:1
			//					
			// }
			},
			messages : {
				brand : {
					required : "必填",
					maxlength : "输入过长"
				}
			// ,
			// model : {
			// required : "必填",
			// maxlength:"输入过长"
			// },
			// vin : {
			// required : "必填",maxlength:"输入过长",only:"车架号已存在"
			// },
			// engineNum : {
			// required : "必填",maxlength:"输入过长",only:"发动机号已存在"
			//					
			// }
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

	// 绑定新增按钮事件
	$('#saveBtn').bind("click", saveFun);
	$('#backjnd').bind("click", backjnd);
	$('#tempsaveBtn').bind("click", tempsaveFun);
	function backjnd() {
		// location.href=$('#BondedWarehouseEntryListPage').val()+"?currpage="+$('#currpage').val();
		window.history.go(-1);

	}
	// 重置
	function reset() {
		$("#editForm")[0].reset();
	}
	$("#resetBtn").bind("click", reset);
	$(function() {
		var $msg = $('#hideMsg');
		if ($msg.val())
			$.dialog($msg.val(), function() {
			});
	})

});
function imagePreview(obj, imgObj) {
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#' + imgObj).attr('src', src);
	// window.URL.revokeObjectURL(src);
}
var $check = $('#checkUrl').val();
function onBlur(param, type) {
	var $pa = $(param);
	var exp = "";
	var exp = type == '1' ? "发动机号已存在" : "车架号已存在";
	$.ajax({
		type : "POST",
		url : $check + ".json",
		dataType : "json",
		data : {
			"param" : $pa.val(),
			"type" : type
		},
		async : false,
		success : function(response) {
			if (response.status == "0") {
				var p = $pa.parent();
				// error.appendTo(p);
				p.append('<label class="invalid" for="' + $pa.attr("name")
						+ '">' + exp + '</label>');
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			// $.dialog('请稍后重试!', function(){});
			var p = $pa.parent();
			// error.appendTo(p);
			p.append('验证中');
		}
	});
}