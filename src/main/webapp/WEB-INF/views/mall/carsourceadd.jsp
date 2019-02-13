<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>新建车源</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="mallcarsourceindex" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="carsourcefileupload" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="carsourcesave" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
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
				<h3 class="title">新建车源</h3>
				<form id="use_personal"><input type="hidden" id="areaid" name="areaid" value="${site.id }"> <input type="hidden" id="areaname" name="areaname"
					value="${site.name }"><input type="hidden" name="unit" id="unit" value="${site.currencyunit }">
					<h4 style="padding: 10px 0;" class="list-group-item-danger">区域：${site.name}</h4>
					<div class="form-inline">
						<div class="form-group newInput"><label><span style="color: red;">*</span>品牌：</label> <select name="brands" id="brands" class="form-control">
								<option value="">--请选择--</option>
								<c:forEach var="item" items="${brands}">
									<option value="${item.id}">${item.brand}</option>
								</c:forEach>
						</select></div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>型号：</label> <select name="model" id="model" class="form-control">
								<option value="">--请选择--</option>
						</select></div> <%-- <div class="form-group newInput"><label><span style="color: red">*</span>外观颜色：</label> <input type="text" class="form-control" name="outcolor" id="outcolor"></div>
						<div class="form-group newInput"><label><span style="color: red">*</span>内饰颜色：</label> <input type="text" class="form-control" name="incolor" id="incolor"></div> --%>
						<div class="form-group newInput"><label><span style="color: red">*</span>车价：</label> <input type="text" class="form-control" name="carprice" id="carprice">${site.currencyunit}</div>
						<%-- <div class="form-group newInput"><label>加装费：</label> <input type="text" class="form-control" name="decorateprice" id="decorateprice">${site.currencyunit}</div> --%>
						<div class="form-group newInput"><label><span style="color: red">*</span>海外4s店杂费：</label> <input type="text" class="form-control" name="oversea4sprice"
							id="oversea4sprice">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>优惠：</label> <input type="text" class="form-control" name="favor" id="favor">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>佣金：</label> <input type="text" class="form-control" name="cmsn" id="cmsn">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>境外短驳费：</label> <input type="text" class="form-control" name="overseadrayage"
							id="overseadrayage">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>境外短期保险：</label> <input type="text" class="form-control" name="overseashotinsurance"
							id="overseashotinsurance">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>服务费：</label> <input type="text" class="form-control" name="serviceprice" id="serviceprice">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>海运费：</label> <input type="text" class="form-control" name="seatransportprice"
							id="seatransportprice">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red">*</span>海运保险：</label> <input type="text" class="form-control" name="seatransportinsurance"
							id="seatransportinsurance">${site.currencyunit}</div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>排量(cc)：</label> <input type="text" class="form-control" name="displacement" id="displacement"
							placeholder="输入整数，单位：cc"></div>
						<div class="form-group newInput"><label>库存：</label> <input type="text" class="form-control" name="storagenum" id="storagenum" placeholder="输入整数"></div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>定金类别：</label> <label class="radio-inline"> <input type="radio" name="type" value="1">
								美产
						</label><label class="radio-inline"><input type="radio" name="type" value="2"> 非美产 </label></div>
						<div class="form-group newInput"><label><span style="color: red;">*</span>定金比例(%)：</label> <input type="text" class="form-control" name="downpayscale" id="downpayscale"
							placeholder="最多两位小数"></div>
						<div class="form-group newInput"><label>开证公司：</label> <select name="issuingcompany" id="issuingcompany" class="form-control">
								<option value="">--请选择--</option>
								<c:forEach var="item" items="${companys}">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>
						</select></div>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">车辆图片（图片格式jpg,png,jpeg)</h4>
					<div class="form-inline" id="personal-myCard">
						<div class="form-inline" style="">
							<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="addpic()">新增</button>
					</div>
						<div class="form-group newInput">
							<div class="up-img other"><span>点击上传</span> <img src=""> <input type="file" id="FileId" name="FileName" class="imginput" onchange="picPreview(this)"> <input
								type="hidden" name="carpic" value="" id="picadd" /></div>
					</div>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">配置</h4>
					<div class="form-inline" style="width: 100%;">
						<%-- <button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="addconfig()">新增</button> --%>
						<div class="form-group newInput" style="width: 75%;"><label>配置：</label> <textarea name="config" id="config" class="form-control" placeholder="配置之间用^隔开" cols="84"
							rows="5"></textarea></div>
				</div>
					<div class="form-inline configdiv" style="width: 100%;">
						<%--<div class="form-group">
							<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;"></button>
					</div>--%>
						<div class="form-group newInput" style="width: 50%;"><label>配置值：</label> <input type="text" class="form-control" name="vconfig" style="width: 80%;"
							placeholder="配置值之间用^隔开，填入内容代表有配置，否则无"></div>
						<div class="form-group" style="width: 40%;"><label>版本：</label> <select name="kconfig" class="form-control">
								<option value="">--请选择--</option>
						</select></div>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">颜色、价格</h4>
					<div class="form-inline">
						<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="color()">新增</button>
				</div>
					<div id="divcolor">
						<div class="form-inline colordiv" style="width: 100%;"><div class="form-group"><button type="button" class="btn btn-primary" role="button"
								style="padding: 6px 18px; width: 100px;"></button></div>
							<div class="form-group newInput"><label>外观颜色：</label> <input type="text" class="form-control" name="outcolor" placeholder="限制50字以内"></div>
							<div class="form-group newInput"><label>内饰颜色：</label> <input type="text" class="form-control" name="incolor" placeholder="限制50字以内"></div>
							<div class="form-group newInput"><label>价格：</label> <input type="text" class="form-control" name="price">${site.currencyunit}</div></div>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">加装包（图片格式jpg,png,jpeg）</h4>
					<div class="form-inline">
						<button type="button" class="btn btn-primary" role="button" style="padding: 6px 18px; width: 100px;" onclick="decorate()">新增</button>
				</div></form>
				<div class="du-btn">
					<button class="btn btn-danger" role="button" id="submit" style="padding: 6px 38px" onclick="submit()">保存</button> <a href="javascript:;" class="btn btn-warning" role="button"
					style="padding: 6px 38px" id="backBtn">返回 </a>
			</div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/ajaxfileupload.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/bootstrapValidator.min.js"></script>
<script src="${scriptBasePath}/mall/carsourceadd.js?r=<%=new Date()%>"></script>
</html>