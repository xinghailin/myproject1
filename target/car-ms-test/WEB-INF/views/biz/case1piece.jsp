<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h4 class="du-title" style="margin-top: 30px">1.申请表（1张 正面 必选）</h4>
<div class="form-inline"><img src="${contextPath}${risk.applybill}" alt="点击放大" class="img-thumbnail"></div>
<h4 class="du-title">2.身份证（2张 正反面 必选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst2}">
		<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
	</c:forEach></div>
<h4 class="du-title">3.驾驶证（1张 必选）</h4>
<div class="form-inline"><img src="${contextPath}${risk.driverprove}" alt="点击放大" class="img-thumbnail"></div>
<h4 class="du-title">4.工作证明（1张 必选）</h4>
<div class="form-inline"><img src="${contextPath}${risk.workprove}" alt="点击放大" class="img-thumbnail"></div>
<h4 class="du-title">5.征信报告（多张 必选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst5}">
		<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
	</c:forEach></div>
<h4 class="du-title">6.工资卡或经营走账卡（多张 正面 必选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst6}">
		<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
	</c:forEach></div>
<h4 class="du-title">7.流水（多张 必选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst7}">
		<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
	</c:forEach></div>
<h4 class="du-title">8.房产证（多张 必选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst8}">
		<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
	</c:forEach></div>
<h4 class="du-title">9.结婚证（1张 非必选）</h4>
<div class="form-inline"><c:if test="${not empty risk.marryprove}">
		<img src="${contextPath}${risk.marryprove}" alt="点击放大" class="img-thumbnail">
	</c:if></div>
<h4 class="du-title">10.担保人身份证（多张 正反面 非必选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst10}">
		<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
	</c:forEach></div>