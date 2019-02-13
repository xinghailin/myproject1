define(function(require, exports, module) {
require('../base/jquery.jedate');
require('../../styles/jedate.css');	
function back(){
//		var node=$("#node").val(),r=node == 1 ? $("#backUrl").val() : node == 2 ? $("#back1Url").val() : "";
location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
}
var ss=$("#status").val();
if(ss==1){
	$("#inlineRadio1,#inlineRadio2").click(function(){
var cs=$("[name='prefixsafe']:checked").val();
if(cs==1){
	$("#part1").show();
}else {$("#part1").hide();}
	})
}else if(ss==2){
	$("#inlineRadio3,#inlineRadio4").click(function(){
cs=$("[name='suffixsafe']:checked").val();
if(cs==1){
	$("#part2").show();
}else {$("#part2").hide();}
	})
}else if(ss==3){
$("#instancetime").jeDate({
isTime: true,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2018-01-01 00:00:00"
});
$("#casetime").jeDate({
isTime: true,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2018-01-01 00:00:00"
});
}
else if(ss==4){
$("#judgetime1").jeDate({
isTime: true,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2018-01-01 00:00:00"
});
}
else if(ss==6&&$("#pagenum").val()==7){
$("#instancetime2").jeDate({
isTime: true,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2018-01-01 00:00:00"
});
}
else if(ss==7){
$("#judgetime2").jeDate({
isTime: true,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2018-01-01 00:00:00"
});
}
else if(ss==9||ss==10){
$("[name='excecuteresult'],[name='excecute2result']").click(function(){
cs=$("[name='excecuteresult']:checked,[name='excecute2result']:checked").val();
if(cs==2){
	$("#sresult").show();
}else {$("#sresult").hide();}
})
}
if($('#pagenum').val()==9){
$("[name='applyexe1'],[name='applyexe2']").jeDate({
isTime: true,
isClear: true,//isinitVal:true, //是否初始化时间
minDate: "2018-01-01 00:00:00"
});
$('input[name^="applyexecute"]').click(function(evt){
var $div=$("#ae2div");
	if($(this).val()==1)
		$div.show()
	else $div.hide()
})
}
//绑定新增按钮事件
$("#backBtn").bind("click", back);
$("#saveBtn").bind("click", function(){
if(ss==1){
	  if(!$("[name='prefixsafe']:checked").length){
alert("请选择是否诉前保全！");return false;
  }$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==2){
	if(!$("[name='type2']:checked").length){
alert("请选择立案！");return false;
}
if(!$("[name='suffixsafe']:checked").length){
alert("请选择是否诉讼保全！");return false;
  }
$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==3){
 if(!$("#instancetime").val()){
alert("请选择一审开庭时间！");return false;
 }$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==4){
 if(!$.trim($("#du-reason1").val())){
alert("请填写判决结果！");return false;
	 }
var file2=$("#book").prop('files').length;
if(file2==0){alert("请上传判决书！");return false;}
$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==5){
 		if(!$("[name='need2judge']:checked").length){
alert("请选择是否二审！");return false;
}$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==6){
if($('#pagenum').val()==9){
if(!$("[name='applyexecute']:checked").length){
alert("请选择是否申请执行！");return false;
}}else if($("#pagenum").val()==7){
if(!$("#instancetime2").val()){
alert("请选择二审开庭时间！");return false;
}	
}$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}else if(ss==7){
if(!$.trim($("#du-reason1").val())){
alert("请填写判决结果！");return false;
	 }
var file2=$("#book2").prop('files').length;
if(file2==0){alert("请上传判决书！");return false;}
$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==8){
if(!$("[name='applyexecute2']:checked").length){
alert("请选择是否申请执行！");return false;
}$("#saveBtn").attr("disabled",true)
$("#editForm").submit();
}
else if(ss==9){if($('#pagenum').val()==9){
if($('#ershen').val()==1){
if(!$("[name='applyexecute2']:checked").length){
alert("请选择是否申请执行！");return false;
}
}else{
if(!$("[name='applyexecute']:checked").length){
alert("请选择是否申请执行！");return false;
}
}}else if($('#pagenum').val()==10){
if($("#ershen").val()){
if(!$("[name='excecute2result']:checked").length){
alert("请选择执行结果！");return false;
}
if($("[name='excecute2result']:checked").val()==2&&(!$("[name='excecute2result2']:checked").length)){
alert("请选择和解/法院要求！");return false;
}}else{
if(!$("[name='excecuteresult']:checked").length){
alert("请选择执行结果！");return false;
}
if($("[name='excecuteresult']:checked").val()==2&&(!$("[name='excecuteresult2']:checked").length)){
alert("请选择和解/法院要求！");return false;
}	
}}
$("#editForm").submit();
}
else if(ss==10){
if($("#ershen").val()){
if(!$("[name='excecute2result']:checked").length){
alert("请选择执行结果！");return false;
}
if($("[name='excecute2result']:checked").val()==2&&(!$("[name='excecute2result2']:checked").length)){
alert("请选择和解/法院要求！");return false;
}}else{
if(!$("[name='excecuteresult']:checked").length){
alert("请选择执行结果！");return false;
}
if($("[name='excecuteresult']:checked").val()==2&&(!$("[name='excecuteresult2']:checked").length)){
alert("请选择和解/法院要求！");return false;
}	
}
$("#editForm").submit();
}
});
var index;
var pictrue=$('.form-inline img'),num=pictrue.length;
pictrue.click(function(){
    $('body').css('overflow','hidden');
var top=$(window).scrollTop();
index= pictrue.index(this);
var n=1;
$("<div class='du-mask' style='margin-top: "+top+"px'><div class='du-tool'><button class='du-prev'>上一张</button><button class='du-next'>下一张</button><button class='du-large'>放大</button><button class='du-small'>缩小</button><button class='du-close'>关闭</button></div><div class='du-contain'><img class='du-main'></div></div>").appendTo('body');
var src=$(this).attr('src');
var main= $(".du-main");
main.attr('src',src);
var width=main.width();
main.css("left",($(window).width()-width)/2);
//        上一页
$(".du-prev").click(function(){
    to_left()
});
//       向上一页
function to_left(){
    if(index==0){
        alert("已经是第一张");
}else{
    index=index-1;
    var psrc=pictrue.eq(index).attr('src');
main.attr('src',psrc).css("transform","scale(1,1)");
        var width=main.width();
        main.css({left:($(window).width()-width)/2,top:0});
        n=1;
    }
}
//        下一页
$(".du-next").click(function(){
    to_right();
});
//       向下一页
function to_right(){
    if(num==(index+1)){
        alert("已经是最后一张");
}else{
    index=index+1;
    var nsrc=pictrue.eq(index).attr('src');
main.attr('src',nsrc).css("transform","scale(1,1)");
        var width=main.width();
        main.css({left:($(window).width()-width)/2,top:0});
        n=1;
    }
}
//        放大
$(".du-large").click(function(){
n=n+0.2;
main.css("transform","scale("+n,n+")");
//            drag(main.get(0));
});
//        缩小
$(".du-small").click(function(){
if(n>0.6){
    n=n-0.2;
    main.css("transform","scale("+n,n+")");
//                drag(main.get(0))
    }
});
//        关闭
$(".du-close").click(function(){
$('.du-mask').remove();
$('body').css('overflow','auto');
})
//        键盘绑定
var timeoutflag=null;
$(document).unbind("keydown").keydown(function(event){
if(timeoutflag != null){
	clearTimeout(timeoutflag);
}
timeoutflag=setTimeout(function(){
	if((event.keyCode == 37) || (event.keyCode == 38)){
		to_left();
	}else if((event.keyCode == 39) || (event.keyCode == 40)){
		to_right();
	}//执行的代码自己写
},100);//500毫秒内不会重复触发
      		});
    });	
});