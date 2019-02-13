<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>开票申请</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="invoicelist" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="invoicefileupload" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="invoicesave" namespace="car-ms"/>">
</head>
<style>
@media ( min-width : 1330px) {
	.container {
		width: 1524px;
	}
}

table td, table th {
	text-align: center;
}

.box {
	/*width: 1524px;*/
	overflow: hidden;
	color: #555;
	/*margin-left: 50px;*/
}

.title {
	padding: 10px 0;
}

.newInput {
	padding: 10px 15px 10px 15px;
	min-width: 300px;
}

.newInput label:first-child {
	min-width: 120px;
	text-align: right;
}

.du-btn {
	text-align: center;
	margin: 50px 0;
}

.du-btn a {
	margin: 0 20px;
}

.upload {
	margin-top: 20px;
}

.upload .form-inline label {
	min-width: 130px;
	text-align: right;
	padding: 10px 0;
}

.bv-form .help-block {
	margin-bottom: 0;
}

.nav-tabs li.bv-tab-success>a {
	color: #3c763d;
}

.nav-tabs li.bv-tab-error>a {
	color: #a94442;
}

.help-block {
	text-align: right;
}

.form-control-feedback {
	
}

.form-inline .has-feedback .form-control-feedback {
	top: 10px;
	right: 10px;
}

.form-inline .form-group.vali {
	height: 62px;
}

.has-success .form-control {
	border-color: #ccc;
}

.glyphicon-ok {
	display: none;
}

.close {
	display: none;
}

.close.fileinput-remove {
	display: none;
}

.kv-file-upload {
	display: none;
}

.mask {
	position: fixed;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 999;
	background: rgba(0, 0, 0, .5);
	display: none;
}

.mask .loding {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.mask img {
	display: block;
}

.mask p {
	margin-top: 15px;
	font-weight: 700;
	font-size: 20px;
	color: #ccc;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<!--<form action="" id="rightVli" class="rightVli">-->
				<h3 class="title">开票申请</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>
				<div class="form-inline">
					<div class="form-group newInput"><label>销售合同编号：</label> <label>${co.filecode}</label></div>
					<div class="form-group newInput"><label>合同类别：</label> <label>金融</label></div>
					<div class="form-group newInput"><label>车架号：</label> <label>${co.vin}</label></div>
					<div class="form-group newInput"><label>客户姓名：</label> <label>${co.bname}</label></div>
					<div class="form-group newInput"><label>销售合同下载：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a></div>
					<div class="form-group newInput"><label>金融合同第一年：</label> <a href="${contextPath}${sale.saleborrowfile1}" download="${firtyear}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${firtyear}</a></div>
					<div class="form-group newInput"><label>金融合同第2-4年：</label> <a href="${contextPath}${sale.saleborrowfile2}" download="${secondyear}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${secondyear}</a></div>
					<div class="form-group newInput"><label>贷审会审批表：</label> <a href="${contextPath}${risk.approvaltableurl}" download="${texturlname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${texturlname}</a></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput du-choose-invoice"><label><span style="color: red; font-weight: bold">*</span>开票类型：</label> <label class="radio-inline"> <input type="radio" name="invoice" id="use" value="2" checked="checked"> 机动车专用发票
					</label></div>
			</div> <!--机动车专用发票-->
				<div class="use_bill">
					<div class="form-inline">
						<div class="form-group newInput du-choose-type"><label><span style="color: red; font-weight: bold">*</span>类型：</label> <label class="radio-inline"> <input type="radio" name="type" id="personal" value="1" checked="checked"> 个人
						</label></div>
				</div>
					<form id="use_personal"><input type="hidden" id="conid" name="conid" value="${co.id }"><input type="hidden" id="currpage" name="currpage" value="${currpage}">
						<div class="personal_con">
							<div class="form-inline">
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>姓名：</label> <input type="text" class="form-control" name="name"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>电话：</label> <input type="text" class="form-control" name="phone"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>身份证号：</label> <input type="text" class="form-control" name="cardId"></div>
						</div> <label style="color: red; margin-left: 49px; margin-top: 5px;">只能上传后缀为jpg,png,jpeg,bmp的图片</label>
							<div class="form-inline" id="personal-myCard"><label style="margin-left: 50px;">身份证正反面（两图）：</label>
								<div class="form-group newInput"><input id="file-05" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
							<div class="form-inline" id="personal-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
								<div class="form-group newInput"><input id="file-02" class="file-loading" type="file" multiple></div></div>
							<div class="form-inline">
								<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> <input type="checkbox" style="top: 2px; margin-right: 10px" id="personal-replace" value="1">代付款证明（一图）：
								</label>
									<div class="form-group newInput personal-replace-img" style="display: none" id="personal-replace-img"><input id="file-03" class="file-loading" type="file"></div></div>
						</div>
							<div class="form-inline personal-card" style="display: none" id="personal-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
								<div class="form-group newInput"><input id="file-04" class="file-loading" type="file" multiple data-max-file-count="2"></div></div> <c:if test="${(not empty invoice) and (not empty invoice.nopassreason)}">
								<div class="form-inline">
									<div class="form-group newInput"><label>不通过原因：</label>${invoice.nopassreason}</div>
								</div>
							</c:if>
					</div></form>
			</div>
				<div class="du-btn">
					<button class="btn btn-danger" role="button" id="submit" style="padding: 6px 38px" onclick="submit()">保存</button> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 38px" id="backBtn">返回 </a>
			</div> <!--</form>-->
		</div>
	</div>
</div>
	<div class="mask">
		<div class="loding"><img src="${contextPath}/img/loading1.gif" alt="">
			<p>正在上传中......</p></div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/fileinput2.min.js"></script>
<script src="${contextPath}/js/bootstrapValidator.min.js"></script>
<script>
	var picArr=[];//图片数组
	var previewIdArr=[],totalpre,use_personal,uploadurl=$("#uploadUrl").val();//图片上传id数组
	function initFileInput(ctrlName,type){
		var control=$('#' + ctrlName);
		control
		.fileinput({language:'zh', //设置语言
		uploadUrl:uploadurl, //上传的地址
		allowedFileExtensions:['jpg','png','jpeg','bmp'],//接收的文件后缀
		//            maxFilesNum: 5,//上传最大的文件数量
		uploadExtraData:{"type":type},uploadAsync:true, //默认异步上传
		showUpload:false, //是否显示上传按钮
		showRemove:false, //显示移除按钮
		showPreview:true, //是否显示预览
		showCaption:false,//是否显示标题
		browseClass:"btn btn-primary", //按钮样式
		dropZoneEnabled:false,//是否显示拖拽区域
		//minImageWidth: 50, //图片的最小宽度
		//minImageHeight: 50,//图片的最小高度
		//maxImageWidth: 1000,//图片的最大宽度
		//maxImageHeight: 1000,//图片的最大高度
		maxFileSize:5120,//单位为kb，如果为0表示不限制文件大小
		//overwriteInitial : false,
		//minFileCount: 0,
		//            maxFileCount: 3, //表示允许同时上传的最大文件个数
		enctype:'multipart/form-data',validateInitialCount:true,previewFileIcon:"<i class='glyphicon glyphicon-king'></i>",msgFilesTooMany:"选择上传的文件数量({n}) 超过允许的最大数值{m}！",layoutTemplates:{
		//actionUpload:"",   //去掉单独上传按钮
		//                actionDelete:"",
		//                actionZoom:""
		}})
		.on(
		"fileuploaded",
		function(event,data,previewId,index){ //一个文件上传成功
			data.response.pid=index;
			picArr.push(data.response);
			if(picArr.length >= totalpre){
				$
				.ajax({url:$("#formUrl").val(),data:use_personal.serialize() + "&arr=" + JSON.stringify(picArr) + "&replace=" + ($('#personal-replace').prop('checked') ? "1" : ""),dataType:'json',type:'post',success:function(data){
					console.log(data);
					$('.mask').hide();
					alert("保存成功！");
					back();
				}});
			}
		}).on('fileerror',function(event,data,msg){ //一个文件上传失败
			console.log('文件上传失败！' + data.id);
		});
	}
	//增值税发票专业发票选择
	//个人 企业选择
	//代付款选择
	$('#personal-replace').click(function(){
		if($(this).prop('checked')){
			$("#personal-replace-img,#personal-card").show();
		}else{
			$("#personal-replace-img,#personal-card").hide();
		}
	});
	function submit(){
		if($("#personal").prop('checked')){
			use_personal=$("#use_personal");
			use_personal.submit();
			if(vil("use_personal")){
				//营业执照等是否上传判断
				if($('#personal-myCard').find('.file-preview-frame').length != 2){
					alert('身份证正反面不足2张');
					return false;
				}else if($("#personal-flow").find('.file-preview-frame').length == 0){
					alert('请选择至少一张流水图');
					return false;
				}else if($("#personal-replace").prop('checked')){
					if($('#personal-replace-img').find('.file-preview-frame').length == 0){
						alert('请选择代付款证明');
						return false;
					}
					if($("#personal-card").find('.file-preview-frame').length != 2){
						alert('代付款人身份证正反面不足2张');
						return false;
					}
				}
				$('.mask').show();
				totalpre=$('#use_personal .file-preview-frame').length
				$('#use_personal .kv-file-upload').each(function(){
					$(this).click();
				});
			}
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
	$("#use_personal")
	.bootstrapValidator(
	{ive:'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
	excluded:[':disabled',':hidden',':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
	submitButtons:'#submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
	message:'通用的验证失败消息',//好像从来没出现过
	feedbackIcons:{//根据验证结果显示的各种图标
	valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{money:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},name:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},phone:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},/* regexp:{regexp:/^1\d{10}$/,message:'手机号码验证错误'} */stringLength:{max:100,message:'长度必须在小于100位字符'}}},cardId:{message:'身份证验证失败',validators:{notEmpty:{message:'身份证不能为空'},regexp:{regexp:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,message:'身份证格式填写错误'}}}}})
	function back(){
		location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
	}
	//绑定新增按钮事件
	$("#backBtn").bind("click",back);
	initFileInput("file-05",5);
	initFileInput("file-02",2);
	initFileInput("file-03",3);
	initFileInput("file-04",4);
</script>
</html>