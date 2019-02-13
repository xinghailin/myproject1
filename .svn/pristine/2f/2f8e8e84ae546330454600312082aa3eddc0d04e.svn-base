define(function(require, exports, module) {
require('jquery-css');//require('art-dialog')($);
require('../base/validation-proxy');
require('../base/jquery.jedate');
require('../../styles/jedate.css');
var $userCountry=$('#userCountry');
var userCountry=$userCountry.size()?$userCountry.val():"";
function validateAddForm() {
	form.validate({
		rules : {
			sname : {
				required : true,maxlength:200
			},
			sadd : {
				maxlength:200
			},sidtype : {
				required : true,maxlength:200
			},sno : {
				required : true,maxlength:200
			},sphone : {
				maxlength:200
			},pname : {
				required : true,maxlength:200
			},padd : {
				required : true,maxlength:200
			},pidtype : {
				required : true,maxlength:200
			},pno : {
				required : true,maxlength:200
			},pphone : {
				maxlength:200
			},
			brand : {
				required : true,maxlength:200
			},model : {
				required : true,maxlength:200
			},version : {
				maxlength:200
			},displacement : {
				maxlength:200
			},
			config : {
				required : true,maxlength:500
			},outcolor : {
				required : true,maxlength:50
			},incolor : {
				required : true,maxlength:50
			},trim : {
				maxlength:200
			},num : {
				required : true,maxlength:11,
				integergtzero:true
			},appointtime : {
				required : true,maxlength:50
			},transname : {
				maxlength:200
			},totalprice : {
				required : true,maxlength:11,
				amountFmtCheck:true
			},price : {
				required : true,maxlength:11,
				amountFmtCheck:true
			},remark : {
				maxlength:200
			},transprice : {
				amount:true,maxlength:11
			},insurance : {
				amount:true,maxlength:11
			},trimprice : {
				amount:true,maxlength:11
			},cmsn1 : {
				amount:true,maxlength:11
			},cmsn2 : {
				amount:true,maxlength:11
			},cmsn3 : {
				amount:true,maxlength:11
			},cmsn4 : {
				amount:true,maxlength:11
			},other1 : {
				amount:true,maxlength:11
			},other2 : {
				amount:true,maxlength:11
			},other3 : {
				amount:true,maxlength:11
			},other4 : {
				amount:true,maxlength:11
			},trim1 : {
				maxlength:200
			},trim2 : {
				maxlength:200
			},trim3 : {
				maxlength:200
			},trim4 : {
				maxlength:200
			},trim5 : {
				maxlength:200
			},trim6 : {
				maxlength:200
			},trim7 : {
				maxlength:200
			},trim8 : {
				maxlength:200
			},t1price : {
				amount:true,maxlength:11
			},t2price : {
				amount:true,maxlength:11
			},t3price : {
				amount:true,maxlength:11
			},t4price : {
				amount:true,maxlength:11
			},t5price : {
				amount:true,maxlength:11
			},t6price : {
				amount:true,maxlength:11
			},t7price : {
				amount:true,maxlength:11
			},t8price : {
				amount:true,maxlength:11
			},issuingprice : {
				amount:true,maxlength:11
			}
		},messages : {
			totalprice: {
				required : "required"
					}
			
		
		},
		errorPlacement : function(error, element) {
			element.parent().append(error);
		},
		validClass : "success",
		onkeyup : false
	});
	var bl=form.valid();
	return bl;
}
function saveFun() {
	var sb=$('#subbuyid').val();
if(!sb){alert("请选择采购计划");
return;}
if(validateAddForm()){
//购车方式必填
if(!$("[name='paytype']:checked").length){
{//$.dialog("请选择购车方式", function(){});
alert("请选择是否定金(please choose Is Down Payment)");return;}
}
var downpay=$("[name='paytype']:checked").val();
if(downpay==2){
var selfbuy=$("[name='selfbuy']:checked").size();
if(selfbuy==0){alert("请选择采购方式");return;}
var zic=$("[name='selfbuy']:checked").val();
var dpprice=$('#downpay').val();
var fpprice=$('#finalpay').val();
if(!(/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(dpprice)||!(/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(fpprice))
{alert("选择定金为是时，定金和尾款必填且格式无误(check Down Payment、Final Payment，make sure its required and correct)");return;}
var dp=parseFloat(dpprice);
if(dp>$('#totalprice').val()){//$.dialog("定金不可大于各价格总和["+all.toFixed(2)+"]", function(){});
alert("定金不可大于合同总金额");return;}
}
//校验价格
var tp=$('#ptotalprice').val();//车价
var oc=$('#transprice').val();//运输费
var su=zic==1?0:$('#insurance').val();//车辆保险
var ex=zic==1?0:$('#trimprice').val();//加装费
var c1=$('#cmsn1').val();//佣金1
var c2=$('#cmsn2').val();
var c3=$('#cmsn3').val();
var c4=$('#cmsn4').val();
//		var c5=$('#cmsn5').val();
var o1=$('#other1').val();//其他费用1
var o2=$('#other2').val();
var o3=$('#other3').val();
var o4=$('#other4').val();
//		var o5=$('#other5').val();
var p1=zic==1?0:$('#othercost').val();//4s
var p2=$('#expensetax').val();//消费税
var all=parseFloat(tp)+parseFloat(oc?oc:0)+parseFloat(su?su:0)+parseFloat(ex?ex:0)+parseFloat(c1?c1:0)+parseFloat(c2?c2:0)+parseFloat(c3?c3:0)+parseFloat(c4?c4:0)+parseFloat(o1?o1:0)+parseFloat(o2?o2:0)+parseFloat(o3?o3:0)+parseFloat(o4?o4:0)+parseFloat(p1?p1:0)+parseFloat(p2?p2:0);//总价
//		if(isNaN(all)){ 
//			alert("NaN"); 
//			}
$('#autotprice').val(all.toFixed(2));form.submit();//location.href=$('#indexUrl').val();
	}
}
function savenewFun() {
	var sb=$('#subbuyid').val();
if(!sb){alert("请选择采购计划");//$.dialog("还未选择采购计划", function(){});
return;}
var purfile=$("#purfile").val().length;
if(purfile==0){alert("请上传采购文件(please upload purchase file)");return;}
var filelen=$("#texturl").val().length;
if(filelen==0){alert("请上传合同文件(please upload contract file)");return;}
if(validateAddForm()){//alert("提交表单通过");
//购车方式必填
if(!$("[name='paytype']:checked").length){
{//$.dialog("请选择购车方式", function(){});
alert("请选择是否定金(please choose Is Down Payment)");return;}
}
var downpay=$("[name='paytype']:checked").val();
if(downpay==2){//是定金
//			form.validate().resetForm();
//			form.validate({
//				rules : {
//					downpay : {
//						required : true,amount:true,maxlength:11
//					},finalpay : {
//						required : true,amount:true,maxlength:11
//					}
//				},
//				errorPlacement : function(error, element) {
//					element.parent().append(error);
//				},
//				validClass : "success",
//				onkeyup : false
//			});
//			var bl=form.valid();
var selfbuy=$("[name='selfbuy']:checked").size();
if(selfbuy==0){alert("请选择采购方式");return;}
var zic=$("[name='selfbuy']:checked").val();
var dpprice=$('#downpay').val();
var fpprice=$('#finalpay').val();
if(!(/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(dpprice)||!(/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(fpprice))
{alert("选择定金为是时，定金和尾款必填且格式无误(check Down Payment、Final Payment，make sure its required and correct)");return;}
var dp=parseFloat(dpprice);
if(dp>$('#totalprice').val()){//$.dialog("定金不可大于各价格总和["+all.toFixed(2)+"]", function(){});
alert("定金不可大于合同总金额");return;}
}

//		$('#totalprice').val(all);
//		alert(!$("[name='paytype']:checked").length);return;
//校验价格
var tp=$('#ptotalprice').val();//车价
var oc=$('#transprice').val();//运输费
var su=zic==1?0:$('#insurance').val();//车辆保险
var ex=zic==1?0:$('#trimprice').val();//加装费
var c1=$('#cmsn1').val();//佣金1
var c2=$('#cmsn2').val();
var c3=$('#cmsn3').val();
var c4=$('#cmsn4').val();
//		var c5=$('#cmsn5').val();
var o1=$('#other1').val();//其他费用1
var o2=$('#other2').val();
var o3=$('#other3').val();
var o4=$('#other4').val();
//		var o5=$('#other5').val();
var p1=zic==1?0:$('#othercost').val();//4s
var p2=$('#expensetax').val();//消费税
//		var tc=$('#transcost').val();//运输费
//		var all=tp+oc?oc:0//+su?su:0+ex?ex:0+c1?c1:0+c2?c2:0+c3?c3:0+c4?c4:0+c5?c5:0+o1?o1:0+o2?o2:0+o3?o3:0+o4?o4:0+o5?o5:0+tc?tc:0;//总价
var all=parseFloat(tp)+parseFloat(oc?oc:0)+parseFloat(su?su:0)+parseFloat(ex?ex:0)+parseFloat(c1?c1:0)+parseFloat(c2?c2:0)+parseFloat(c3?c3:0)+parseFloat(c4?c4:0)+parseFloat(o1?o1:0)+parseFloat(o2?o2:0)+parseFloat(o3?o3:0)+parseFloat(o4?o4:0)+parseFloat(p1?p1:0)+parseFloat(p2?p2:0);//总价
//		if(isNaN(all)){ 
//			alert("NaN"); 
//			}
$('#autotprice').val(all.toFixed(2));form.submit();//location.href=$('#indexUrl').val();
//		$('#autotprice').val(all.toFixed(2)-dp);
//		$.ajax(form.attr('action'), {
//			type : 'POST',
//			dataType : 'json',
//			data : form.serialize()
//		}).done(function(response) {
//			if (response.status) {
////				$.dialog('提交成功！', function(){window.location.href = $('#indexUrl').val();})//返回之前的首页
//				alert('提交成功！');window.location.href = $('#indexUrl').val();
//			} else {
//				$.dialog(response.msg, function(){})//提示错误信息
//			}
//		});
	}
}
function choosepurchase(){
	var realsale = $("#choosepurUrl").val()+"?userCountry="+userCountry;
	showDialogue(realsale, 800, 500);}
function showDialogue(url,w,h){
	var iTop = 100;
	var iLeft = 100;
	var iWidth = window.parent.screen.availWidth-iLeft*2;
	var iHeight = window.parent.screen.availHeight-iTop*2;
	var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
}
function back(){
	window.location.href=$('#indexUrl').val()+"?userCountry="+userCountry+"&currpage="+$('#currpage').val();
}
function autocalc(){
var zic=$("[name='selfbuy']:checked").val();
var tp=$('#ptotalprice').val();//车价
var oc=$('#transprice').val();//运输费
var su=zic==1?0:$('#insurance').val();//车辆保险+
var ex=zic==1?0:$('#trimprice').val();//加装费+
var c1=$('#cmsn1').val();//佣金1
var c2=$('#cmsn2').val();
var c3=$('#cmsn3').val();
var c4=$('#cmsn4').val();
var o1=$('#other1').val();//其他费用1
var o2=$('#other2').val();
var o3=$('#other3').val();
var o4=$('#other4').val();
var p1=zic==1?0:$('#othercost').val();//4s+
var p2=$('#expensetax').val();//消费税
var all=parseFloat(tp)+parseFloat(oc?oc:0)+parseFloat(su?su:0)+parseFloat(ex?ex:0)+parseFloat(c1?c1:0)+parseFloat(c2?c2:0)+parseFloat(c3?c3:0)+parseFloat(c4?c4:0)+parseFloat(o1?o1:0)+parseFloat(o2?o2:0)+parseFloat(o3?o3:0)+parseFloat(o4?o4:0)+parseFloat(p1?p1:0)+parseFloat(p2?p2:0);//总价
if(isNaN(all)){
	alert("请填入正确格式的金额");return false; 
	}
$('#totalprice').val(all.toFixed(2));
}
var form = $('#editForm');
$('#saveBtn').bind("click",saveFun);
$('#savenewBtn').bind("click",savenewFun);
$("#cancelBtn").bind("click", back);
$("#autocalc").bind("click", autocalc);
var chosepur=$('#choseBtn');//.bind("click",choosepurchase);
if(chosepur.size()>0){chosepur.bind("click",choosepurchase)}
//	var mindate,buyt=$("#buytime").val(),mindate=buyt?buyt:"2017-01-01 00:00:00";
$(":radio[name='paytype']").bind("click",radioFun);
function radioFun(){$(".selfpur").show();$(":radio[name='selfbuy']").attr("checked",false);$("#prediv").hide();
//若合同总金额有值则重新计算
var tt=$('#totalprice');
if(tt.val().length){
	autocalc()
}
	var val=$(this).val();
	if(val==2){$("#downfinal,#selfbuy").show();
//		$("#selfbuy").show();
}
else {$("#downfinal,#selfbuy").hide();}
}
$(":radio[name='selfbuy']").bind("click",selfbuyFun);
function selfbuyFun(){
//若合同总金额有值则重新计算
var tt=$('#totalprice');
if(tt.val().length){
	autocalc()
}
var val=$(this).val();
if(val==1){$(".selfpur").hide();
$("#prediv").show();
}
else {$(".selfpur").show();$("#prediv").hide();}
}
$("#psupplyname").change(function(){
if(splst){
var $this=$(this),val=$this.val();
for(var i=0,len=splst.length;i<len;i++){
  		if(splst[i].name==val){
  		$("#sadd").val(splst[i].address);$("#sidtype").val(splst[i].idtype);$("#sno").val(splst[i].idcode);$("#sphone").val(splst[i].phone);
   		}
   	}}
	});
$("#appointtime").jeDate({
format: "YYYY-MM-DD",
isTime: false,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2017-01-01 00:00:00"
    });
});
var newadd=$("[name='newadd']").size()>0?true:false;
var splst;
if(!newadd){
	$.ajax($('#spUrl').val(), {
type : 'get',
dataType : 'json',
data : {type:$('#sptype').val()}
	}).done(function(response) {
		if (response.splst.length) {
			splst=response.splst;
		}
	});
}
function finishchosesubpur(){
	var url=$('#subpurUrl').val()+"?id="+$('#subbuyid').val();//var hideid=$("[name='newadd']");
if(!newadd){url=url+"&contractid="+$("[name='id']").val();}
$.ajax(url, {
	type : 'get',
dataType : 'json'
}).done(function(response) {
	if (response.status) {
//			$.dialog('提交成功！', function(){})//填充内容
var sb=response.sb;//$('#adjust').val(sb.adjust);
if(newadd){$('#idkey').val(sb.idkey);$('#contractcode').val(sb.contractcode);}
$('#buyid').val(sb.buyid);
$('#pcode').text(sb.code);$('#pname').text(sb.name);$('#pactivepurchaser').text(sb.needer);$('#activepurchaser').val(sb.needer);$('#mallcode').val(sb.mallContractCode);
$('#pbrand').val(sb.brand);
$('#pmodel').val(sb.model);$('#pversion').val(sb.version);$('#displacement').val(sb.displacement);
$('#pconfig').val(sb.config);$('#outcolor').val(sb.outcolor);
$('#incolor').val(sb.incolor);$('#pnum').val(sb.remainnum);
$('#ptotalprice').val(sb.totalprice);
var curr=sb.currency;
var _curr=curr==1?"加币(CAD)":curr==2?"美元($)":"";$("label[name='currency']").html(_curr);
var stores=sb.stores;
var _store=$('#apponitadd');_store.empty();
for(var i=0;i<stores.length;i++){
	_store.append($("<option value='"+stores[i].id+"'>" + stores[i].name + "</option>"))
}
_store.val(sb.tostoreid);
$('#appointtime').val(sb.sappointtime);
//			$('#pptime').val(sb._paytime);//$('#rebate').val(sb.rebate);
$('#transname').val(sb.transname);
$('#transprice').val(sb.transcost);
$('#insurance').val(sb.insurance);
//			$('#lateco').val(sb.latecost);
$('#othercost').val(sb.othercost);
$('#expensetax').val(sb.expensetax);
$('#cmsn1').val(sb.cmsn1);$('#cmsn2').val(sb.cmsn2);
$('#cmsn3').val(sb.cmsn3);$('#cmsn4').val(sb.cmsn4);
//			$('#cmsn5').val(sb.cmsn5);
$('#other1').val(sb.other1);
$('#other2').val(sb.other2);$('#other3').val(sb.other3);
$('#other4').val(sb.other4);//$('#other5').val(sb.other5);
//			$('#psupplyname').val(sb.supplyname);
if(sb.purinfo){
	var purinfo=sb.purinfo;
	$("[name='pname']").val(purinfo.name);$('#padd').val(purinfo.add);
$('#pidtype').val(purinfo.type);$('#pno').val(purinfo.no);$('#pphone').val(purinfo.phone);
}
//			else{$("[name='pname']").val("");$('#padd').val("");
//			$('#pidtype').val("");$('#pno').val("");$('#pphone').val("");}
//处理供应方
//			$("#sadd").val("");$("#sidtype").val("");$("#sno").val("");$("#sphone").val("");
$("#sadd,#sidtype,#sno,#sphone").val("");
splst=sb.splst;var spselect=$('#psupplyname');spselect.empty();
for(var i=0;i<splst.length;i++){
//				spselect.append($("<option value='"+splst[i].name+"'>" + splst[i].name + "</option>"))
if(sb.supplyname==splst[i].name){
	spselect.append($("<option value='"+splst[i].name+"' selected>" + splst[i].name + "</option>"))
$("#sadd").val(splst[i].address);$("#sidtype").val(splst[i].idtype);$("#sno").val(splst[i].idcode);$("#sphone").val(splst[i].phone);
}
else spselect.append($("<option value='"+splst[i].name+"'>" + splst[i].name + "</option>"))
}
//			spselect.val(sb.supplyname);
} else {
//			$.dialog(response.msg, function(){})//提示错误信息
			alert(response.msg)
		}
	});
}