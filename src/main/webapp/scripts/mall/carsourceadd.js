var //picArr=[],
inx=0;//图片数组
var //previewIdArr=[],totalpre,
use_personal=$("#use_personal"),uploadurl=$("#uploadUrl").val();//图片上传id数组
function submit(){
	/* if(!$('#brands').val()){
	alert('请选择品牌');
	return false;
}
if(!$('#model').val()){
	alert('请选择型号');
	return false;
}*/
if($("[name='type']:checked").length == 0){
alert('请选择定金类别');
	return false;
}
/*
if(!$("#issuingcompany").val()){
	alert('请选择开证公司');
	return false;
} */
use_personal.submit();
if(vil("use_personal")){//alert("!!");
//检测配置格式
var config=$("#config").val(),trim=$.trim(config),config1;
if(trim.length){
	config1=trim;
//	dotc=trim=trim.replace(/\s+/g, ',')
	trim=trim.split('^');
	var size=trim.length,one;
	if(size){
		//查找版本是否重复
		one=$("[name='kconfig']");
		var bl=false;
		var vrr=[];
		if(one.size()==1){
			if(!(one.val())){
			alert("请选择一个版本!");return false;}
			var trit=$.trim($("[name='vconfig']").val())
			if(trit.length==0){
				alert("配置值不允许为空!");return false;}
			var ss=trit.split('^');ss=ss.length;
			if(ss!=size){
				alert("配置值数目与配置数目不相等！");return false;
			}
			vrr.push(trit);
		}else{//多个值
		var ary=[]
		one.each(function(i){
			if(!$(this).val()){
				alert("第"+(i+1)+"行请选择版本！");bl=true;return false;
			}
			ary.push($(this).val())
		})
		if(bl){return false;}
		var nary = ary.sort();
for(var i = 0; i < nary.length - 1; i++)
{
   if (nary[i] == nary[i+1])
    {
       alert("版本重复：" + nary[i]);return false;
    }
}
var temp=[];
$("[name='vconfig']").each(function(i){
	var v=$.trim($(this).val())
	if(v.length==0){alert('第'+(i+1)+'行配置值不允许为空');bl=true;return false;}
	temp.push(v)
})
if(bl){return false;}
$.each(temp,function(i){
	var th=this.split('^').length;
	if(th!=size){
		alert("第"+(i+1)+"行配置值数目与配置数目不相等！");bl=true;return false;
	}
	vrr.push(this);
})
if(bl){return false;}}
}
}else{
	alert("配置必填！");return false;
}//return false;
/*else{if(confirm("配置尚未填写，确定保存吗？")){
	//go on
}else{
	return false;
}}*/
//$('.mask').show();
/*totalpre=$('#use_personal .file-preview-frame').length
$('#use_personal .kv-file-upload').each(function(){
	$(this).click();
});*/
var reg=/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/;
//检测颜色、价格
var jcolors=$("#divcolor>div"),jcs=[];
jQuery.each(jcolors,function(i,ti){
	var th=$(ti);
	var ts=th.find(":text"),f=ts.eq(0),s=ts.eq(1),t=ts.eq(2);
	var fv=$.trim(f.val()),sv=$.trim(s.val()),tv=$.trim(t.val());
	if(fv.length==0||fv.length>50){
		alert("颜色、价格第"+(i+1)+"行，外观颜色必填且最多50字");bl=true;return false;
	}
	if(sv.length==0||sv.length>50){
		alert("颜色、价格第"+(i+1)+"行，内饰颜色必填且最多50字");bl=true;return false;
	}
	if(tv.length==0||!reg.test(tv)){
		alert("颜色、价格第"+(i+1)+"行，价格必填且最多两位小数点");bl=true;return false;
	}
	if(tv.length>13){
		alert("颜色、价格第"+(i+1)+"行，价格输入过长");bl=true;return false;
	}
	jcs.push({outcolor:fv,incolor:sv,price:tv})
})
if(bl){return false;}
//检测加装包
$('.decoratediv').each(function(i){
	var ti=$(this);
	var fi=ti.find("input[name^='deconame']").val();
	var len=$.trim(fi).length;
	if(len){//名称有值
		if(len>15){alert('第'+(i+1)+'个加装包-名称超过15个字');bl=true;return false;}
		var pprce=ti.find("[name='decoprice']").val();
		if(pprce.length>0){
		if(!reg.test(pprce)){
			alert('第'+(i+1)+'个加装包-价格填写错误');bl=true;return false;
		}}else{
			alert('第'+(i+1)+'个加装包-价格必填');bl=true;return false;
		}
//		if(ti.find("[type='radio']:checked").length==0){
//		alert('第'+(i+1)+'个加装包-默认选中-必须勾选');bl=true;return false;}
	}
})
if(bl){return false;}
var up={areaid:$('#areaid').val(),areaname:$('#areaname').val(),unit:$('#unit').val(),brands:$('#brands option:selected').val(),brandname:$('#brands option:selected').text()
,model:$('#model').val(),displacement:$("#displacement").val(),carprice:$('#carprice').val(),//decorateprice:$('#decorateprice').val(),
oversea4sprice:$('#oversea4sprice').val(),favor:$('#favor').val(),cmsn:$('#cmsn').val(),
overseadrayage:$('#overseadrayage').val(),overseashotinsurance:$('#overseashotinsurance').val(),
seatransportprice:$('#seatransportprice').val(),seatransportinsurance:$('#seatransportinsurance').val(),
storagenum:$('#storagenum').val(),issuingid:$("#issuingcompany").val(),
issuingcompany:$("#issuingcompany").val()?$("#issuingcompany option:selected").text():null,type:$("[name='type']:checked").val(),
downpayscale:$('#downpayscale').val(),outcolor:$('#outcolor').val(),incolor:$('#incolor').val(),serviceprice:$('#serviceprice').val()};//最终要提交的数据
var pics=[];
$(".other [type=hidden]:not([value=''])").each(function(){
	pics.push($(this).val());
})
up.pics=pics;
if(size){
//	up.version=one.eq(0).find("option:selected").text();
	up.config=config1;//$.trim(config)
//	var df=function(k,v){this.k=k;this.v=v;}
	var kks=[]//,vvs=[];
//	kks=$("[name='kconfig']"),vvs=$("[name='vconfig']")
	one.each(function(){kks.push($(this).val())})
//	$("[name='vconfig']").each(function(){vvs.push($(this).val())})
//	up.configk=kks,up.configv=vvs;
	up.configk=kks.length?JSON.stringify(kks):null;up.configv=vrr.length?JSON.stringify(vrr):null;
}
var des=[];
$('.decoratediv').each(function(){
	var ti=$(this);
	var fi=ti.find("input[name^='deconame']").val()
	if($.trim(fi).length){
		des.push({name:$.trim(fi),con:ti.find("[name^='decodetail']").val(),price:ti.find("[name^='decoprice']").val(),pic:ti.find("[name^='outpic']").val(),ck:ti.find("[name^='default']:checked").val()})
	}
})
up.decorates=des.length?JSON.stringify(des):null;
up.colors=JSON.stringify(jcs);
console.log(up);$("#submit").attr("disabled",true);
$.ajax({
 url:$("#formUrl").val(),
// data:{conid:$('#conid').val(),concode:$('#concode').val(),str:JSON.stringify(picArr)},
 type:'post',
 dataType:'json',
 data:up,
 success:function (data){
//     console.log(data)
 	if(data.status){//$('.mask').hide()
 	alert("保存成功！");
 	back();}
 	else {//$('.mask').hide();
 	alert(data.message);$("#submit").attr("disabled",false);}
 },error:function(a,b,c){
 	alert(a.responseText)
 	$("#submit").attr("disabled",false);
 }
})
}
}
//是否通过表单验证
function vil(id){
	var error=$("#" + id).find('.has-error');
if(error.length > 0){
	error.eq(0).find('.form-control').focus();
		return false;
	}
	return true;
}
function back(){
	location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
}
function addconfig(){
	var th=$('.configdiv')
/* if(th.find("[name='kconfig'] option").length == 1){
	alert('对应版本下拉框中至少要有一个选项，请先选择品牌、型号后再试！');
	return false;
} */
th.clone().removeClass('configdiv').addClass('configdiv1').insertAfter(th).find('button').removeClass('btn-primary').addClass('btn-danger').html('删除').show();
}
function decorate(){
	inx++;
	/*var th=$('.decoratediv'),o=th.clone().removeClass('decoratediv').addClass('decoratediv1').insertAfter(th);
o.find("[type='radio']").attr('name','default' + inx);
var fil=o.find("[type='file']");
fil.attr('id','decFileId' + inx);
fil.attr('name','decFileName' + inx);
o.find('button').show(); */
var it=$('#unit').val()
use_personal.append($(
'<div class="form-inline decoratediv" style="width: 100%;">'
+ '<div class="form-group"><button type="button" class="btn btn-danger" role="button" style="padding: 6px 18px; width: 100px;">删除</button></div>'
+ ' <div class="form-group newInput" style=""><label>名称：</label> <input type="text" class="form-control" name="deconame" placeholder="限制15字以内"></div>'
+ ' <div class="form-group newInput" style=""><label>内容：</label> <input type="text" class="form-control" name="decodetail"></div>'
+ ' <div class="form-group newInput" style=""><label>价格：</label> <input type="text" class="form-control" name="decoprice">'+it
+ '</div> <div class="form-group newInput"><label>配置图片：</label>' + '	 <div class="up-img"><span>点击上传</span> <img src=""> <input type="file" id="decFileId' + inx + '" name="decFileName' + inx
+ '" class="imginput" onchange="imagePreview(this)"> <input type="hidden" name="outpic" value="" id="hidadd'+inx+'"/></div></div>'
+ '<div class="form-group newInput"><label>默认选中：</label> <label class="radio-inline"> <input type="radio" name="default'+inx+'" value="1"> 是'
+ '</label><label class="radio-inline"><input type="radio" name="default'+inx+'" value="2" checked="checked"> 否 </label></div></div>'));
}
function addpic(){inx++;
	$("#personal-myCard").append('<div class="form-group newInput">'+
	'<div class="up-img other"><span>点击上传</span> <img src=""> <input type="file" id="FileId'+inx+'" name="FileName'+inx+'" class="imginput" onchange="picPreview(this)"> <input'+
	' type="hidden" name="carpic'+inx+'" value="" id="picadd'+inx+'" /><button type="button" class="button-remove">删除</button></div>');	
}
function color(){var it=$('#unit').val();
	$("#divcolor").append(
	'<div class="form-inline colordiv" style="width: 100%;"><div class="form-group"><button type="button" class="btn btn-danger" role="button"'+
	'	style="padding: 6px 18px; width: 100px;">删除</button></div>'+
	'	<div class="form-group newInput"><label>外观颜色：</label> <input type="text" class="form-control" name="outcolor" placeholder="限制50字以内"></div>'+
	'	<div class="form-group newInput"><label>内饰颜色：</label> <input type="text" class="form-control" name="incolor" placeholder="限制50字以内"></div>'+
	'	<div class="form-group newInput"><label>价格：</label> <input type="text" class="form-control" name="price">'+it+'</div></div>');
}
function imagePreview(obj){
var f=obj.files[0],th=$(obj),hid=th.parent().find("[type='hidden']").prop('id');
th.parent().find('img').attr('src',window.URL.createObjectURL(f));
$.ajaxFileUpload({url:uploadurl + "?filename=" + th.attr("name"),fileElementId:th.attr('id'),type:'POST',dataType:'json',success:function(data){
if(data.status == 1){
$("#" + hid).val(data.path);
		alert(data.msg);
	}else{alert(data.msg);}
},error:function(XMLHttpRequest,textStatus,errorThrown){
	console.log(XMLHttpRequest);
	console.log(textStatus);
	console.log(errorThrown);
	alert("服务异常，请稍后尝试");
	}});
}
function picPreview(obj){
var f=obj.files[0],th=$(obj),hid=th.parent().find("[type='hidden']").attr('id');
th.parent().find('img').attr('src',window.URL.createObjectURL(f));
$.ajaxFileUpload({url:uploadurl + "?car=1&filename=" + th.attr("name"),fileElementId:th.attr('id'),type:'POST',dataType:'json',success:function(data){
if(data.status == 1){
$("#" + hid).val(data.path);
		alert(data.msg);
	}else{alert(data.msg);}
},error:function(XMLHttpRequest,textStatus,errorThrown){
	console.log(XMLHttpRequest);
	console.log(textStatus);
	console.log(errorThrown);
	alert("服务异常，请稍后尝试");
	}});
}
//绑定新增按钮事件
$("#backBtn").bind("click",back);
$('#brands').change(function(){
$("#model option:not([value=''])").remove();
$("[name='kconfig'] option:not([value=''])").remove();
var brand=$("#brands option:selected").text();
var modelUrl=$('#modelUrl').val();
$.ajax(modelUrl,{type:"post",data:{brand:brand},datatype:"json",success:function(data){
var model=data.model;
var ddl=$("#model");
//ddl.append("<option value=''>请选择</option>");
$.each(model,function(idx,val){
	ddl.append($("<option value='" + val.model + "'>" + val.model + "</option>"))
		})
	}})
});
$('#model').change(function(){
//$('#version option').remove();
$("[name='kconfig'] option:not([value=''])").remove();
var model=$("#model").val();
var versionUrl=$('#versionUrl').val();
$.ajax(versionUrl,{type:"post",data:{model:model},datatype:"json",success:function(data){
var version=data.version;
//var ddl = $("#version");
$("[name='kconfig']").each(function(){
//ddl.append("<option value=''>请选择</option>");
var ddl=$(this);
$.each(version,function(idx,val){
	ddl.append($("<option value='" + val.version + "'>" + val.version + "</option>"))
			})
		})
	}})
})
$('#personal-myCard').delegate('.button-remove','click',function(){
	$(this).parent().parent().remove();
})
$('#divcolor').delegate('.btn-danger','click',function(){
	$(this).parent().parent().remove();
})
use_personal
.delegate(".configdiv1 button,.decoratediv button",'click',function(){
	$(this).parent().parent().remove();
})
.bootstrapValidator(
{ive:'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
excluded:[':disabled',':hidden',':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
//submitButtons:'#submit666',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
message:'通用的验证失败消息',//好像从来没出现过
feedbackIcons:{//根据验证结果显示的各种图标
valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{brands:{validators:{notEmpty:{message:'品牌必选'}}},model:{validators:{notEmpty:{message:'型号必选'}}},carprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},decorateprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},oversea4sprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},favor:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},cmsn:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},overseadrayage:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},overseashotinsurance:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},serviceprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},seatransportprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},seatransportinsurance:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},displacement:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:11,message:'最多11位'},regexp:{regexp:/^[1-9]?(\d+)$|0$/,message:'格式错误'}}},storagenum:{message:'验证失败',validators:{stringLength:{max:11,message:'最多11位'},regexp:{regexp:/^[1-9]?(\d+)$|0$/,message:'格式错误'}}},downpayscale:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'格式错误'}}}}})
//initFileInput("file-05",5);