<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="mallNeedAuditSaveUrl" value="<ufa:url fieldName="mallNeedAuditSave" namespace="car-ms"/>">
<input type="hidden" id="mallNeedAudit" value="<ufa:url fieldName="mallNeedAudit" namespace="car-ms"/>">
<div class="mian_right-new" id="EA">
	<style>
*[hidefocus], input, textarea, a {
	outline: none;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p,
	blockquote, th, td {
	padding: 0;
	margin: 0;
}

fieldset, img, html, body, iframe {
	border: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

li {
	list-style: none;
}

i {
	font-style: normal;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
}

caption, th {
	font-weight: normal;
	font-style: normal;
	text-align: left;
}

em, strong {
	font-weight: bold;
	font-style: normal;
}

body, textarea, select, input, pre {
	font-family: arial, microsoft yahei, helvetica, sans-serif;
	font-size: 14px;
	color: #555;
}

body {
	background: #f8f8f8;
	line-height: 1.5em;
	-webkit-text-size-adjust: none;
}

a, button {
	cursor: pointer;
}

textarea {
	resize: none;
	overflow: auto;
}

pre {
	white-space: pre-wrap;
}

a {
	color: #333;
	text-decoration: none;
}

input, select {
	border: 1px solid #ccc;
	border-radius: 2px;
	padding: 2px 0;
	text-align: center;
}

select {
	padding: 2px 8px;
}

.box {
	width: 1524px;
	overflow: hidden;
	color: #555;
	margin-left: 50px;
}

.buy-title {
	font-size: 24px;
	padding: 10px 0 30px;
}

.need-list {
	overflow: hidden;
	border-bottom: 1px solid #aaa;
	width: 100%;
	padding: 20px 0;
}

.list-left {
	width: 80%;
	float: left;
}

.list-right {
	width: 20%;
	float: left;
	height: 167px;
}

.list-right button {
	width: 70px;
	border: none;
	background: #4d90fe;
	color: #fff;
	height: 30px;
	display: block;
	margin: 0 auto;
}

.list-right .addss {
	margin: 30px auto;
}

.left-select {
	overflow: hidden;
	width: 100%;
}

.select-box {
	width: 30%;
	padding: 10px 0 10px 0;
	float: left;
	box-sizing: border-box;
}

.select-box select {
	width: 190px;
}

.left-bottom {
	overflow: hidden;
	margin-top: 15px;
}

.set {
	width: 40%;
	overflow: hidden;
	float: left;
	margin: 10px 0 10px 0;
}

.set span {
	display: block;
	float: left;
	margin-right: 10px;
}

.set textarea {
	width: 250px;
	height: 100px;
	overflow-y: auto;
	border: 1px solid #ccc;
}

.info {
	width: 60%;
	overflow: hidden;
	float: left;
}

.info>div {
	padding: 15px 0;
	box-sizing: border-box;
	width: 100%;
	overflow: hidden;
}

.info>div div {
	width: 50%;
	float: left;
}

.out_color {
	margin-right: 70px;
}

.submit {
	color: white;
	width: 100px;
	height: 30px;
	line-height: 30px;
	color: #fff;
	background: #4d90fe;
	text-align: center;
	margin: 100px auto;
	cursor: pointer;
}
</style>
	<body>
		<div class="box"><input id="currpage" type="hidden" name="currpage" value='${currpage}' /> <input id="ids" type="hidden" name="id" value='${jn.id}' />
			<h2 class="buy-title">车辆需求单</h2>
			<div class="select-box"><span style="font-weight: bold;">需求单名称：</span> <span style="font-weight: bold;">${jn.name}</span></div>
			<div class="select-box"><span style="font-weight: bold;">需求单编号：</span> <span style="font-weight: bold;">${jn.code}</span></div>
			<div class="select-box"><span style="font-weight: bold;">主动采购方：</span> <span style="font-weight: bold;">${jn.needer}</span></div>
			<div class="select-box"><span style="font-weight: bold;">商城合同编号：</span> <span style="font-weight: bold;">${jn.mallcontractcode}</span></div>
			<ul class="buy-need">
				<li class="need-list">
					<ul class="list-left">
						<c:forEach items="${lst }" var="need" varStatus="ss">
							<hr style="color: red; font-size: 12px;">
							<div style="font-weight: bold;">需求单</div>
							<li class="left-select">
								<div class="set"><span style="font-weight: bold;">商城订单编号：</span> <span>${need.mallordercode}&nbsp;</span></div>
							</li>
							<li class="left-select">
								<div class="set"><span style="font-weight: bold;">品牌：</span> <span>${need.brand}&nbsp;</span></div>
								<div class="select-box" style="margin-left: 30px;"><span style="font-weight: bold;">型号：</span> <span>${need.model}&nbsp;</span></div>
								<div class="select-box" style="margin-left: -30px;"><span style="font-weight: bold;">版别：</span> <span>${need.version}&nbsp;</span></div>
							</li>
							<li class="left-bottom">
								<div class="set"><span style="font-weight: bold;">配置：</span> <span>${need.config}&nbsp;</span></div>
								<div class="info">
									<div>
										<div><span style="font-weight: bold;">外观颜色：</span> <span>${need.outcolor}&nbsp;</span></div>
										<div><span style="font-weight: bold; margin-left: -60px;">匹配剩余数量：</span> <span>${need.num}辆&nbsp;</span></div>
								</div>
									<div>
										<div><span style="font-weight: bold;">内饰颜色：</span> <span>${need.incolor}&nbsp;</span></div>
										<div><span style="font-weight: bold; margin-left: -30px;">匹配数量：</span> <span>${need.num3}辆&nbsp;</span></div>
										<div></div>
							</li>
							<li class="left-bottom vinnum">
								<div style="margin-top: 15px; margin-left: 45px;"><span style="font-weight: bold;">是否匹配库存：</span> <c:choose>
										<c:when test="${1 eq need.matching}">
											<input type="radio" checked="checked" disabled>
									是 <input type="radio" style="margin-left: 60px;" disabled> 否</c:when>
										<c:otherwise>
											<input type="radio" disabled>
									是 <input type="radio" style="margin-left: 60px;" checked="checked" disabled> 否
									</c:otherwise>
									</c:choose>
									</h3></div> <c:if test="${need.matching==1 }">
									<div class="hideVin">
										<div style="margin-top: 15px; margin-left: 75px;"><span style="font-weight: bold;">库存数量：</span> <input type="text" class="num3" value="${need.num3 }" disabled></div>
										<div style="margin-top: 15px;"><span style="font-weight: bold;">添加对应库存车架号：</span></div> <c:forEach items="${need.vinlst }" var="vin">
											<div style="margin-top: 15px; margin-left: 90px;" class="addvin"><span style="font-weight: bold;">车架号：</span> <input type="text" value="${vin.vin }"
												class="vin" disabled></div>
										</c:forEach>
									</div>
								</c:if>
							</li>
						</c:forEach>
				</ul>
			</li>
		</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;"><a href="javascript:void(0);" class="btn63_02 margin_let10" onclick="back()">返回</a></div>
		</div></div>
</body> <script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script> <script type="text/javascript">
	function back(){
		location.href=$('#mallNeedAudit').val() + "?currpage=" + $('#currpage').val();
	}
</script>