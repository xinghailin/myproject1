define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	require('../base/validation-proxy');
	require('../base/jquery.jedate');
	require('../../styles/jedate.css');
//	var date=new Date();
//	var year=date.getFullYear();
//	var month=date.getMonth()+1;
//	var day=date.getDate();
//	var mindate=year+"-"+month+"-"+day;
//	var submitButton = $("#btnSearch");
	function validateAddForm() {
		form.validate({
			rules : {
				contract : {
					required : true,maxlength:1000
				},config : {
					required : true,maxlength:500
				},outcolor : {
					required : true,maxlength:50
				},incolor : {
					required : true,maxlength:50
				},num : {
					required : true,maxlength:11,
					integergtzero:true
				},supplyname : {
					required : true,maxlength:50
				},totalprice : {
					required : true,maxlength:11,
					amountFmtCheck:true
				},appointtime : {
					required : true,
					date:true
				},othercost : {
					amount:true,maxlength:11
				},insurance : {
					amount:true,maxlength:11
				},expensetax : {
					amount:true,maxlength:11
				},cmsn1 : {
					amount:true,maxlength:11
				},cmsn2 : {
					amount:true,maxlength:11
				},cmsn3 : {
					amount:true,maxlength:11
				},cmsn4 : {
					amount:true,maxlength:11
				},cmsn5 : {
					amount:true,maxlength:11
				},other1 : {
					amount:true,maxlength:11
				},other2 : {
					amount:true,maxlength:11
				},other3 : {
					amount:true,maxlength:11
				},other4 : {
					amount:true,maxlength:11
				},other5 : {
					amount : true,maxlength:11
				},downpay : {
					required : true,maxlength:11,
					amountFmtCheck:true
				},transcost : {
					amount:true,maxlength:11
				},transname : {
					maxlength:50
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
		if(validateAddForm()){
			//校验价格
			var tp=$('#ptotalprice').val();//车价
			var oc=$('#otherco').val();//4s店杂费
			var su=$('#insure').val();//车辆保险
			var ex=$('#exptax').val();//消费税
			var c1=$('#cmsn1').val();//佣金1
			var c2=$('#cmsn2').val();
			var c3=$('#cmsn3').val();
			var c4=$('#cmsn4').val();
			var c5=$('#cmsn5').val();
			var o1=$('#other1').val();//其他费用1
			var o2=$('#other2').val();
			var o3=$('#other3').val();
			var o4=$('#other4').val();
			var o5=$('#other5').val();
			var tc=$('#transcost').val();//运输费
			var all=parseFloat(tp)+parseFloat(oc?oc:0)+parseFloat(su?su:0)+parseFloat(ex?ex:0)+parseFloat(c1?c1:0)+parseFloat(c2?c2:0)+parseFloat(c3?c3:0)+parseFloat(c4?c4:0)+parseFloat(c5?c5:0)+parseFloat(o1?o1:0)+parseFloat(o2?o2:0)+parseFloat(o3?o3:0)+parseFloat(o4?o4:0)+parseFloat(o5?o5:0)+parseFloat(tc?tc:0);//总价
			var dp=parseFloat($('#downpay').val());
			if(dp>all){//$.dialog("定金不可大于各价格总和["+all.toFixed(2)+"]", function(){});
			alert("定金不可大于各价格总和["+all.toFixed(2)+"]");return;}
			$('#shouldfp').val(all.toFixed(2)-dp);
		$.ajax(form.attr('action'), {
			type : 'POST',
			dataType : 'json',
			data : form.serialize()
		}).done(function(response) {
			if (response.status) {
//				$.dialog('提交成功！', function(){window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();})//返回之前的当前页
				alert('提交成功！');window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();
			} else {
				$.dialog(response.msg, function(){})//提示错误信息
			}
		});}
	}
	function savenewFun() {
		var sb=$('#subbuyid').val();
		if(!sb){alert("请选择采购计划");//$.dialog("还未选择采购计划", function(){});
		return;}
		if(validateAddForm()){
		//购车方式必填
		if(!$("[name='paytype']:checked").length){
		{//$.dialog("请选择购车方式", function(){});
		alert("请选择购车方式");return;}
		}
//		alert(!$("[name='paytype']:checked").length);return;
		//校验价格
		var tp=$('#ptotalprice').val();//车价
		var oc=$('#otherco').val();//4s店杂费
		var su=$('#insure').val();//车辆保险
		var ex=$('#exptax').val();//消费税
		var c1=$('#cmsn1').val();//佣金1
		var c2=$('#cmsn2').val();
		var c3=$('#cmsn3').val();
		var c4=$('#cmsn4').val();
		var c5=$('#cmsn5').val();
		var o1=$('#other1').val();//其他费用1
		var o2=$('#other2').val();
		var o3=$('#other3').val();
		var o4=$('#other4').val();
		var o5=$('#other5').val();
		var tc=$('#transcost').val();//运输费
//		var all=tp+oc?oc:0//+su?su:0+ex?ex:0+c1?c1:0+c2?c2:0+c3?c3:0+c4?c4:0+c5?c5:0+o1?o1:0+o2?o2:0+o3?o3:0+o4?o4:0+o5?o5:0+tc?tc:0;//总价
		var all=parseFloat(tp)+parseFloat(oc?oc:0)+parseFloat(su?su:0)+parseFloat(ex?ex:0)+parseFloat(c1?c1:0)+parseFloat(c2?c2:0)+parseFloat(c3?c3:0)+parseFloat(c4?c4:0)+parseFloat(c5?c5:0)+parseFloat(o1?o1:0)+parseFloat(o2?o2:0)+parseFloat(o3?o3:0)+parseFloat(o4?o4:0)+parseFloat(o5?o5:0)+parseFloat(tc?tc:0);//总价
		var dp=parseFloat($('#downpay').val());
		if(dp>all){//$.dialog("定金不可大于各价格总和["+all.toFixed(2)+"]", function(){});
		alert("定金不可大于各价格总和["+all.toFixed(2)+"]");return;}
		$('#shouldfp').val(all.toFixed(2)-dp);
		$.ajax(form.attr('action'), {
			type : 'POST',
			dataType : 'json',
			data : form.serialize()
		}).done(function(response) {
			if (response.status) {
//				$.dialog('提交成功！', function(){window.location.href = $('#indexUrl').val();})//返回之前的首页
				alert('提交成功！');window.location.href = $('#indexUrl').val();
			} else {
				$.dialog(response.msg, function(){})//提示错误信息
			}
		});}
	}
	function choosepurchase(){
		var realsale = $("#choosepurUrl").val();
		showDialogue(realsale, 800, 500);}
	function showDialogue(url,w,h){
		var iTop = 100;
		var iLeft = 100;
		var iWidth = window.parent.screen.availWidth-iLeft*2;
		var iHeight = window.parent.screen.availHeight-iTop*2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
	function back(){
		window.location.href=$('#indexUrl').val()+"?currpage="+$('#currpage').val();
	}
	var form = $('#editForm');
	$('#saveBtn').bind("click",saveFun);
	$('#savenewBtn').bind("click",savenewFun);
	$("#cancelBtn").bind("click", back);
	var chosepur=$('#choseBtn');
	if(chosepur.size()>0){chosepur.bind("click",choosepurchase)}
//	var mindate,buyt=$("#buytime").val(),mindate=buyt?buyt:"2017-01-01 00:00:00";
	$(".datainp").jeDate({
        format: "YYYY-MM-DD",
        isTime: false,
        isClear: true,//isinitVal:true, //是否初始化时间
        minDate: "2017-01-01 00:00:00"
    });
});
function finishchosesubpur(){
	var url=$('#subpurUrl').val()+"?id="+$('#subbuyid').val(),hideid=$("[name='id']");
	if(hideid.size()>0){url=url+"&apayid="+hideid.val();}
	$.ajax(url, {
		type : 'get',
		dataType : 'json'
	}).done(function(response) {
		if (response.status) {
//			$.dialog('提交成功！', function(){})//填充内容
			var sb=response.sb;$('#adjust').val(sb.adjust);
			$('#pcode').text(sb.code);$('#pname').text(sb.name);
			$('#pinitials').text(sb.initials);$('#pbrand').text(sb.brand);
			$('#pmodel').text(sb.model);$('#pversion').text(sb.version);
			$('#pconfig').val(sb.config);$('#poutcolor').val(sb.outcolor);
			$('#pincolor').val(sb.incolor);$('#pnum').val(sb.remainnum);
			$('#psupplyname').val(sb.supplyname);$('#ptotalprice').val(sb.totalprice);
			var curr=sb.currency;
			var _curr=curr==1?"加币(CAD)":curr==2?"美元($)":"";$("span[name='currency']").html(_curr);
			var stores=sb.stores;
			var _store=$('#ptostoreid');_store.empty();
			for(var i=0;i<stores.length;i++){_store.append($("<option value='"+stores[i].id+"'>" + stores[i].name + "</option>"))}
			_store.val(sb.tostoreid);$('#patime').val(sb.sappointtime);
//			$('#pptime').val(sb._paytime);//$('#rebate').val(sb.rebate);
			$('#otherco').val(sb.othercost);$('#insure').val(sb.insurance);
//			$('#lateco').val(sb.latecost);
			$('#exptax').val(sb.expensetax);
//			$('#saleco').val(sb.salecost);
			$('#cmsn1').val(sb.cmsn1);$('#cmsn2').val(sb.cmsn2);
			$('#cmsn3').val(sb.cmsn3);$('#cmsn4').val(sb.cmsn4);
			$('#cmsn5').val(sb.cmsn5);$('#other1').val(sb.other1);
			$('#other2').val(sb.other2);$('#other3').val(sb.other3);
			$('#other4').val(sb.other4);$('#other5').val(sb.other5);
			$('#transcost').val(sb.transcost);$('#transname').val(sb.transname);
//			$(".datainp").jeDate({
//		        format: "YYYY-MM-DD",
//		        isTime: false,
//		        isClear: true,isinitVal:true, //是否初始化时间
//		        minDate: "2017-01-01 00:00:00"
//		    });//alert(sb.buytime);
		} else {
			$.dialog(response.msg, function(){})//提示错误信息
		}
	});
}