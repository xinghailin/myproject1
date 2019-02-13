define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/validation-proxy');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#futuretime', null, null);
	datepickerUtil.datesTrigger('#validtime', null, null);
	datepickerUtil.datesTrigger('#gmwp', null, null);
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
//绑定新增按钮事件
$('#saveBtn').bind("click",saveFun);
// 重置
function saveFun(){
    	$form=$('#editForm');
var qihuo=$("#gmwp");
var i=$("input:radio[name='nowhave']:checked").val();
if(i==2&&!qihuo.val()){$.dialog("选择期货时,期货时间必填!", function(){});return false;}
var vv=$("#validtime").val();
if(vv&&i==2){
	var df=daysBetween(qihuo.val(),vv);
	if(df<2){$.dialog("采购报价有效期必须大于期货时间2天或以上!", function(){});return false;}
}
$form.validate({
	rules : {
		brandinitial : {
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
		v : {
			required : true,date:true
		},
		bodyprice : {
			required : true,numberOrSpace:true
		},
		f : {
			date:true
		},
		channelprice : {
			numberOrSpace:true
		},
		cnsystem : {
			numberOrSpace:true
		},
		tpprice : {
			numberOrSpace:true
		}
	},
	errorPlacement : function(error, element) {
		var p = element.parent();
		error.appendTo(p);
	},
	validClass : "success",
			onkeyup : false
		});
    	$form.submit();
}
function reset() {       
	$("#editForm")[0].reset();
}
$("#resetBtn").bind("click", reset);
function daysBetween(sDate1,sDate2){
	//Date.parse() 解析一个日期时间字符串，并返回1970/1/1 午夜距离该日期时间的毫秒数
	var time1 = Date.parse(new Date(sDate1));
	var time2 = Date.parse(new Date(sDate2));
	var nDays = parseInt((time2 - time1)/1000/3600/24);
	return nDays;
	};
$(function(){
	var $msg=$('#hideMsg');
	if($msg.val())$.dialog($msg.val(), function(){});
})
});