define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var datepickerUtil = require('../base/datepicker-util');	
//	var form = $('#searchForm');
	datepickerUtil.datesTrigger('#futuretime', null, null);
	datepickerUtil.datesTrigger('#validtime', null, null);
	require('../base/validation-proxy');
	var xianc=$("input:radio[name='nowhave']");
	var qihuo=$("#futuretime");
	var zj=$("input:radio[name='middleman']");
	var qud=$("#qudaofei");
	xianc.click(function(){
        mes(qihuo)
    });
	zj.click(function(){
        mes1(qud)
    });
function mes(input){
	var i=$("input:radio[name='nowhave']:checked").val();
	if(i==2)input.show();
	else if(i==1)input.hide();
	}
function mes1(input){
	var i=$("input:radio[name='middleman']:checked").val();
	if(i==2)input.show();
	else if(i==1)input.hide();
	}
$("#btnBack").click(function(){location.href=$("#backUrl").val()+'?currpage='+$('#currpage').val();});
//$("#btnSave").click(saveFun());
$("#btnSave").bind("click",saveFun);
function saveFun(){
	var $form=$('#editForm');
//	if (validateAddForm()) {
	var i=$("input:radio[name='nowhave']:checked").val();//alert(i);
	if(i==2&&!qihuo.val()){$.dialog("选择期货时,期货时间必填!", function(){});return false;}
	var vv=$("#validtime").val();
	if(vv&&i==2){
		var df=daysBetween(qihuo.val(),vv);
		if(df<2){$.dialog("采购报价有效期必须大于期货时间2天或以上!", function(){});return false;}
	}
	var tc=$("#tichetime").html();//alert(tc);
	if(tc){
		if(i==1){//现车
//			alert("现车");
			if(vv){
			var df=daysBetween(tc,vv);//alert(df);
			if(df<2){$.dialog("采购报价有效期必须大于提车时间2天或以上!", function(){});return false;}}
		}
		else{//期货
//			alert("期货");
			if(qihuo.val()){
			var df=daysBetween(qihuo.val(),tc);
//			alert(df);
			if(df<0){$.dialog("提车时间必须大于等于期货时间!", function(){});return false;}}
			if(vv){var df=daysBetween(tc,vv);
			if(df<2){$.dialog("采购报价有效期必须大于提车时间2天或以上!", function(){});return false;}}
		}
	}
	$form.validate({
		rules : {
			bodyprice : {
				required : true,
				numberOrSpace:true
			},
			tpprice : {
				numberOrSpace:true
			},
			cnsystem : {
				numberOrSpace:true
			},
			decorateprice : {
				numberOrSpace:true
			},
			validtime : {
				required : true,date:true
			},
			channelprice : {
				numberOrSpace:true
			},
			areaprice : {
				numberOrSpace:true
			}
		},
//		messages : {
//			bodyprice : {
//				required : "必填"
//			},
//			validtime : {
//				required : "必填"
//			}
//		},
		errorPlacement : function(error, element) {
			var p = element.parent();
			error.appendTo(p);
		},
		validClass : "success",
		onkeyup : false
	});
	$form.submit();
}
function validateAddForm() {
	$form.validate({
		rules : {
			brand : {
				required : true,
				maxlength:50
			}
//	,
//			model : {
//				required : true,
//				maxlength:50
//			},
//			vin : {
//				required : true,maxlength:50,only:2
//				
//			},
//			engineNum : {
//				required : true,maxlength:50,only:1
//				
//			}
		},
		messages : {
			brand : {
				required : "必填",
				maxlength:"输入过长"
			}
//		,
//			model : {
//				required : "必填",
//				maxlength:"输入过长"
//			},
//			vin : {
//				required : "必填",maxlength:"输入过长",only:"车架号已存在"
//			},
//			engineNum : {
//				required : "必填",maxlength:"输入过长",only:"发动机号已存在"
//				
//			}
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
//var days = daysBetween('2016-11-01','2016-11-02');
/**
* 根据两个日期，判断相差天数
* @param sDate1 开始日期 如：2016-11-01
* @param sDate2 结束日期 如：2016-11-02
* @returns {number} 返回相差天数
*/
function daysBetween(sDate1,sDate2){
//Date.parse() 解析一个日期时间字符串，并返回1970/1/1 午夜距离该日期时间的毫秒数
var time1 = Date.parse(new Date(sDate1));
var time2 = Date.parse(new Date(sDate2));
var nDays = parseInt((time2 - time1)/1000/3600/24);
return nDays;
};
});