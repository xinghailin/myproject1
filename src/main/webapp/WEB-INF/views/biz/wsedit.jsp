<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>开票</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="batchinvoicelist" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="invoicefileupload" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="batchinvoiceeditsave" namespace="car-ms"/>">
<input type="hidden" id="process" name="process" value="${process}">
<input type="hidden" id="currpage" name="currpage" value="${currpage}">
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

.close.fileinput-remove {
	display: none;
}

.form-group img {
	cursor: pointer;
	height: 150px;
	width: 150px;
}

.du-title {
	font-size: 16px;
	font-weight: 700;
}

.du-mask {
	background: rgba(0, 0, 0, .5);
	width: 100%;
	height: 100%;
	z-index: 999;
	position: absolute;
	top: 0;
	left: 0;
}

.du-contain {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
}

.du-main {
	position: absolute;
	top: 0;
	width: auto;
	height: 96%;
}

.du-tool {
	position: fixed;
	top: 20px;
	right: 50px;
	z-index: 999;
}

.du-tool button {
	width: 70px;
	height: 30px;
	text-align: center;
	margin: 0 10px;
	line-height: 30px;
	font-size: 16px;
	color: #fff;
	border: 1px solid #00A1CB;
	background: #05a8eb;
}

.du-tool button:hover {
	color: #fff;
	background: #0586bf;
}

.imgBOX {
	width: 150px;
	height: 180px;
	cursor: pointer;
	display: inline-block;
	position: relative;
}

.imgBOX .delete {
	margin-top: 6px;
	display: inline-block;
	text-align: center;
	width: 150px;
	height: 20px;
	font-size: 15px;
	color: #0586bf;
}

.upload img {
	width: 150px;
	height: 150px;
	cursor: pointer;
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
				<h3 class="title">开票编辑</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>
				<div class="form-inline">
					<div class="form-group newInput"><label>车架号：</label> <label>${car.vin}</label></div>
					<div class="form-group newInput"><label>品牌：</label> <label>${car.brand}</label></div>
					<div class="form-group newInput"><label>型号：</label> <label>${car.model}</label></div>
					<div class="form-group newInput"><label>版别：</label> <label>${car.version}</label></div>
					<div class="form-group newInput"><label>车架号：</label> <label>${car.vin}</label></div>
					<div class="form-group newInput"><label>批发价：</label> <label>${ws.price}</label></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput du-choose-invoice"><label><span style="color: red; font-weight: bold">*</span>开票类型：</label> <label class="radio-inline"><c:if
								test="${invoice.typebig eq 1}">增值税发票</c:if> <c:if test="${invoice.typebig eq 2}">机动车专用发票</c:if> </label></div>
			</div>
				<div class="use_bill"><c:if test="${invoice.typebig eq 2}">
						<div class="form-inline">
							<div class="form-group newInput du-choose-type"><label><span style="color: red; font-weight: bold">*</span>类型：</label> <label class="radio-inline"><c:if
										test="${invoice.typesmall eq 1}">个人</c:if> <c:if test="${invoice.typesmall eq 2}">企业</c:if> </label></div>
						</div>
					</c:if>
					<form id="use_personal"><input type="hidden" id="conid" name="conid" value="${ws.id }"> <input type="hidden" id="id" name="id" value="${invoice.id }"> <c:if
							test="${(invoice.typebig eq 1) or (invoice.typebig eq 2 and invoice.typesmall eq 2)}">
							<div class="personal_con">
								<div class="form-inline">
									<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money"
										value="${invoice.amount}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>单位名称：</label> <input type="text" class="form-control" name="name"
										value="${invoice.companyname}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>税号：</label> <input type="text" class="form-control" name="tax"
										value="${invoice.taxnum}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>开户行：</label> <input type="text" class="form-control" name="bank"
										value="${invoice.openbank}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>银行卡号：</label> <input type="text" class="form-control" name="bankCard"
										value="${invoice.banknum}" oninput="user(this)"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>经营地址：</label> <input type="text" class="form-control" name="address"
										value="${invoice.runaddress}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>联系电话：</label> <input type="text" class="form-control" name="phone"
										value="${invoice.phone}"></div>
							</div>
								<div class="form-inline" id="personal-myCard"><label style="margin-left: 50px;">营业执照（一图）：</label>
									<div class="form-group upload"><c:forEach var="item" items="${lst1}">
											<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
													class="glyphicon glyphicon-trash"></i> 移除
											</span></div>
										</c:forEach></div>
									<div class="form-group newInput upload1"><input id="file-01" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
								<div class="form-inline" id="personal-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
									<div class="form-group upload"><c:forEach var="item" items="${lst2}">
											<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
													class="glyphicon glyphicon-trash"></i> 移除
											</span></div>
										</c:forEach></div>
									<div class="form-group newInput upload1"><input id="file-02" class="file-loading" type="file" multiple></div></div> <c:if test="${invoice.behalfpay eq '1'}">
									<div class="form-inline">
										<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> 代付款证明（一图）： </label>
											<div class="form-group upload"><c:forEach var="item" items="${lst3}">
													<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
															class="glyphicon glyphicon-trash"></i> 移除
													</span></div>
												</c:forEach></div>
											<div class="form-group newInput upload1"><input id="file-03" class="file-loading" type="file"></div></div>
									</div>
									<div class="form-inline personal-card" id="personal-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
										<div class="form-group upload"><c:forEach var="item" items="${lst4}">
												<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
														class="glyphicon glyphicon-trash"></i> 移除
												</span></div>
											</c:forEach></div>
										<div class="form-group newInput upload1"><input id="file-04" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
								</c:if>
							</div>
						</c:if> <c:if test="${invoice.typebig eq 2 and invoice.typesmall eq 1}">
							<div class="personal_con">
								<div class="form-inline">
									<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money"
										value="${invoice.amount}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>姓名：</label> <input type="text" class="form-control" name="name"
										value="${invoice.companyname}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>电话：</label> <input type="text" class="form-control" name="phone"
										value="${invoice.phone}"></div>
									<div class="form-group newInput vali"><label><span style="color: red">*</span>身份证号：</label> <input type="text" class="form-control" name="cardId"
										value="${invoice.identify}"></div>
							</div>
								<div class="form-inline" id="personal-myCard"><label style="margin-left: 50px;">身份证正反面（两图）：</label>
									<div class="form-group upload"><c:forEach var="item" items="${lst5}">
											<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
													class="glyphicon glyphicon-trash"></i> 移除
											</span></div>
										</c:forEach></div>
									<div class="form-group newInput upload1"><input id="file-05" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
								<div class="form-inline" id="personal-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
									<div class="form-group upload"><c:forEach var="item" items="${lst2}">
											<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
													class="glyphicon glyphicon-trash"></i> 移除
											</span></div>
										</c:forEach></div>
									<div class="form-group newInput upload1"><input id="file-02" class="file-loading" type="file" multiple></div></div> <c:if test="${invoice.behalfpay eq '1'}">
									<div class="form-inline">
										<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> 代付款证明（一图）： </label>
											<div class="form-group upload"><c:forEach var="item" items="${lst3}">
													<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
															class="glyphicon glyphicon-trash"></i> 移除
													</span></div>
												</c:forEach></div>
											<div class="form-group newInput upload1"><input id="file-03" class="file-loading" type="file"></div></div>
									</div>
									<div class="form-inline personal-card" id="personal-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
										<div class="form-group upload"><c:forEach var="item" items="${lst4}">
												<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i
														class="glyphicon glyphicon-trash"></i> 移除
												</span></div>
											</c:forEach></div>
										<div class="form-group newInput upload1"><input id="file-04" class="file-loading" type="file" multiple data-max-file-count="2"></div></div>
								</c:if>
								<div class="form-inline">
									<div class="form-group newInput"><label>门店部补填原因：</label>${invoice.backreason}</div>
							</div>
							</div>
						</c:if></form>
					<div class="du-btn">
						<button class="btn btn-danger" role="button" id="submit" style="padding: 6px 38px" onclick="submit()">保存</button> <a href="javascript:;" class="btn btn-warning" role="button"
						style="padding: 6px 38px" id="backBtn">返回 </a>
				</div></div>
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
	var picArr=[],arr=[];//图片数组
	var previewIdArr=[],totalpic,use_personal,haserror=false,uploadurl=$("#uploadUrl").val();//图片上传id数组
	function initFileInput(ctrlName,type){
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
		//overwriteInitial : false,
		//minFileCount: 0,
		//            maxFileCount: 3, //表示允许同时上传的最大文件个数
		enctype:'multipart/form-data',validateInitialCount:true,previewFileIcon:"<i class='glyphicon glyphicon-king'></i>",msgFilesTooMany:"选择上传的文件数量({n}) 超过允许的最大数值{m}！",layoutTemplates:{
		//actionUpload:"",   //去掉单独上传按钮
		//                actionDelete:"",
		//                actionZoom:""
		}}).on("fileuploaded",function(event,data,previewId,index){ //一个文件上传成功
			if(data.response.add){
				data.response.pid=index;
				picArr.push(data.response);
				if(picArr.length == totalpic){
					subm();
				}
			}else{
				console.log('文件上传失败');
				haserror=true;
				subm();
			}
		}).on('fileerror',function(event,data,msg){ //一个文件上传失败
			console.log('文件上传失败！' + data.id);
			haserror=true;
			subm();
		});
	}
	//增值税发票专业发票选择
	//个人 企业选择
	//代付款选择
	function submit(){
		use_personal=$("#use_personal");
		use_personal.submit();
		if(vil("use_personal")){
			<c:choose>
			<c:when test="${invoice.typebig eq 2 and invoice.typesmall eq 1}">
			if(formGroup.length > 2){
				if(multipleTwo(0)){}else if(hasone(1)){}else if(multipleOne(2)){}else if(multipleTwo(3)){}else{
					totalpic=$('.file-preview-frame').length;
					if(totalpic){
						$('.mask').show()
						$('.kv-file-upload').click();
					}else{
						subm()
					}
				}
			}else if(formGroup.length == 2){
				if(multipleTwo(0)){}else if(hasone(1)){}else{
					totalpic=$('.file-preview-frame').length;
					if(totalpic){
						$('.mask').show()
						$('.kv-file-upload').click();
					}else{
						subm()
					}
				}
			}
			</c:when>
			<c:otherwise>
			if(formGroup.length > 2){
				if(multipleOne(0)){}else if(hasone(1)){}else if(multipleOne(2)){}else if(multipleTwo(3)){}else{
					totalpic=$('.file-preview-frame').length;
					if(totalpic){
						$('.mask').show()
						$('.kv-file-upload').click();
					}else{
						subm()
					}
				}
			}else if(formGroup.length == 2){
				if(multipleOne(0)){}else if(hasone(1)){}else{
					totalpic=$('.file-preview-frame').length;
					if(totalpic){
						$('.mask').show()
						$('.kv-file-upload').click();
					}else{
						subm()
					}
				}
			}
			</c:otherwise>
			</c:choose>
		}
	}
	function subm(){
		if(!haserror){
			{
				$.ajax({url:$("#formUrl").val(),data:use_personal.serialize() + "&dels=" + JSON.stringify(arr) + "&arr=" + JSON.stringify(picArr),dataType:'json',type:'post',success:function(data){
					console.log(data);
					if(data.status){
						$('.mask').hide();
						alert("保存成功！");
						back();
					}else{
						$('.mask').hide();
						alert(data.message);
					}
				},error:function(jqXHR,textStatus,errorThrown){
					$('.mask').hide();
					var jsontext=$.parseJSON(jqXHR.responseText);
					alert(jsontext.message);
				}});
			}
		}else{
			$('.mask').hide();
			alert("上传图片出现异常，请检查！");
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
	valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{money:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},name:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},tax:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},bank:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},bankCard:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},address:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:255,message:'长度必须在小于255位字符'}}},phone:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:100,message:'长度必须在小于100位字符'}}},cardId:{message:'身份证验证失败',validators:{notEmpty:{message:'身份证不能为空'},regexp:{regexp:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,message:'身份证格式填写错误'}}}}})
	function back(){
		location.href=$("#backUrl").val() + "?process="+$("#process").val()+"&currpage=" + $('#currpage').val();
	}
	//绑定新增按钮事件
	$("#backBtn").bind("click",back);
	initFileInput("file-01",1);
	initFileInput("file-05",5);
	initFileInput("file-02",2);
	initFileInput("file-03",3);
	initFileInput("file-04",4);
	var pictrue=$('.imgBOX img'),num=pictrue.length;
	pictrue
	.click(function(){
		$('body').css('overflow','hidden');
		var top=$(window).scrollTop();
		var index=pictrue.index(this);
		var n=1;
		$(
		"<div class='du-mask' style='margin-top: "+top+"px'><div class='du-tool'><button class='du-prev'>上一张</button><button class='du-next'>下一张</button><button class='du-large'>放大</button><button class='du-small'>缩小</button><button class='du-close'>关闭</button></div><div class='du-contain'><img class='du-main'></div></div>")
		.appendTo('body');
		var src=$(this).attr('src');
		var main=$(".du-main");
		main.attr('src',src);
		var width=main.width();
		main.css("left",($(window).width() - width) / 2);
		//        上一页
		$(".du-prev").click(function(){
			to_left()
		});
		//       向上一页
		function to_left(){
			if(index == 0){
				alert("已经是第一张");
			}else{
				index=index - 1;
				var psrc=pictrue.eq(index).attr('src');
				main.attr('src',psrc).css("transform","scale(1,1)");
				var width=main.width();
				main.css({left:($(window).width() - width) / 2,top:0});
				n=1;
			}
		}
		//        下一页
		$(".du-next").click(function(){
			to_right();
		});
		//       向下一页
		function to_right(){
			if(num == (index + 1)){
				alert("已经是最后一张");
			}else{
				index=index + 1;
				var nsrc=pictrue.eq(index).attr('src');
				main.attr('src',nsrc).css("transform","scale(1,1)");
				var width=main.width();
				main.css({left:($(window).width() - width) / 2,top:0});
				n=1;
			}
		}
		//        放大
		$(".du-large").click(function(){
			n=n + 0.2;
			main.css("transform","scale(" + n,n + ")");
			//            drag(main.get(0));
		});
		//        缩小
		$(".du-small").click(function(){
			if(n > 0.6){
				n=n - 0.2;
				main.css("transform","scale(" + n,n + ")");
				//                drag(main.get(0))
			}
		});
		//        关闭
		$(".du-close").click(function(){
			$('.du-mask').remove();
			$('body').css('overflow','auto');
		})
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
	//删除
	$(".delete").click(function(){
		var $th=$(this);
		//		  var type=$(item).siblings('img').attr('type');
		var imgid=$th.siblings('img').attr('imgid');
		if(imgid){
			arr.push({id:imgid});
		}
		$th.parent().remove();
		//		  console.log(arr);
		//		  pictrue.unbind();
		pictrue=$('.imgBOX img'),num=pictrue.length
		console.log(num,arr);
		//			pictrue.click(pclick);
	})
	var formGroup=$('.upload1');
	var upload=$('.upload');
	//上传两张图
	function multipleTwo(index){
		var addNum=formGroup.eq(index).find('.file-preview-frame').length;
		var oldNum=upload.eq(index).find('img').length;
		var text=upload.eq(index).siblings('label').html();
		if(addNum + oldNum > 2){
			alert(text + '数量[' + (addNum + oldNum) + ']超出限制2张，请移除不需要的图片')
			return true;
		}else if(addNum + oldNum < 2){
			alert(text + '上传数量不足2张！');
			return true;
		}
		return false;
	}
	//上传一张图
	function multipleOne(index){
		var addNum=formGroup.eq(index).find('.file-preview-frame').length;
		var oldNum=upload.eq(index).find('img').length;
		var text=upload.eq(index).siblings('label').html();
		if(addNum + oldNum > 1){
			alert(text + '数量[' + (addNum + oldNum) + ']超出限制1张，请移除不需要的图片')
			return true;
		}else if(addNum + oldNum < 1){
			alert(text + '上传数量不足1张！');
			return true;
		}
		return false;
	}
	//必须有图
	function hasone(index){
		var addNum=formGroup.eq(index).find('.file-preview-frame').length;
		var oldNum=upload.eq(index).find('img').length;
		var text=upload.eq(index).siblings('label').html();
		if(addNum + oldNum == 0){
			alert(text + '至少上传1张！')
			return true;
		}
		return false;
	}
	//银行卡号正则匹配
	function user(code){
		$(code).val($(code).val().replace(/[^\d\s]/g,'').replace(/(\d{4})(?=\d)/g,"$1 "));
		if(!/\d{14,19}/.test($(code).val())){
			$(this).focus();
		}
	}
</script>
</html>