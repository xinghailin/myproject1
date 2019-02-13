<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>编辑车源</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="mallcarsourceeditindex" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="carsourcefileupload" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="carsourceeditsave" namespace="car-ms"/>">
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

.form-control-feedback {
	
}

.form-inline .has-feedback .form-control-feedback {
	top: 10px;
	right: 10px;
}

/* .form-inline .form-group.vali {
	height: 62px;
} */
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

.decoratediv span, .decoratediv1 span {
	text-align: center;
	line-height: 100px;
	font-size: 16px;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	margin: auto;
	color: #333;
}

.decoratediv img, decoratediv1 img {
	width: 100px;
	height: 100px;
	z-index: 99;
}

.up-img {
	display: inline-block;
	width: 200px;
	height: 200px;
	position: relative;
}

.up-img span {
	display: flex; position：absolute;
	top: 0;
	left: 0;
	width: 200px;
	height: 200px;
	justify-content: center;
	align-items: center;
	color: #777;
	font-size: 16px;
	width: 200px;
	background: #eee;
}

.up-img .imginput {
	width: 200px;
	height: 200px;
	position: absolute;
	z-index: 100;
	opacity: 0;
	left: 0;
	top: 0;
}

.up-img img {
	width: 200px;
	height: 200px;
	position: absolute;
	z-index: 99;
	left: 0;
	top: 0;
}

img[src=""] {
	opacity: 0;
}

.button-remove {
	width: 60px;
	height: 25px;
	line-height: 25px;
	background: #05a8eb;
	color: #fff;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 10px;
	margin: auto;
	border: 0;
}

.other {
	width: 200px;
	height: 250px;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">编辑车源</h3>
				<form id="use_personal"><input type="hidden" name="unit" id="unit" value="${cs.unit }"><input type="hidden" id="id" name="id" value="${cs.id }"> <input
					type="hidden" id="max1" name="max1" value="${fn:length(pics)}"><input type="hidden" id="max2" name="max2" value="${fn:length(ds)}">
					<h4 style="padding: 10px 0;" class="list-group-item-danger">区域：${cs.areaname}</h4>
					<div class="form-inline">
						<div class="form-group newInput"><label><span style="color: red;">*</span>品牌：</label> ${cs.brand}</div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>型号：</label> ${cs.model}</div>
						<%-- <div class="form-group newInput"><label><span style="color: red">*</span>外观颜色：</label> <input type="text" class="form-control" name="outcolor" value="${cs.outcolor}"
							id="outcolor"></div>
						<div class="form-group newInput"><label><span style="color: red">*</span>内饰颜色：</label> <input type="text" class="form-control" name="incolor" value="${cs.incolor}"
							id="incolor"></div> --%>
						<div class="form-group newInput"><label><span style="color: red">*</span>车价：</label> <input type="text" class="form-control" name="carprice" value="${cs.carprice}"
							id="carprice">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>海外4s店杂费：</label> <input type="text" class="form-control" name="oversea4sprice"
							value="${cs.oversea4sprice}" id="oversea4sprice">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>优惠：</label> <input type="text" class="form-control" name="favor" value="${cs.favor}" id="favor">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>佣金：</label> <input type="text" class="form-control" name="cmsn" value="${cs.cmsn}" id="cmsn">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>境外短驳费：</label> <input type="text" class="form-control" name="overseadrayage"
							value="${cs.overseadrayage}" id="overseadrayage">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>境外短期保险：</label> <input type="text" class="form-control" name="overseashotinsurance"
							value="${cs.overseashotinsurance}" id="overseashotinsurance">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>服务费：</label> <input type="text" class="form-control" name="serviceprice"
							value="${cs.serviceprice}" id="serviceprice">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>海运费：</label> <input type="text" class="form-control" name="seatransportprice"
							value="${cs.seatransportprice}" id="seatransportprice">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>海运保险：</label> <input type="text" class="form-control" name="seatransportinsurance"
							value="${cs.seatransportinsurance}" id="seatransportinsurance">${cs.unit}</div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>排量(cc)：</label> <input type="text" class="form-control" name="displacement"
							value="${cs.displacement}" id="displacement" placeholder="输入整数，单位：cc"></div>
						<div class="form-group newInput"><label>库存：</label> <input type="text" class="form-control" name="storagenum" value="${cs.storagenum}" id="storagenum"
							placeholder="输入整数"></div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>定金类别：</label> <label class="radio-inline"> <input type="radio" name="type" value="1"
								<c:if test="${cs.type eq 1}">checked</c:if>> 美产
						</label><label class="radio-inline"><input type="radio" name="type" value="2" <c:if test="${cs.type eq 2}">checked</c:if>> 非美产 </label></div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>定金比例(%)：</label> <input type="text" class="form-control" name="downpayscale"
							value="${cs.downpayscale}" id="downpayscale" placeholder="最多两位小数"></div>
						<div class="form-group newInput"><label>开证公司：</label> <select name="issuingcompany" id="issuingcompany" class="form-control">
								<option value="">--请选择--</option>
								<c:forEach var="item" items="${cps}">
									<option value="${item.id}" <c:if test="${cs.issuingid eq item.id}">selected</c:if>>${item.name}</option>
								</c:forEach>
						</select></div>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">车辆图片（图片格式jpg,png,jpeg)</h4>
					<div class="form-inline" id="personal-myCard">
						<div class="form-inline" style="">
							<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="addpic()">新增</button>
					</div> <c:if test="${empty pics}">
							<div class="form-group newInput">
								<div class="up-img other"><span>点击上传</span> <img src=""> <input type="file" id="FileId" name="FileName" class="imginput" onchange="picPreview(this)"> <input
									type="hidden" name="carpic" value="" id="picadd" /></div>
							</div>
						</c:if> <c:forEach var="item" items="${pics}" varStatus="ss">
							<c:if test="${ss.index==0}">
								<div class="form-group newInput">
									<div class="up-img other"><span>点击上传</span> <img src="${ftpFileUrl}${item.picurl}"> <input type="file" id="FileId" name="FileName" class="imginput"
										onchange="picPreview(this)"> <input type="hidden" name="carpic" value="" id="picadd" v="${item.id}" f="1" /></div>
								</div>
							</c:if>
							<c:if test="${ss.index>0}">
								<div class="form-group newInput">
									<div class="up-img other"><span>点击上传</span> <img src="${ftpFileUrl}${item.picurl}"> <input type="file" id="FileId${ss.index}" name="FileName${ss.index}"
										class="imginput" onchange="picPreview(this)"> <input type="hidden" name="carpic${ss.index}" value="" id="picadd${ss.index}" v="${item.id}" />
										<button type="button" class="button-remove" v="${item.id}">删除</button></div>
								</div>
							</c:if>
						</c:forEach>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">配置</h4>
					<div class="form-inline" style="width: 100%;">
						<%--<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="addconfig()">新增</button>--%>
						<div class="form-group newInput" style="width: 75%;"><label>配置：</label> <textarea name="config" id="config" class="form-control" placeholder="配置之间用^隔开" cols="84"
							rows="5">${cs.config}</textarea></div>
				</div> <c:if test="${empty cos}">
						<div class="form-inline configdiv" style="width: 100%;">
							<%--<div class="form-group">
								<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;"></button>
						</div>--%>
							<div class="form-group newInput" style="width: 50%;"><label>配置值：</label> <input type="text" class="form-control" name="vconfig" style="width: 80%;"
								placeholder="配置值之间用空格隔开，填入内容代表有配置，否则无"></div>
							<div class="form-group" style="width: 40%;"><label>版本：</label> <select name="kconfig" class="form-control">
									<option value="">--请选择--</option>
									<c:forEach var="ite" items="${vs}">
										<option value="${ite.version}">${ite.version}</option>
									</c:forEach>
							</select></div>
						</div>
					</c:if> <c:forEach var="item" items="${cos}" varStatus="ss">
						<c:if test="${ss.index==0}">
							<div class="form-inline configdiv" style="width: 100%;">
								<%--<div class="form-group">
									<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;"></button>
							</div>--%>
								<div class="form-group newInput" style="width: 50%;"><label>配置值：</label> <input type="text" class="form-control" name="vconfig" value="${item.v}" style="width: 80%;"
									placeholder="配置值之间用空格隔开，填入内容代表有配置，否则无"></div>
								<div class="form-group" style="width: 40%;"><label>版本：</label> <select name="kconfig" class="form-control">
										<option value="">--请选择--</option>
										<c:forEach var="ite" items="${vs}">
											<option value="${ite.version}" <c:if test="${ite.version eq item.k}">selected</c:if>>${ite.version}</option>
										</c:forEach>
								</select></div>
							</div>
						</c:if>
						<%--<c:if test="${ss.index>0}">
							<div class="form-inline configdiv1" style="width: 100%;">
								<div class="form-group">
									<button type="button" class="btn btn-danger" role="button" style="padding: 6px 18px; width: 100px;">删除</button>
							</div>
								<div class="form-group newInput" style="width: 50%;"><label>配置值：</label> <input type="text" class="form-control" name="vconfig" value="${item.v}" style="width: 80%;"
									placeholder="配置值之间用空格隔开，填入内容代表有配置，否则无"></div>
								<div class="form-group" style="width: 40%;"><label>版本：</label> <select name="kconfig" class="form-control">
										<option value="">--请选择--</option>
										<c:forEach var="ite" items="${vs}">
											<option value="${ite.version}" <c:if test="${ite.version eq item.k}">selected</c:if>>${ite.version}</option>
										</c:forEach>
								</select></div>
							</div>
						</c:if>--%>
					</c:forEach>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">颜色、价格</h4>
					<div class="form-inline">
						<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="color()">新增</button>
				</div>
					<div id="divcolor"><c:forEach var="item" items="${colors}" varStatus="ss">
							<c:if test="${ss.index==0}">
								<div class="form-inline colordiv" style="width: 100%;"><div class="form-group"><button type="button" class="btn btn-primary" role="button"
										style="padding: 6px 18px; width: 100px;" v="${item.id}"></button></div>
									<div class="form-group newInput"><label>外观颜色：</label> <input type="text" class="form-control" name="outcolor" placeholder="限制50字以内" value="${item.title}"></div>
									<div class="form-group newInput"><label>内饰颜色：</label> <input type="text" class="form-control" name="incolor" placeholder="限制50字以内" value="${item.detail}"></div>
									<div class="form-group newInput"><label>价格：</label> <input type="text" class="form-control" name="price" value="${item.price}">${cs.unit}</div></div>
							</c:if>
							<c:if test="${ss.index>0}">
								<div class="form-inline colordiv" style="width: 100%;"><div class="form-group"><button type="button" class="btn btn-danger" role="button"
										style="padding: 6px 18px; width: 100px;" v="${item.id}">删除</button></div>
									<div class="form-group newInput"><label>外观颜色：</label> <input type="text" class="form-control" name="outcolor" placeholder="限制50字以内" value="${item.title}"></div>
									<div class="form-group newInput"><label>内饰颜色：</label> <input type="text" class="form-control" name="incolor" placeholder="限制50字以内" value="${item.detail}"></div>
									<div class="form-group newInput"><label>价格：</label> <input type="text" class="form-control" name="price" value="${item.price}">${cs.unit}</div></div>
							</c:if>
						</c:forEach></div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">加装包（图片格式jpg,png,jpeg）</h4>
					<div class="form-inline">
						<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="decorate()">新增</button>
				</div> <c:forEach var="item" items="${ds}" varStatus="ss">
						<div class="form-inline decoratediv" style="width: 100%;">
							<div class="form-group"><button type="button" class="btn btn-danger" role="button" style="padding: 6px 18px; width: 100px;" v="${item.id}">删除</button></div>
							<div class="form-group newInput"><label>名称：</label> <input type="text" class="form-control" name="deconame" value="${item.title}" placeholder="限制15字以内" v="${item.id}"></div>
							<div class="form-group newInput""><label>内容：</label> <input type="text" class="form-control" name="decodetail" value="${item.detail}"></div>
							<div class="form-group newInput"><label>价格：</label> <input type="text" class="form-control" name="decoprice" value="${item.price}">${cs.unit}</div>
							<div class="form-group newInput"><label>配置图片：</label>
								<div class="up-img"><span>点击上传</span> <img src="<c:if test="${not empty item.picurl}">${ftpFileUrl}${item.picurl}</c:if>"> <input type="file"
									id="decFileId${ss.index}" name="decFileName${ss.index}" class="imginput" onchange="imagePreview(this)"> <input type="hidden" name="outpic" value=""
									id="hidadd${ss.index}" /></div></div>
							<div class="form-group newInput"><label>默认选中：</label> <label class="radio-inline"> <input type="radio" name="default${ss.index}" value="1"
									<c:if test="${1 eq item.deflt}">checked</c:if>> 是
							</label><label class="radio-inline"><input type="radio" name="default${ss.index}" value="2" <c:if test="${2 eq item.deflt}">checked</c:if>> 否 </label></div>
						</div>
					</c:forEach></form>
				<div class="du-btn">
					<button class="btn btn-danger" role="button" id="submit" style="padding: 6px 38px" onclick="submit()">保存</button> <a href="javascript:;" class="btn btn-warning" role="button"
					style="padding: 6px 38px" id="backBtn">返回 </a>
			</div>
		</div>
	</div>
</div>
	<div class="mask">
		<div class="loding"><img src="${contextPath}/img/loading1.gif">
			<p>正在上传中......</p></div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/ajaxfileupload.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/bootstrapValidator.min.js"></script>
<script src="${scriptBasePath}/mall/carsourceedit.js?r=<%=new Date()%>"></script>
</html>