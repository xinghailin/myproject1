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
					<div class="form-group newInput"><label>合同类别：</label> <label>全款</label></div>
					<div class="form-group newInput"><label>所属门店：</label> <label>${co.shopname}</label></div>
					<div class="form-group newInput"><label>填写人姓名(销售姓名)：</label> <label>${co.sellername}</label></div>
					<div class="form-group newInput"><label>车架号：</label> <label>${co.vin}</label></div>
					<div class="form-group newInput"><label>客户姓名/企业名称：</label> <label>${co.bname}</label></div>
					<div class="form-group newInput"><label>销售合同下载：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput du-choose-invoice"><label><span style="color: red; font-weight: bold">*</span>开票类型：</label> <label class="radio-inline" style="margin-right: 50px"> <input type="radio" name="invoice" id="add" value="1"> 增值税发票
					</label> <label class="radio-inline"> <input type="radio" name="invoice" id="use" value="2"> 机动车专用发票
					</label></div>
			</div> <!--增值税发票-->
				<form action="kp.php" id="add_form"><input type="hidden" id="conid" name="conid" value="${co.id }"><input type="hidden" id="currpage" name="currpage" value="${currpage}">
					<div class="add_bill" style="display: none">
						<div class="form-inline">
							<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>单位名称：</label> <input type="text" class="form-control" name="name"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>税号：</label> <input type="text" class="form-control" name="tax"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>开户行：</label> <input type="text" class="form-control" name="bank"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>银行卡号：</label> <input type="text" class="form-control" name="bankCard" oninput="user(this)"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>经营地址：</label> <input type="text" class="form-control" name="address"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>联系电话：</label> <input type="text" class="form-control" name="phone"></div>
					</div> <label style="color: red; margin-left: 49px; margin-top: 5px;">只能上传后缀为jpg,png,jpeg,bmp的图片</label>
						<div class="form-inline" id="add-license"><label style="margin-left: 50px;">营业执照（一图）：</label>
							<div class="form-group newInput"><input id="file-01" class="file-loading" type="file"></div></div>
						<div class="form-inline" id="add-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
							<div class="form-group newInput"><input id="file-02" class="file-loading" type="file" multiple></div></div>
						<div class="form-inline">
							<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> <input type="checkbox" style="top: 2px; margin-right: 10px" id="add-replace" value="1">代付款证明（一图）：
							</label>
								<div class="form-group newInput add-replace-img" style="display: none" id="add-replace-img"><input id="file-03" class="file-loading" type="file"></div></div>
					</div>
						<div class="form-inline add-card" style="display: none" id="add-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
							<div class="form-group newInput"><input id="file-04" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
				</div></form> <!--<form action="" id="add_use">-->
				<div class="use_bill" style="display: none">
					<div class="form-inline">
						<div class="form-group newInput du-choose-type"><label><span style="color: red; font-weight: bold">*</span>类型：</label> <label class="radio-inline" style="margin-right: 50px"> <input type="radio" name="type" id="personal" value="1"> 个人
						</label> <label class="radio-inline"> <input type="radio" name="type" id="company" value="2"> 企业
						</label></div>
				</div>
					<form action="kp.php" id="use_personal"><input type="hidden" id="conid" name="conid" value="${co.id }"><input type="hidden" id="currpage" name="currpage" value="${currpage}">
						<div class="personal_con" style="display: none">
							<div class="form-inline">
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>姓名：</label> <input type="text" class="form-control" name="name"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>电话：</label> <input type="text" class="form-control" name="phone"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>身份证号：</label> <input type="text" class="form-control" name="cardId"></div>
						</div> <label style="color: red; margin-left: 49px; margin-top: 5px;">只能上传后缀为jpg,png,jpeg,bmp的图片</label>
							<div class="form-inline" id="personal-myCard"><label style="margin-left: 50px;">身份证正反面（两图）：</label>
								<div class="form-group newInput"><input id="file-05" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
							<div class="form-inline" id="personal-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
								<div class="form-group newInput"><input id="file-06" class="file-loading" type="file" multiple></div></div>
							<div class="form-inline">
								<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> <input type="checkbox" style="top: 2px; margin-right: 10px" id="personal-replace" value="1">代付款证明（一图）：
								</label>
									<div class="form-group newInput personal-replace-img" style="display: none" id="personal-replace-img"><input id="file-07" class="file-loading" type="file"></div></div>
						</div>
							<div class="form-inline personal-card" style="display: none" id="personal-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
								<div class="form-group newInput"><input id="file-08" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
					</div></form>
					<form action="kp.php" id="use_company"><input type="hidden" id="conid" name="conid" value="${co.id }"><input type="hidden" id="currpage" name="currpage" value="${currpage}">
						<div class="company_con" style="display: none">
							<div class="form-inline">
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>单位名称：</label> <input type="text" class="form-control" name="name"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>税号：</label> <input type="text" class="form-control" name="tax"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开户行：</label> <input type="text" class="form-control" name="bank"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>银行卡号：</label> <input type="text" class="form-control" name="bankCard" oninput="user(this)"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>经营地址：</label> <input type="text" class="form-control" name="address"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>联系电话：</label> <input type="text" class="form-control" name="phone"></div>
						</div> <label style="color: red; margin-left: 49px; margin-top: 5px;">只能上传后缀为jpg,png,jpeg,bmp的图片</label>
							<div class="form-inline" id="company-license"><label style="width: 120px; text-align: right">营业执照：</label>
								<div class="form-group newInput"><input id="file-09" class="file-loading" type="file"></div></div>
							<div class="form-inline" id="company-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
								<div class="form-group newInput"><input id="file-10" class="file-loading" type="file" multiple></div></div>
							<div class="form-inline">
								<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> <input type="checkbox" style="top: 2px; margin-right: 10px" id="company-replace" value="1">代付款证明（一图）：
								</label>
									<div class="form-group newInput company-replace-img" style="display: none" id="company-replace-img"><input id="file-11" class="file-loading" type="file"></div></div>
						</div>
							<div class="form-inline company-card" style="display: none" id="company-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
								<div class="form-group newInput"><input id="file-12" class="file-loading" type="file" multiple data-max-file-count="2"></div></div> <c:if test="${(not empty invoice) and (not empty invoice.nopassreason)}">
								<div class="form-inline">
									<div class="form-group newInput"><label>不通过原因：</label>${invoice.nopassreason}</div>
								</div>
							</c:if>
					</div></form>
			</div> <!--</form>-->
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
	var picArr=[],uploadurl=$("#uploadUrl").val();//图片数组
	//    var previewIdArr = [];//图片上传id数组
	function initFileInput(ctrlName,type,belongNum){
		var control=$('#' + ctrlName);
		control.fileinput({language:'zh', //设置语言
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
		//minFileCount: 0,
		//            maxFileCount: 3, //表示允许同时上传的最大文件个数
		enctype:'multipart/form-data',validateInitialCount:true,previewFileIcon:"<i class='glyphicon glyphicon-king'></i>",msgFilesTooMany:"选择上传的文件数量({n}) 超过允许的最大数值{m}！",layoutTemplates:{
		//actionUpload:"",   //去掉单独上传按钮
		//                actionDelete:"",
		//                actionZoom:""
		}}).on(
		"fileuploaded",
		function(event,data,previewId,index){ //一个文件上传成功
			//belongNum 用来判断属于哪个表单
			if(belongNum == 1){
				data.response.pid=index;
				picArr.push(data.response);
				if(picArr.length == $('#add_form .file-preview-frame').length){
					var smal=$("[name='type']:checked"),sv;
					if(smal.length){
						sv=smal.val()
					}else{
						sv="";
					}
					$.ajax({url:$("#formUrl").val(),data:$('#add_form').serialize() + "&big=" + $("[name='invoice']:checked").val() + "&small=" + sv + "&arr=" + JSON.stringify(picArr) + "&replace="
					+ ($('#add-replace').prop('checked') ? "1" : ""),dataType:'json',type:'post',success:function(data){
						console.log(data);
						$('.mask').hide();
						alert("保存成功！");
						back();
					}});
				}
			}else if(belongNum == 2){
				data.response.pid=index;
				picArr.push(data.response);
				if(picArr.length == $('#use_personal .file-preview-frame').length){
					$.ajax({url:$("#formUrl").val(),data:$('#use_personal').serialize() + "&big=" + $("[name='invoice']:checked").val() + "&small=" + $("[name='type']:checked").val() + "&arr="
					+ JSON.stringify(picArr) + "&replace=" + ($('#personal-replace').prop('checked') ? "1" : ""),dataType:'json',type:'post',success:function(data){
						console.log(data);
						$('.mask').hide();
						alert("保存成功！");
						back();
					}});
				}
			}else if(belongNum == 3){
				data.response.pid=index;
				picArr.push(data.response);
				if(picArr.length == $('#use_company .file-preview-frame').length){
					$.ajax({url:$("#formUrl").val(),data:$('#use_company').serialize() + "&big=" + $("[name='invoice']:checked").val() + "&small=" + $("[name='type']:checked").val() + "&arr="
					+ JSON.stringify(picArr) + "&replace=" + ($('#company-replace').prop('checked') ? "1" : ""),dataType:'json',type:'post',success:function(data){
						console.log(data);
						$('.mask').hide();
						alert("保存成功！");
						back();
					}});
				}
			}
			console.log('文件上传成功！');
		}).on('fileerror',function(event,data,msg){ //一个文件上传失败
			console.log('文件上传失败！' + data.id);
		});
	}
	//银行卡号正则匹配
	function user(code){
		//[^\d\s] 除了数字和任何空白字符
		//       $(code).val($(code).val().replace(/[^\d\s]+$/g,""));
		$(code).val($(code).val().replace(/[^\d\s]/g,'').replace(/(\d{4})(?=\d)/g,"$1 "));
		if(!/\d{14,19}/.test($(code).val())){
			$(this).focus();
		}
	}
	//增值税发票专业发票选择
	$(".du-choose-invoice input").click(function(){
		if($(this).val() == 1){
			$('.add_bill').show();
			$('.use_bill').hide();
		}else if($(this).val() == 2){
			$('.add_bill').hide();
			$('.use_bill').show();
		}
	});
	//个人 企业选择
	$('.du-choose-type input').click(function(){
		if($(this).val() == 1){
			$('.personal_con').show();
			$('.company_con').hide();
		}else if($(this).val() == 2){
			$('.personal_con').hide();
			$('.company_con').show();
		}
	});
	//代付款选择
	$('#add-replace').click(function(){
		if($(this).prop('checked')){
			//            create($(this));
			$(".add-replace-img,.add-card").show();
		}else{
			$(".add-replace-img,.add-card").hide();
		}
	});
	//创建代付款节点
	/*   function create(ele){
	       $('<div class="form-group newInput replace"> <input id="file-03" class="file-loading" type="file" name="payment"></div>').appendTo(ele.parent().parent());
	       $('<div class="form-inline replace"> <label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label> <div class="form-group newInput"> <input id="file-04" class="file-loading" type="file" multiple data-max-file-count="2"name="replaceCardId"></div></div>').appendTo(ele.parent().parent().parent().parent())
	       initFileInput("file-03", 3);
	       initFileInput("file-04", 4);
	   }*/
	$('#personal-replace').click(function(){
		if($(this).prop('checked')){
			$(".personal-replace-img,.personal-card").show();
		}else{
			$(".personal-replace-img,.personal-card").hide();
		}
	});
	$('#company-replace').click(function(){
		if($(this).prop('checked')){
			$(".company-replace-img,.company-card").show();
		}else{
			$(".company-replace-img,.company-card").hide();
		}
	});
	//    $('#submit').click(function () {
	function submit(){
		if($('#add').prop('checked')){
			var add_form=$("#add_form");
			add_form.submit();
			if(vil("add_form")){
				//营业执照等是否上传判断
				if($('#add-license').find('.file-preview-frame').length == 0){
					alert('请选择营业执照');
					return false;
				}else if($("#add-flow").find('.file-preview-frame').length == 0){
					alert('请选择至少一张流水图');
					return false;
				}else if($("#add-replace").prop('checked')){
					if($('#add-replace-img').find('.file-preview-frame').length == 0){
						alert('请选择代付款证明');
						return false;
					}
					if($("#add-card").find('.file-preview-frame').length != 2){
						alert('代付款人身份证正反面不足2张');
						return false;
					}
				}
				$('.mask').show();
				$('#add_form .kv-file-upload').each(function(){
					$(this).click();
				});
			}
		}else if($("#use").prop('checked')){
			if($("#personal").prop('checked')){
				var use_personal=$("#use_personal");
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
					$('#use_personal .kv-file-upload').each(function(){
						$(this).click();
					});
				}
			}else if($("#company").prop('checked')){
				var use_company=$("#use_company");
				use_company.submit();
				if(vil("use_company")){
					//营业执照等是否上传判断
					if($('#company-license').find('.file-preview-frame').length == 0){
						alert('请选择营业执照');
						return false;
					}else if($("#company-flow").find('.file-preview-frame').length == 0){
						alert('请选择至少一张流水图');
						return false;
					}else if($("#company-replace").prop('checked')){
						if($('#company-replace-img').find('.file-preview-frame').length == 0){
							alert('请选择代付款证明');
							return false;
						}
						if($("#company-card").find('.file-preview-frame').length != 2){
							alert('代付款人身份证正反面不足2张');
							return false;
						}
					}
					$('.mask').show();
					$('#use_company .kv-file-upload').each(function(){
						$(this).click();
					});
				}
			}
		}
	}
	//是否通过表单验证
	function vil(id){
		var error=$("#" + id).find('.has-error');
		for(var i=0;i < error.length;i++){
			error.eq(i).find('.form-control').focus();
			return false;
		}
		return true;
	}
	$("#add_form")
	.bootstrapValidator(
	{ive:'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
	excluded:[':disabled',':hidden',':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
	submitButtons:'#submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
	message:'通用的验证失败消息',//好像从来没出现过
	feedbackIcons:{//根据验证结果显示的各种图标
	valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{money:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},name:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},tax:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},bank:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},bankCard:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},address:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},phone:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:100,message:'长度必须在小于100位字符'}}}}});
	$("#use_personal")
	.bootstrapValidator(
	{ive:'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
	excluded:[':disabled',':hidden',':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
	submitButtons:'#submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
	message:'通用的验证失败消息',//好像从来没出现过
	feedbackIcons:{//根据验证结果显示的各种图标
	valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{money:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},name:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},phone:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:100,message:'长度必须在小于100位字符'}}},cardId:{message:'身份证验证失败',validators:{notEmpty:{message:'身份证不能为空'},regexp:{regexp:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,message:'身份证格式填写错误'}}}}})
	$("#use_company")
	.bootstrapValidator(
	{ive:'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
	excluded:[':disabled',':hidden',':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
	submitButtons:'#submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
	message:'通用的验证失败消息',//好像从来没出现过
	feedbackIcons:{//根据验证结果显示的各种图标
	valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{money:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},name:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},tax:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},bank:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},bankCard:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},address:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},phone:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:100,message:'长度必须在小于100位字符'}}}}})
	function back(){
		location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
	}
	//绑定新增按钮事件
	$("#backBtn").bind("click",back);
	$(function(){
		initFileInput("file-01",1,1);
		initFileInput("file-02",2,1);
		initFileInput("file-03",3,1);
		initFileInput("file-04",4,1);
		initFileInput("file-05",5,2);
		initFileInput("file-06",2,2);
		initFileInput("file-07",3,2);
		initFileInput("file-08",4,2);
		initFileInput("file-09",1,3);
		initFileInput("file-10",2,3);
		initFileInput("file-11",3,3);
		initFileInput("file-12",4,3);
	});
</script>
</html>